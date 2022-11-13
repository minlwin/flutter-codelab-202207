package com.jdc.jpwords.model.service;


import static com.jdc.jpwords.model.SpecificationUtils.spec;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.BookDto;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.dto.result.PageInfo;
import com.jdc.jpwords.model.entity.Book;
import com.jdc.jpwords.model.entity.Book.Level;
import com.jdc.jpwords.model.repo.BookRepo;

@Service
@Transactional(readOnly = true)
public class BookService {
	
	@Autowired
	private BookRepo repo;

	public BookDto findById(int id) {
		return repo.findById(id).map(BookDto::from).orElseThrow(() -> new JpwordsNotFoundException(Book.class, id));
	}

	@Transactional
	public BookDto save(BookDto dto) {
		return Optional.of(repo.save(dto.entity())).map(BookDto::from).orElseThrow(() -> new JpwordsNotFoundException(Book.class, dto.id()));
	}
		
	public ListPagerResult<BookDto> search(Optional<Level> level, Optional<String> keyword, PageInput pageInput) {
		var criteria = spec(level, this::byLevel).and(spec(keyword, this::byKeyword));
		
		var list = repo.findAll(criteria, pageInput.get())
				.stream().map(BookDto::from).toList();
		
		var count = repo.count(criteria);
		
		return new ListPagerResult<>(list, PageInfo.from(pageInput, count));
	}

	private Specification<Book> byLevel(Level level) {
		return (root, query, builder) -> builder.equal(root.get("level"), level);
	}

	private Specification<Book> byKeyword(String keyword) {
		return (root, query, builder) -> builder.or(
				builder.like(builder.lower(root.get("title")), "%%%s%%".formatted(keyword.toLowerCase())), 
				builder.like(builder.lower(root.get("description")), "%%%s%%".formatted(keyword.toLowerCase())) 
				);
	}
}
