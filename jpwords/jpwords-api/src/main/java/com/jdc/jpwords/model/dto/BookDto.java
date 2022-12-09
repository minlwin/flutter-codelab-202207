package com.jdc.jpwords.model.dto;

import com.jdc.jpwords.model.entity.Book;
import com.jdc.jpwords.model.entity.Book.Level;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

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
