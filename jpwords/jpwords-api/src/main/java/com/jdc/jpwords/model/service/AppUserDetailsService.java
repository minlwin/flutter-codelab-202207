package com.jdc.jpwords.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jdc.jpwords.model.repo.AccountRepo;

@Service
public class AppUserDetailsService implements UserDetailsService{
	
	@Autowired
	private AccountRepo repo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		return repo.findOneByEmail(email)
				.map(account -> User.builder()
						.username(email)
						.password(account.getPassword())
						.accountExpired(account.isExpired())
						.authorities(AuthorityUtils.commaSeparatedStringToAuthorityList(account.getRole().name()))
						.build())
				.orElseThrow(() -> new UsernameNotFoundException(email));
	}

}
