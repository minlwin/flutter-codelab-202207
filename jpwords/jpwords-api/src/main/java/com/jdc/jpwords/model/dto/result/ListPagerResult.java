package com.jdc.jpwords.model.dto.result;

import java.util.List;

public record ListPagerResult<T>(
		List<T> result,
		PageInfo page
		) {

}
