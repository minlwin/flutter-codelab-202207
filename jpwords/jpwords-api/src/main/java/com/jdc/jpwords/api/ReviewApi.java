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
import com.jdc.jpwords.model.dto.form.ReviewForm;
import com.jdc.jpwords.model.dto.result.ReviewResult;
import com.jdc.jpwords.model.service.ReviewService;

@RestController
@RequestMapping("review")
public class ReviewApi {
	
	@Autowired
	private ReviewService service;

	@GetMapping
	List<ReviewResult> search(
			@RequestParam Optional<Long> wordId,
			@RequestParam Optional<Integer> lessonId,
			@RequestParam Optional<Integer> bookId,
			@RequestParam Optional<Integer> accountId
			) {
		return service.search(wordId, lessonId, bookId, accountId);
	}
	
	@PostMapping
	ReviewResult create(@RequestBody @Validated ReviewForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.create(form);
	}
	
	@PutMapping("{id}")
	ReviewResult update(
			@PathVariable long id, 
			@RequestBody @Validated ReviewForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.update(id, form);
	}
}
