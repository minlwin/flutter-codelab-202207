package com.jdc.jpwords.model.dto.output;

import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;

public record LoginResult(
		String name,
		String email,
		Role role,
		boolean activated
) {

	public LoginResult(Account account) {
		this(account.getName(), account.getEmail(), account.getRole(), account.isActivated());
	}
}
