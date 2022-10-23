package com.jdc.jpwords.model.dto.result;

import java.util.List;

import com.jdc.jpwords.model.entity.Words;

public record WordDetailsResult(
		WordResult word,
		List<ReviewResult> reviews
		) {

	public static WordDetailsResult from(Words e) {
		return new WordDetailsResult(WordResult.from(e), ReviewResult.from(e.getReview()));
	}
}
