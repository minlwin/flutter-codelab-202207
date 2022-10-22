package com.jdc.jpwords.model.dto.output;

import java.util.List;

public record ErrorResult(
		Type type,
		List<String> messages) {

	public enum Type {
		Validation, Business, Platform
	}
}
