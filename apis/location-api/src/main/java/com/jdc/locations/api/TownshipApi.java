package com.jdc.locations.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.locations.model.dto.TownshipDto;
import com.jdc.locations.model.service.TownshipService;

@RestController
@RequestMapping("township")
public class TownshipApi {
	
	@Autowired
	private TownshipService service;

	@GetMapping
	List<TownshipDto> search(
			@RequestParam Optional<Integer> stateId,
			@RequestParam Optional<String> name
	) {
		return service.search(stateId, name);
	}
	
	@GetMapping("{id}")
	TownshipDto findById(@PathVariable int id) {
		return service.findById(id);
	}
}
