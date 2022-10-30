package com.jdc.jpwords;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class JpwordsApiWeb implements WebMvcConfigurer{

	@Value("${app.jwt.token.name}")
	private String tokenName;

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
			.allowedOrigins("*")
			.allowedMethods("*")
			.exposedHeaders(tokenName);
	}
	
}
