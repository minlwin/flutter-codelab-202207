package com.jdc.jpwords.model.dto.result;

import com.jdc.jpwords.model.dto.form.PageInput;

public record PageInfo(
		int current,
		int size,
		long total
		) {
	
	public static PageInfo from(PageInput input, long total) {
		return new PageInfo(input.current(), input.size(), total);
	}
}
