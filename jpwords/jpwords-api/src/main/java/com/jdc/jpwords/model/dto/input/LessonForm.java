package com.jdc.jpwords.model.dto.input;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

public record LessonForm(
		int id, 
		@Min(value = 1, message = "Please select book of lesson.")
		int bookId, 
		@NotBlank(message = "Please enter lesson title.")
		String title, 
		@NotBlank(message = "Please enter description of lesson.")
		String description
		) {

}
