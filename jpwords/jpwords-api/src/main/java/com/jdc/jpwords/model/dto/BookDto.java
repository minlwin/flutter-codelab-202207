package com.jdc.jpwords.model.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.jdc.jpwords.model.entity.Book;
import com.jdc.jpwords.model.entity.Book.Level;

public record BookDto(
		int id, 
		@NotBlank(message = "Please enter book title.")
		String title, 
		@NotNull(message = "Please select book level.")
		Level level, 
		@NotBlank(message = "Please enter book description.")
		String description
) {

	public static BookDto from(Book book) {
		return new BookDto(book.getId(), book.getTitle(), book.getLevel(), book.getDescription());
	}
	
	public Book entity() {
		return new Book(id, title, level, description);
	}
}
