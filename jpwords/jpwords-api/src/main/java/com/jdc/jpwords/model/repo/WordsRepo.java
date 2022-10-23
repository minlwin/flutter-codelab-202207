package com.jdc.jpwords.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Words;

public interface WordsRepo extends JpaRepository<Words, Long>, JpaSpecificationExecutor<Words>{

}
