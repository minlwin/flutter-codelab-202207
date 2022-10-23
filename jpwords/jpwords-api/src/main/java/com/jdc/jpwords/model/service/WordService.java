package com.jdc.jpwords.model.service;

import static com.jdc.jpwords.model.service.utils.SpecificationUtils.spec;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.form.WordForm;
import com.jdc.jpwords.model.dto.result.WordDetailsResult;
import com.jdc.jpwords.model.dto.result.WordResult;
import com.jdc.jpwords.model.entity.Words;
import com.jdc.jpwords.model.repo.LessonRepo;
import com.jdc.jpwords.model.repo.WordsRepo;

@Service
@Transactional(readOnly = true)
public class WordService {
	
	@Autowired
	private WordsRepo repo;
	@Autowired
	private LessonRepo lessonRepo;

	@Transactional
	public WordResult create(WordForm form) {
		var entity = form.entity();
		entity.setLesson(lessonRepo.getReferenceById(form.lessonId()));
		return WordResult.from(repo.save(entity));
	}

	@Transactional
	public WordResult update(long id, WordForm form) {
		return repo.findById(id).map(entity -> {
			entity.setApproved(form.approved());
			entity.setDefinition(form.definition());
			entity.setWord(form.word());
			entity.setPhonetic(form.phonetic());
			return entity;
		}).map(WordResult::from).orElseThrow(() -> new JpwordsNotFoundException(Words.class, id));
	}

	public WordDetailsResult findById(long id) {
		return repo.findById(id).map(WordDetailsResult::from).orElseThrow(() -> new JpwordsNotFoundException(Words.class, id));
	}

	public List<WordResult> search(Optional<Integer> bookId, Optional<Integer> lessonId, Optional<String> keyword) {
		return repo.findAll(spec(bookId, this::byBookId).and(spec(lessonId, this::byLessonId).and(spec(keyword, this::byKeyword))))
				.stream().map(WordResult::from).toList();
	}
	
	private Specification<Words> byBookId(int id) {
		return (root, query, cb) -> cb.equal(root.get("lesson").get("book").get("id"), id);
	}

	private Specification<Words> byLessonId(int id) {
		return (root, query, cb) -> cb.equal(root.get("lesson").get("id"), id);
	}

	private Specification<Words> byKeyword(String keyword) {
		return (root, query, builder) -> builder.or(
				builder.like(root.get("word"), "%%%s%%".formatted(keyword)), 
				builder.like(root.get("phonetic"), "%%%s%%".formatted(keyword))
				);
	}
}
