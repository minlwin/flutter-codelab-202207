package com.jdc.jpwords.model.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Lesson;

public interface LessonRepo extends JpaRepository<Lesson, Integer>, JpaSpecificationExecutor<Lesson>{

	Optional<Lesson> findOneByBookIdAndTitle(int bookId, String title);
	
	List<Lesson> findByBookId(int bookId);
}
