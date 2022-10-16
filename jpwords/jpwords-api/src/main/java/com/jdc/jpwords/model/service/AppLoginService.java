package com.jdc.jpwords.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jdc.jpwords.model.dto.input.LoginForm;
import com.jdc.jpwords.model.dto.output.LoginResult;
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

}
