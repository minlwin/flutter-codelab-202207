package com.jdc.jpwords.model.service.utils;

import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.jpa.domain.Specification;

public class SpecificationUtils {

	public static <T, R> Specification<R> fromOptional(Optional<T> optional, Function<T, Specification<R>> function) {
		return optional.map(function::apply).orElse(Specification.where(null));
	}

}
