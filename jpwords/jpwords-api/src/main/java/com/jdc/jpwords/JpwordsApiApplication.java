package com.jdc.jpwords;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource({
	"classpath:/config/words-app.properties",
	"classpath:/config/admin.properties"
})
public class JpwordsApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpwordsApiApplication.class, args);
	}

}
