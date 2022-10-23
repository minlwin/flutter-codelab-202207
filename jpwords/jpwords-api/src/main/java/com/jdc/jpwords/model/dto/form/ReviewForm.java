package com.jdc.jpwords.model.dto.form;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.jdc.jpwords.model.entity.Review;
import com.jdc.jpwords.model.entity.Review.Vote;

public record ReviewForm(
		@Min(value = 1, message = "Please select word.")
		int wordId,
		@Min(value = 1, message = "Please define reviewr.")
		int reviewerId,
		@NotNull(message = "Please select vote.")
		Vote vote,
		@NotBlank(message = "Please enter review reason.")
		String remark) {

	public Review entity() {
		return new Review(vote, remark);
	}
}
