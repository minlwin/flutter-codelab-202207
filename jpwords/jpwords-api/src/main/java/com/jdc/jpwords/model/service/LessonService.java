package com.jdc.jpwords.model.service;

import static com.jdc.jpwords.model.service.utils.SpecificationUtils.spec;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.form.LessonForm;
import com.jdc.jpwords.model.dto.result.LessonResult;
import com.jdc.jpwords.model.entity.Lesson;
import com.jdc.jpwords.model.repo.BookRepo;
import com.jdc.jpwords.model.repo.LessonRepo;

@Service
@Transactional(readOnly = true)
public class LessonService {
	
	@Autowired
	private LessonRepo repo;
	@Autowired
	private BookRepo bookRepo;

	@Transactional
	public LessonResult save(LessonForm form) {
		var lesson = form.entity();
		lesson.setBook(bookRepo.getReferenceById(form.bookId()));
		return LessonResult.from(repo.save(lesson));
	}

	@Transactional
	public LessonResult update(int id, LessonForm form) {
		return repo.findById(id).map(entity -> {
			entity.setTitle(form.title());
			entity.setDescription(form.description());
			entity.setBook(bookRepo.getReferenceById(form.bookId()));
			return entity;
		}).map(LessonResult::from).orElseThrow(() -> new JpwordsNotFoundException(Lesson.class, id));
	}

	public LessonResult findById(int id) {
		return repo.findById(id).map(LessonResult::from).orElseThrow(() -> new JpwordsNotFoundException(Lesson.class, id));
	}

	public List<LessonResult> search(Optional<Integer> bookId, Optional<String> keyword) {
		return repo.findAll(spec(bookId, this::byBookId).and(spec(keyword, this::byKeyword)))
				.stream().map(LessonResult::from).toList();
	}
	
	private Specification<Lesson> byBookId(int id) {
		return (root, query, cb) -> cb.equal(root.get("book").get("id"), id);
	}

	private Specification<Lesson> byKeyword(String keyword) {
		return (root, query, builder) -> builder.or(
				builder.like(builder.lower(root.get("title")), "%%%s%%".formatted(keyword.toLowerCase())), 
				builder.like(builder.lower(root.get("description")), "%%%s%%".formatted(keyword.toLowerCase())) 
				);
	}


}
