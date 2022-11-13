package com.jdc.jpwords.model.service;

import static com.jdc.jpwords.model.SpecificationUtils.spec;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.jpwords.model.JpwordsNotFoundException;
import com.jdc.jpwords.model.dto.form.AccountForm;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.result.AccountResult;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.dto.result.PageInfo;
import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;
import com.jdc.jpwords.model.repo.AccountRepo;

@Service
public class AccountService {
	
	@Autowired
	private AccountRepo repo;
	@Autowired
	private PasswordEncoder encoder;

	@Transactional
	public AccountResult create(AccountForm form) {
		var entity = form.entity();
		entity.setPassword(encoder.encode(form.name()));
		entity = repo.save(entity);
		return AccountResult.from(entity);
	}

	@Transactional
	public AccountResult update(int id, AccountForm form) {
		return repo.findById(id).map(entity -> {
			entity.setName(form.name());
			entity.setExpired(form.expired());
			entity.setRole(form.role());
			entity.setExpired(form.expired());
			return entity;
		}).map(AccountResult::from).orElseThrow(() -> new JpwordsNotFoundException(Account.class, id));
		
	}

	public AccountResult findById(int id) {
		return repo.findById(id)
				.map(AccountResult::from)
				.orElseThrow(() -> new JpwordsNotFoundException(Account.class, id));
	}
	
	public ListPagerResult<AccountResult> search(Optional<Role> role, Optional<String> name, PageInput page) {	
		
		// Search Criteria
		var criteria = spec(role, this::byRole).and(spec(name, this::byName));
		
		// Search Result
		var list = repo.findAll(criteria, page.get())
				.stream()
				.map(AccountResult::from).toList();
		
		var count = repo.count(criteria);
		
		return new ListPagerResult<>(list, PageInfo.from(page, count));
	}
	
	private Specification<Account> byRole(Role role) {
		return (root, query, builder) -> 
			builder.equal(root.get("role"), role);
	}
	
	private Specification<Account> byName(String name) {
		return (root, query, builder) -> 
			builder.like(builder.lower(root.get("name")), name.toLowerCase().concat("%"));
	}


}
