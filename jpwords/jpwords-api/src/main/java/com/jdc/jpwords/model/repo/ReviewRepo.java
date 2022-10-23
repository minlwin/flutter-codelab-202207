package com.jdc.jpwords.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Review;

public interface ReviewRepo extends JpaRepository<Review, Long>, JpaSpecificationExecutor<Review>{

}
