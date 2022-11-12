package com.jdc.jpwords.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jdc.jpwords.model.JpwordsBusinessException;
import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.result.LessonResult;
import com.jdc.jpwords.model.entity.Book;
import com.jdc.jpwords.model.entity.Lesson;
import com.jdc.jpwords.model.repo.BookRepo;
import com.jdc.jpwords.model.repo.LessonRepo;

@Service
public class LessonUploadService {

	@Autowired
	private BookRepo bookRepo;
	@Autowired
	private LessonRepo lessonRepo;
	
	@Transactional
	public List<LessonResult> upload(int bookId, MultipartFile file) {
		
		var book = bookRepo.findById(bookId).orElseThrow(() -> new JpwordsNotFoundException(Book.class, bookId));
		
		try(var reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
			
			String line = null;
			
			while(null != (line = reader.readLine())) {
				var array = line.split("\t");
				
				if(array.length == 2) {
					
					var lesson = lessonRepo.findOneByBookIdAndTitle(bookId, array[0])
							.orElse(new Lesson());
					
					lesson.setBook(book);
					lesson.setTitle(array[0]);
					lesson.setDescription(array[1]);
					
					lessonRepo.save(lesson);
				}
			}
			
			return lessonRepo.findByBookId(bookId)
					.stream().map(LessonResult::from).toList();
			
		} catch (IOException e) {
			throw new JpwordsBusinessException("File format error.");
		}
	}
	
	
	
}
