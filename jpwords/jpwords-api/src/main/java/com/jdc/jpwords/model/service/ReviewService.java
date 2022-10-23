package com.jdc.jpwords.model.service;

import static com.jdc.jpwords.model.service.utils.SpecificationUtils.spec;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.form.ReviewForm;
import com.jdc.jpwords.model.dto.result.ReviewResult;
import com.jdc.jpwords.model.entity.Review;
import com.jdc.jpwords.model.repo.AccountRepo;
import com.jdc.jpwords.model.repo.ReviewRepo;
import com.jdc.jpwords.model.repo.WordsRepo;

@Service
@Transactional
public class ReviewService {
	
	@Autowired
	private ReviewRepo repo;
	@Autowired
	private WordsRepo wordRepo;
	@Autowired
	private AccountRepo accountRepo;

	public ReviewResult create(ReviewForm form) {
		var entity = form.entity();
		entity.setReviewer(accountRepo.getReferenceById(form.reviewerId()));
		entity.setWord(wordRepo.getReferenceById(form.wordId()));
		return ReviewResult.from(repo.save(entity));
	}

	public ReviewResult update(long id, ReviewForm form) {
		return repo.findById(id)
				.map(entity -> {
					entity.setVote(form.vote());
					entity.setRemark(form.remark());
					return entity;
				})
				.map(ReviewResult::from).orElseThrow(() -> new JpwordsNotFoundException(Review.class, id));
	}

	@Transactional(readOnly = true)
	public List<ReviewResult> search(Optional<Long> wordId, Optional<Integer> lessonId, Optional<Integer> bookId,
			Optional<Integer> accountId) {
		return repo.findAll(spec(wordId, this::byWordId).and(spec(lessonId, this::byLessonId).and(spec(bookId, this::byBookId).and(spec(accountId, this::byAccountId)))))
				.stream().map(ReviewResult::from).toList();
	}
	
	private Specification<Review> byWordId(long id) {
		return (root, query, cb) -> cb.equal(root.get("word").get("id"), id);
	}
	
	private Specification<Review> byLessonId(int id) {
		return (root, query, cb) -> cb.equal(root.get("word").get("lesson").get("id"), id);
	}
	
	private Specification<Review> byBookId(int id) {
		return (root, query, cb) -> cb.equal(root.get("word").get("lesson").get("book").get("id"), id);
	}
	
	private Specification<Review> byAccountId(int id) {
		return (root, query, cb) -> cb.equal(root.get("reviewer").get("id"), id);
	}

}
