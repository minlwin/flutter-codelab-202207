package com.jdc.jpwords.model;

import java.util.List;

public class JpwordsBusinessException extends JpwordsVaildationException{

	private static final long serialVersionUID = 1L;

	public JpwordsBusinessException(String message) {
		super(List.of(message));
	}
}
