package com.jdc.jpwords.model;

import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.jpa.domain.Specification;

public class SpecificationUtils {

	public static <T, R> Specification<R> spec(Optional<T> optional, Function<T, Specification<R>> function) {
		return optional.map(function::apply).orElse(Specification.where(null));
	}

}
