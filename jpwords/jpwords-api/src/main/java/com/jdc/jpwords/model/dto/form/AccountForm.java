package com.jdc.jpwords.model.dto.form;

import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;

public record AccountForm(
		String email,
		String name,
		Role role,
		boolean expired
		) {
	
	public Account entity() {
		return new Account(email, name, expired, role);
	}
}
