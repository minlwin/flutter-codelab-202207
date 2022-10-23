package com.jdc.jpwords.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Book;

public interface BookRepo extends JpaRepository<Book, Integer>, JpaSpecificationExecutor<Book>{

}
