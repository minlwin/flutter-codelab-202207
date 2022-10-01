package com.jdc.locations.model.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jdc.locations.model.dto.StateDto;
import com.jdc.locations.model.entity.State;
import com.jdc.locations.model.repository.StateRepo;

@Service
public class StateService {
	
	@Autowired
	private StateRepo repo;

	public List<StateDto> search(Optional<String> region, Optional<String> nameLike) {
		
		Specification<State> spec = Specification.where(null);
		
		var specRegion = region.filter(StringUtils::hasLength)
				.map(value -> {
					Specification<State> where = (root, query, cb) -> cb.equal(root.get("region"), value);
					return where;
				}).orElse(Specification.where(null));
		
		spec = spec.and(specRegion);
		
		var specNameLike = nameLike.filter(StringUtils::hasLength)
				.map(value -> {
					Specification<State> where = (root, query, cb) -> cb.like(cb.lower(root.get("name")), 
							value.toLowerCase().concat("%"));
					return where;
				}).orElse(Specification.where(null));
		
		spec = spec.and(specNameLike);
		
		
		return repo.findAll(spec).stream().map(StateDto::new).toList();
	}

	public StateDto findById(int id) {
		return repo.findById(id).map(StateDto::new)
				.orElseThrow(() -> new EntityNotFoundException("There is no state with id %d.".formatted(id)));
	}
}
