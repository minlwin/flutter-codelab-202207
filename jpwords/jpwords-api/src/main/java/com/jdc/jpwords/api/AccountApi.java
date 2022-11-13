package com.jdc.jpwords.api;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.jpwords.model.JpwordsVaildationException;
import com.jdc.jpwords.model.dto.form.AccountForm;
import com.jdc.jpwords.model.dto.form.PageInput;
import com.jdc.jpwords.model.dto.result.AccountResult;
import com.jdc.jpwords.model.dto.result.ListPagerResult;
import com.jdc.jpwords.model.entity.Account.Role;
import com.jdc.jpwords.model.service.AccountService;

@RestController
@RequestMapping("account")
public class AccountApi {
	
	@Autowired
	private AccountService service;

	@GetMapping
	ListPagerResult<AccountResult> search(
			@RequestParam Optional<Role> role, 
			@RequestParam Optional<String> name,
			@RequestHeader(required = false) Integer current,
			@RequestHeader(required = false) Integer size) {
		return service.search(role, name, new PageInput(current, size));
	}
	
	@PostMapping
	AccountResult create(@RequestBody AccountForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.create(form);
	}
	
	@PutMapping("{id}")
	AccountResult update(@PathVariable int id, @RequestBody @Validated AccountForm form, BindingResult result) {
		if(result.hasErrors()) {
			throw new JpwordsVaildationException(result);
		}
		return service.update(id, form);
	}
	
	@GetMapping("{id}")
	AccountResult findById(@PathVariable int id) {
		return service.findById(id);
	}
}
