package com.jdc.jpwords;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@PropertySource({
	"classpath:/config/words-app.properties",
	"classpath:/config/admin.properties"
})
@EnableJpaAuditing
public class JpwordsApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpwordsApiApplication.class, args);
	}

}
