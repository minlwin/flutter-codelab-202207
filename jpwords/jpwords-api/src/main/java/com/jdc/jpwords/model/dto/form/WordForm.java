package com.jdc.jpwords.model.dto.form;

import java.util.List;

import com.jdc.jpwords.model.entity.Words;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record WordForm(
		@NotBlank(message = "Please enter word.")
		String word, 
		@Min(value = 1, message = "Please select lesson.")
		int lessonId, 
		@NotBlank(message = "Please enter phonetic for word.")
		String phonetic, 
		@NotNull(message = "Please enter definitions.")
		List<String> definition, 
		boolean approved) {

	public Words entity() {
		return new Words(word, phonetic, definition, approved);
	}
}
