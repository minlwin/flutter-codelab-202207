package com.jdc.jpwords.model.dto.form;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public record PageInput(
		Integer current,
		Integer size
		) {
	
	public Pageable get() {
		
		if(null != current && null != size) {
			return PageRequest.of(current, size);
		}
		
		if(null != size) {
			return Pageable.ofSize(size);
		}
		
		return Pageable.unpaged();
	}
}
