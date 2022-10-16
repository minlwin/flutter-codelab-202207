package com.jdc.jpwords.model.dto.input;

import javax.validation.constraints.NotBlank;

public record LoginForm(
		@NotBlank(message = "Please enter email.")
		String email,
		@NotBlank(message = "Please enter password.")
		String password
) {

}
