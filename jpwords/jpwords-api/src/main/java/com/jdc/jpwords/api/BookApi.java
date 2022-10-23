package com.jdc.jpwords.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.jpwords.api.advices.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.BookDto;
import com.jdc.jpwords.model.entity.Book.Level;
import com.jdc.jpwords.model.service.BookService;

@RestController
@RequestMapping("book")
public class BookApi {
	
	@Autowired
	private BookService service;

	@GetMapping
	List<BookDto> search(
			@RequestParam Optional<Level> level,
			@RequestParam Optional<String> keyword
			) {
		return service.search(level, keyword);
	}
	
	@GetMapping("{id}")
	BookDto findById(@PathVariable int id) {
		return service.findById(id);
	}
	
	@PostMapping
	BookDto create(@RequestBody @Validated BookDto dto, BindingResult result) {
		
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.save(dto);
	}

	@PutMapping
	BookDto update(@RequestBody @Validated BookDto dto, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.save(dto);
	}
}
