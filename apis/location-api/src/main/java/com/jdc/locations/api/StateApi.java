package com.jdc.locations.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.locations.model.dto.StateDto;
import com.jdc.locations.model.service.StateService;

@RestController
@RequestMapping("state")
public class StateApi {
	
	@Autowired
	private StateService service;
	
	@GetMapping
	List<StateDto> search(
			@RequestParam Optional<String> region,
			@RequestParam Optional<String> name
			) {
		return service.search(region, name);
	}
	
	@GetMapping("{id}")
	StateDto findById(@PathVariable int id) {
		return service.findById(id);
	}
}
