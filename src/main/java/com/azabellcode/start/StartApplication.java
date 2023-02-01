package com.azabellcode.start;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication
public class StartApplication extends SpringBootServletInitializer{
	public static void main(String[] args) {
		SpringApplication.run(StartApplication.class, args);
	}
	
	/*
	 * @Mapping SpringBoot WebServer care24
	 * @2022.11.22
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ServletInitializer.class);
	}
}
