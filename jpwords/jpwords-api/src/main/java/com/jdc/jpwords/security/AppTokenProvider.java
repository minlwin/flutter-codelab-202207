package com.jdc.jpwords.security;

import java.security.Key;
import java.util.Calendar;
import java.util.Date;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Service
public class AppTokenProvider {
	
	@Value("${app.jwt.token.issuer}")
	private String issuer;
	@Value("${app.jwt.token.maxlife}")
	private int maxLife;
	
	private Key key = Keys.secretKeyFor(SignatureAlgorithm.HS512);

	public Optional<String> generate(UsernamePasswordAuthenticationToken auth) {
		
		var calendar = Calendar.getInstance();
		calendar.add(Calendar.MINUTE, maxLife);
		
		var token = Jwts.builder()
			.setSubject(auth.getName())
			.setIssuer(issuer)
			.setIssuedAt(new Date())
			.setExpiration(calendar.getTime())
			.claim("rol", auth.getAuthorities().stream().map(a -> a.getAuthority()).collect(Collectors.joining(",")))
			.signWith(key)
			.compact();
		
		return Optional.ofNullable(token);
	}

	public void authenticate(String token) {
		
		var result = Jwts.parserBuilder()
				.requireIssuer(issuer)
				.setSigningKey(key)
				.build().parseClaimsJws(token);
			
			var auth = new UsernamePasswordAuthenticationToken(
					result.getBody().getSubject(), null, 
					AuthorityUtils.commaSeparatedStringToAuthorityList(result.getBody().get("rol").toString()));
			
			SecurityContextHolder.getContext().setAuthentication(auth);

	}

}
