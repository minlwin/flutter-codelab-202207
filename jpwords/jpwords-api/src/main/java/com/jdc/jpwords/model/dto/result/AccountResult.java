package com.jdc.jpwords.model.dto.result;

import com.jdc.jpwords.model.entity.Account;
import com.jdc.jpwords.model.entity.Account.Role;

public record AccountResult(
		int id,
		String email,
		String name,
		Role role,
		boolean expired
		) {

	public static AccountResult from(Account entity) {
		return new AccountResult(entity.getId(), entity.getEmail(), entity.getName(), entity.getRole(), entity.isExpired());
	}
}
