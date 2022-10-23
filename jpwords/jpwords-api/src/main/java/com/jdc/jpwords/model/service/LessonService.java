package com.jdc.jpwords.model.service;

import static com.jdc.jpwords.model.service.utils.SpecificationUtils.fromOptional;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.api.advices.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.LessonDto;
import com.jdc.jpwords.model.dto.input.LessonForm;
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
	public LessonDto save(LessonForm form) {
		
		var lesson = repo.findById(form.id()).orElse(new Lesson());
		lesson.setTitle(form.title());
		lesson.setDescription(form.description());
		lesson.setBook(bookRepo.getReferenceById(form.bookId()));
		
		return LessonDto.from(repo.save(lesson));
	}

	public LessonDto findById(int id) {
		return repo.findById(id).map(LessonDto::from).orElseThrow(() -> new JpwordsNotFoundException(Lesson.class, id));
	}

	public List<LessonDto> search(Optional<Integer> bookId, Optional<String> keyword) {
		return repo.findAll(fromOptional(bookId, this::byBookId).and(fromOptional(keyword, this::byKeyword)))
				.stream().map(LessonDto::from).toList();
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
