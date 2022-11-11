package com.jdc.jpwords.model.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.jpwords.model.entity.Account;

public interface AccountRepo extends JpaRepository<Account, Integer>, JpaSpecificationExecutor<Account>{

	Optional<Account> findOneByEmail(String email);
}
