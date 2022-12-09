package com.jdc.jpwords;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.jdc.jpwords.security.AppTokenFilter;

@EnableWebSecurity
public class JpwordsApiSecurity {
	
	@Autowired
	private AppTokenFilter appTokenFilter;

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
		return config.getAuthenticationManager();
	}
	
	@Bean
	SecurityFilterChain httpSecurity(HttpSecurity http) throws Exception {
		return http
				.cors().and().csrf().disable()
				.authorizeHttpRequests()
				.requestMatchers("/security/login").permitAll()
				.requestMatchers(HttpMethod.POST, "/account").hasAnyAuthority("Admin")
				.requestMatchers(HttpMethod.PUT, "/account").hasAnyAuthority("Admin")
				.anyRequest().authenticated().and()
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
				.addFilterBefore(appTokenFilter, UsernamePasswordAuthenticationFilter.class)
				.build();
	}
}
