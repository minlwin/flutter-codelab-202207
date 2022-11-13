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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jdc.jpwords.model.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.form.WordForm;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.dto.result.WordDetailsResult;
import com.jdc.jpwords.model.dto.result.WordResult;
import com.jdc.jpwords.model.entity.Book.Level;
import com.jdc.jpwords.model.service.WordService;
import com.jdc.jpwords.model.service.WordUploadService;


@RestController
@RequestMapping("word")
public class WordApi {
	
	@Autowired
	private WordService service;
	
	@Autowired
	private WordUploadService uploadService;

	@GetMapping
	ListPagerResult<WordResult> search(
			@RequestParam Optional<Level> level,
			@RequestParam Optional<Integer> bookId,
			@RequestParam Optional<Integer> lessonId,
			@RequestParam Optional<String> keyword,
			@RequestHeader(required = false) Integer current,
			@RequestHeader(required = false) Integer size) {
		return service.search(level, bookId, lessonId, keyword, new PageInput(current, size));
	}
	
	@PostMapping
	WordResult create(@RequestBody @Validated WordForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.create(form);
	}
	
	@PutMapping("{id}")
	WordResult update(@PathVariable long id, @RequestBody @Validated WordForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.update(id, form);
	}
	
	@GetMapping("{id}")
	WordDetailsResult findById(@PathVariable long id) {
		return service.findById(id);
	}
	
	@PostMapping("upload/{lessonId}")
	List<WordResult> upload(@PathVariable int lessonId, @RequestParam MultipartFile file) {
		return uploadService.upload(lessonId, file);
	}

}
