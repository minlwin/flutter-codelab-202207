package com.jdc.jpwords.model.dto.result;

import com.jdc.jpwords.model.dto.BookDto;
import com.jdc.jpwords.model.entity.Lesson;

public record LessonResult(
		int id, 
		BookDto book, 
		String title, 
		String description
		) {
	
	public static LessonResult from(Lesson entity) {
		return new LessonResult(entity.getId(), BookDto.from(entity.getBook()), entity.getTitle(), entity.getDescription());
	}

}
