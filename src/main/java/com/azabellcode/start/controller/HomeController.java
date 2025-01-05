package com.azabellcode.start.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;

import com.azabellcode.start.mapper.MapMapper;


@Controller
@RequiredArgsConstructor
public class HomeController {
	@Value("${project.name}")
	String projectName;
	private final MapMapper mapMapper;

	/*
	 * MAIN CONTROLLER
	 * INDEX PAGE
	 * MAKE 2022.12.13
	 * @Azabell1993
	 */
	@GetMapping("/")
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Model model) {
        System.out.println("came");
		model.addAttribute("site_title", projectName);
		return "thymeleaf/intro";
	}

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/index";
	}

	@RequestMapping(value="/sample", method=RequestMethod.GET)
	public String elements(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/main/elements";
	}

	// wasm test code
	@RequestMapping(value="/editproduct", method=RequestMethod.GET)
	public String editproduct(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/product/product_body";
	}

	@RequestMapping(value="/menu", method=RequestMethod.GET)
	public String menu(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/main/menu";
	}
	@RequestMapping(value="/foot", method=RequestMethod.GET)
	public String foot(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/main/foot";
	}

	@RequestMapping(value="/introduce", method=RequestMethod.GET)
	public String introduce(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/main/introduce";
	}

	@RequestMapping(value="/example", method=RequestMethod.GET)
	public String example(Model model) {
		model.addAttribute("site_title", projectName);
		return "thymeleaf/main/elements";
	}

	@RequestMapping(value="/sqltest", method=RequestMethod.GET)
	public String sqltest(Model model) {
        System.out.println("came");
        System.out.println(mapMapper.listMap());
		model.addAttribute("site_title", projectName);
		model.addAttribute("list", mapMapper.listMap());
		return "thymeleaf/product/sqltest";
	}
}