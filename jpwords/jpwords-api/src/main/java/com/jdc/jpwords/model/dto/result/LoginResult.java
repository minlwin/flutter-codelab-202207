package com.jdc.jpwords.model.dto.result;

import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;

public record LoginResult(
		String name,
		String email,
		Role role
) {

	public LoginResult(Account account) {
		this(account.getName(), account.getEmail(), account.getRole());
	}
}
