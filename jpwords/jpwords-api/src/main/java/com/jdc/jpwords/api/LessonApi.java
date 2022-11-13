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
import com.jdc.jpwords.model.dto.form.LessonForm;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.result.LessonResult;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.service.LessonService;
import com.jdc.jpwords.model.service.LessonUploadService;

@RestController
@RequestMapping("lesson")
public class LessonApi {
	
	@Autowired
	private LessonService service;
	
	@Autowired
	private LessonUploadService uploadService;

	@GetMapping
	ListPagerResult<LessonResult> search(
			@RequestParam Optional<Integer> bookId,
			@RequestParam Optional<String> keyword,
			@RequestHeader(required = false) Integer current,
			@RequestHeader(required = false) Integer size) {
		return service.search(bookId, keyword, new PageInput(current, size));
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
	
	@PostMapping("upload/{bookId}")
	List<LessonResult> upload(@PathVariable int bookId, @RequestParam MultipartFile file) {
		return uploadService.upload(bookId, file);
	}
	
}
