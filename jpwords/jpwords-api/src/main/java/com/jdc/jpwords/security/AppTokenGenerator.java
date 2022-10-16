package com.jdc.jpwords.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@RestControllerAdvice
public class AppTokenGenerator implements ResponseBodyAdvice<Object>{
	
	@Autowired
	private AppTokenProvider provider;
	@Value("${app.jwt.token.name}")
	private String tokenName;

	@Override
	public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
		return true;
	}

	@Override
	public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType,
			Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request,
			ServerHttpResponse response) {
		
		if(response instanceof ServletServerHttpResponse resp) {
			
			var auth = SecurityContextHolder.getContext().getAuthentication();
			
			if(null != auth && auth.isAuthenticated()) {
				
				if(auth instanceof UsernamePasswordAuthenticationToken authentication) {
					provider.generate(authentication)
						.ifPresent(token -> resp.getHeaders().add(tokenName, token));
				}
				
			}
		}
		
		return body;
	}

}
