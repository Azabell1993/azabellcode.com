package com.azabellcode.start;

import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{
	/*
	 * @HTML Request Mapping
	 * @classpath:/templates/, classpath:/static/
	 * @Azabell1993
	 */
	 @Override
	 public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/**")
		 .addResourceLocations(				"classpath:webapp/WEB-INF/"
		 									,"classpath:webapp/WEB-INF/**/"
											,"classpath:/templates/thymeleaf/"
											,"classpath:/templates/thymeleaf/**/"
											,"classpath:/templates/thymeleaf/assets/"
											,"classpath:/templates/thymeleaf/assets/js"
											,"classpath:/templates/thymeleaf/assets/sass"
											,"classpath:/templates/thymeleaf/assets/wasm"
											,"classpath:/templates/thymeleaf/main"
											,"classpath:/templates/thymeleaf/product"
											,"classpath:/templates/thymeleaf/board"
											,"classpath:/templates/thymeleaf/eduOOP"
											,"classpath:/templates/thymeleaf/example"
											,"classpath:/templates/thymeleaf/example/**/"
											)
											
		 .setCacheControl(CacheControl.maxAge(50, TimeUnit.MINUTES));
		}

		@Override
		public void configureViewResolvers(ViewResolverRegistry registry) {
			registry.jsp("/WEB-INF/views/", ".jsp");
		}
	
}