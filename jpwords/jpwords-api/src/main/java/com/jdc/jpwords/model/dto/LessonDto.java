package com.jdc.jpwords.model.dto;

import com.jdc.jpwords.model.entity.Lesson;

public record LessonDto(
		int id, 
		BookDto book, 
		String title, 
		String description
		) {
	
	public static LessonDto from(Lesson entity) {
		return new LessonDto(entity.getId(), BookDto.from(entity.getBook()), entity.getTitle(), entity.getDescription());
	}

}
