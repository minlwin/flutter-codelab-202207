package com.jdc.jpwords.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jdc.jpwords.model.JpwordsBusinessException;
import com.jdc.jpwords.model.dto.form.LoginForm;
import com.jdc.jpwords.model.dto.result.LoginResult;
import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.repo.AccountRepo;

@Service
public class AppLoginService {
	
	@Autowired
	private AuthenticationManager authManager;
	@Autowired
	private AccountRepo repo;

	public LoginResult login(LoginForm form) {
		var auth = authManager.authenticate(new UsernamePasswordAuthenticationToken(form.email(), form.password()));
		SecurityContextHolder.getContext().setAuthentication(auth);
		return repo.findOneByEmail(form.email())
				.map(LoginResult::new)
				.orElseThrow();
	}
	
	public Account getLoginUser() {
		return repo.findOneByEmail(SecurityContextHolder.getContext().getAuthentication().getName())
				.orElseThrow(() -> new JpwordsBusinessException("There is no login user."));
	}

}
