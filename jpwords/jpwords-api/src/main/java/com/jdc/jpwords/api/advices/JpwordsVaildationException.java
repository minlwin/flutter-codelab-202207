package com.jdc.jpwords.api.advices;

import java.util.List;

import org.springframework.validation.BindingResult;

public class JpwordsVaildationException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	private List<String> messages;
	
	public JpwordsVaildationException(BindingResult result) {
		messages = result.getFieldErrors()
				.stream().map(a -> a.getDefaultMessage())
				.toList();
	}
	
	public List<String> getMessages() {
		return messages;
	}
}
