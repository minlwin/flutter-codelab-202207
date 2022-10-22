package com.jdc.jpwords.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.jpwords.api.advices.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.input.LoginForm;
import com.jdc.jpwords.model.dto.output.LoginResult;
import com.jdc.jpwords.model.service.AppLoginService;

@RestController
@RequestMapping("security")
public class SecurityApi {
	
	@Autowired
	private AppLoginService service;

	@PostMapping("login")
	LoginResult login(
			@Validated @RequestBody LoginForm form, 
			BindingResult result) {
		
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		
		return service.login(form);
	}
}
