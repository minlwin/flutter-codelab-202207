package com.jdc.jpwords.model.dto.form;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.jdc.jpwords.model.entity.Lesson;

public record LessonForm(
		@Min(value = 1, message = "Please select book of lesson.")
		int bookId, 
		@NotBlank(message = "Please enter lesson title.")
		String title, 
		@NotBlank(message = "Please enter description of lesson.")
		String description
		) {

	public Lesson entity() {
		return new Lesson(title, description);
	}
}
