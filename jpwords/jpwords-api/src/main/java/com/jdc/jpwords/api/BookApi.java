package com.jdc.jpwords.api;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.jpwords.model.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.BookDto;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.entity.Book.Level;
import com.jdc.jpwords.model.service.BookService;

@RestController
@RequestMapping("book")
public class BookApi {
	
	@Autowired
	private BookService service;

	@GetMapping
	ListPagerResult<BookDto> search(
			@RequestParam Optional<Level> level,
			@RequestParam Optional<String> keyword,
			@RequestHeader(required = false) Integer current,
			@RequestHeader(required = false) Integer size) {
		return service.search(level, keyword, new PageInput(current, size));
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
