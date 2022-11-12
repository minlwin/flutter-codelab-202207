package com.jdc.jpwords.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jdc.jpwords.model.JpwordsBusinessException;
import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.result.WordResult;
import com.jdc.jpwords.model.entity.Lesson;
import com.jdc.jpwords.model.entity.Words;
import com.jdc.jpwords.model.repo.LessonRepo;
import com.jdc.jpwords.model.repo.WordsRepo;

@Service
public class WordUploadService {
	
	@Autowired
	private WordsRepo wordsRepo;
	@Autowired
	private LessonRepo lessonRepo;

	@Transactional
	public List<WordResult> upload(int lessonId, MultipartFile file) {
		
		var lesson = lessonRepo.findById(lessonId).orElseThrow(() -> new JpwordsNotFoundException(Lesson.class, lessonId));
		
		try(var reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
			
			String line = null;
			
			while(null != (line = reader.readLine())) {
				var array = line.split("\t");
				
				if(array.length == 3) {
					
					var word = wordsRepo.findOneByLessonIdAndWord(lessonId, array[0])
							.orElse(new Words());
					
					word.setLesson(lesson);
					word.setWord(array[0]);
					word.setPhonetic(array[1]);
					word.setDefinition(Arrays.asList(array[2].split(",")));
					word.setApproved(true);
					
					wordsRepo.save(word);
				}
			}
			
			return wordsRepo.findByLessonId(lessonId)
					.stream().map(WordResult::from).toList();
			
		} catch (IOException e) {
			throw new JpwordsBusinessException("File format error.");
		}
	}

}
