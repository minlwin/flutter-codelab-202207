package com.jdc.jpwords.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;
import com.jdc.jpwords.model.repo.AccountRepo;

@Component
public class AdminUserInitializer {
	
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private AccountRepo repo;
	
	@Value("${admin.name}") String name; 
	@Value("${admin.mail}") String email; 
	@Value("${admin.pass}") String password;

	@EventListener(classes = ContextRefreshedEvent.class)
	void initUser() {
		
		if(repo.count() == 0) {
			var user = new Account();
			user.setActivated(true);
			user.setRole(Role.Admin);
			user.setName(name);
			user.setPassword(encoder.encode(password));
			user.setEmail(email);
			repo.save(user);
		}
		
	}
}
