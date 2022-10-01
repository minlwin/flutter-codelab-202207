package com.jdc.locations.api.advices;

import javax.persistence.EntityNotFoundException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.jdc.locations.model.dto.ErrorResult;

@RestControllerAdvice
public class EntityNotFoundExceptionHandler {
	
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	@ExceptionHandler(EntityNotFoundException.class)
	ErrorResult handle(EntityNotFoundException e) {
		return new ErrorResult(e.getMessage());
	}
}
