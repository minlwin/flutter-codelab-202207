package com.jdc.locations.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.locations.model.entity.Township;

public interface TownshipRepo extends JpaRepository<Township, Integer>, JpaSpecificationExecutor<Township>{

}
