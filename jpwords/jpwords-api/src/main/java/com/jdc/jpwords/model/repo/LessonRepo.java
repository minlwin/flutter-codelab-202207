package com.jdc.jpwords.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Lesson;

public interface LessonRepo extends JpaRepository<Lesson, Integer>, JpaSpecificationExecutor<Lesson>{

}
