package com.jdc.jpwords.model.dto.result;

import java.util.List;

import com.jdc.jpwords.model.entity.Words;

import jakarta.validation.constraints.NotNull;

public record WordResult(
		long id,
		String word,
		@NotNull
		LessonResult lesson,
		String phonetic,
		List<String> definition,
		boolean approved
) {
	
	public static WordResult from(Words entity) {
		return new WordResult(entity.getId(), entity.getWord(), LessonResult.from(entity.getLesson()), 
				entity.getPhonetic(), entity.getDefinition(), entity.isApproved());
	}

}
