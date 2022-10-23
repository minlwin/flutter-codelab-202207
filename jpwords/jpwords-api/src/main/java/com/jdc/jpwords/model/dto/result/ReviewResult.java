package com.jdc.jpwords.model.dto.result;

import java.util.List;

import com.jdc.jpwords.model.entity.Review;
import com.jdc.jpwords.model.entity.Review.Vote;

public record ReviewResult(
		long id,
		WordResult word,
		int reviewerId,
		String reviewer,
		Vote vote,
		String remark		
		) {

	public static ReviewResult from(Review e) {
		return new ReviewResult(e.getId(), WordResult.from(e.getWord()), 
				e.getReviewer().getId(), e.getReviewer().getName(), 
				e.getVote(), e.getRemark());
	}
	
	public static List<ReviewResult> from(List<Review> list) {
		return list.stream().map(ReviewResult::from).toList();
	}
}
