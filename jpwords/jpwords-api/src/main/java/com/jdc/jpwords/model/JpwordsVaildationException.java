package com.jdc.jpwords.model;

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
	
	protected JpwordsVaildationException(List<String> messages) {
		this.messages = messages;
	}
	
	public List<String> getMessages() {
		return messages;
	}
}
