package com.jdc.jpwords.model.dto.form;

import com.jdc.jpwords.model.entity.Review;
import com.jdc.jpwords.model.entity.Review.Vote;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ReviewForm(
		@Min(value = 1, message = "Please select word.")
		long wordId,
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
