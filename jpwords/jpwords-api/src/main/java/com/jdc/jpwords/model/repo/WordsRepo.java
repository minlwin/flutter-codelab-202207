package com.jdc.jpwords.model.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Words;

public interface WordsRepo extends JpaRepository<Words, Long>, JpaSpecificationExecutor<Words>{

	Optional<Words> findOneByLessonIdAndWord(int lessonId, String word);
	
	List<Words> findByLessonId(int lessonId);
}
