package com.jdc.jpwords.api.advices;

import java.util.List;

public class JpwordsNotFoundException extends JpwordsVaildationException{

	private static final long serialVersionUID = 1L;
	
	public JpwordsNotFoundException(Class<?> entity, Number id) {
		super(List.of("There is no %s data with id %d.".formatted(entity.getSimpleName(), id)));
	}

}
