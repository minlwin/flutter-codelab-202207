package com.jdc.jpwords.api.advices;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.jdc.jpwords.model.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.result.ErrorResult;
import com.jdc.jpwords.model.dto.result.ErrorResult.Type;

@RestControllerAdvice
public class JpwordsAppExceptionHandler {

	@ExceptionHandler(JpwordsVaildationException.class)
	@ResponseStatus(code = HttpStatus.UNPROCESSABLE_ENTITY)
	ErrorResult handle(JpwordsVaildationException e) {
		return new ErrorResult(Type.Validation, e.getMessages());
	}
	
}
