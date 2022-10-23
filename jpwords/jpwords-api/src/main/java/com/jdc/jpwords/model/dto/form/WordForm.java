package com.jdc.jpwords.model.dto.form;

import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.jdc.jpwords.model.entity.Words;

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
