package com.jdc.locations.model.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jdc.locations.model.dto.TownshipDto;
import com.jdc.locations.model.entity.Township;
import com.jdc.locations.model.repository.TownshipRepo;

@Service
public class TownshipService {

	@Autowired
	private TownshipRepo repo;
	
	public List<TownshipDto> search(Optional<Integer> divisionId, Optional<String> nameLike) {
		Specification<Township> spec = Specification.where(null);
		
		var specDivisionId = divisionId.filter(id -> id > 0).map(id -> {
			Specification<Township> where = (root, query, cb) -> cb.equal(root.get("state").get("id"), id);
			return where;
		}).orElse(Specification.where(null));
		
		spec = spec.and(specDivisionId);
		
		var specNameLike = nameLike.filter(StringUtils::hasLength)
				.map(value -> {
					Specification<Township> where = (root, query, cb) -> cb.like(cb.lower(root.get("name")), 
							value.toLowerCase().concat("%"));
					return where;
				}).orElse(Specification.where(null));
		
		spec = spec.and(specNameLike);
		
		return repo.findAll(spec).stream().map(TownshipDto::new).toList();
	}

	public TownshipDto findById(int id) {
		return repo.findById(id).map(TownshipDto::new)
				.orElseThrow(() -> new EntityNotFoundException("There is no township with id %d.".formatted(id)));
	}
	
}
