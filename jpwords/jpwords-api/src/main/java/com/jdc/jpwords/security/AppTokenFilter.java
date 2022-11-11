package com.jdc.jpwords.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

@Service
public class AppTokenFilter extends OncePerRequestFilter{
	
	@Autowired
	private AppTokenProvider provider;
	
	@Value("${app.jwt.token.name}")
	private String tokenName;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		var token = request.getHeader(tokenName);
		
		if(StringUtils.hasLength(token)) {
			try {
				provider.authenticate(token);
			} catch (Exception e) {
				System.out.println("Bad Token, continue request.");
			}
		}
		
		filterChain.doFilter(request, response);	
	}

}
