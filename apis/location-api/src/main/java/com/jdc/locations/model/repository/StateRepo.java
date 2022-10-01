package com.jdc.locations.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.locations.model.entity.State;

public interface StateRepo extends JpaRepository<State, Integer>, JpaSpecificationExecutor<State>{

}
