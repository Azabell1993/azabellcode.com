package com.azabellcode.start;

import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
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
		 .addResourceLocations("classpath:/templates/"
											,"classpath:/templates/**/"
											
											,"classpath:/templates/assets/"
											,"classpath:/templates/assets/js"
											,"classpath:/templates/assets/sass"
											,"classpath:/templates/assets/wasm"
											,"classpath:/templates/main"
											,"classpath:/templates/product"
											,"classpath:/templates/board"
											
											)
											
		 .setCacheControl(CacheControl.maxAge(50, TimeUnit.MINUTES));
		}

		
}