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

import com.jdc.jpwords.model.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.form.LessonForm;
import com.jdc.jpwords.model.dto.result.LessonResult;
import com.jdc.jpwords.model.service.LessonService;

@RestController
@RequestMapping("lesson")
public class LessonApi {
	
	@Autowired
	private LessonService service;

	@GetMapping
	List<LessonResult> search(
			@RequestParam Optional<Integer> bookId,
			@RequestParam Optional<String> keyword
	) {
		return service.search(bookId, keyword);
	}
	
	@GetMapping("{id}")
	LessonResult findById(@PathVariable int id) {
		return service.findById(id);
	}
	
	@PostMapping
	LessonResult create(@RequestBody @Validated LessonForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.save(form);
	}
	
	@PutMapping("{id}")
	LessonResult update(@PathVariable int id, @RequestBody @Validated LessonForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.update(id, form);
	}
	
}
