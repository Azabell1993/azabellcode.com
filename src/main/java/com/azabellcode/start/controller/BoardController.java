package com.azabellcode.start.controller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

import com.azabellcode.start.mapper.MapMapper;

@Controller
@RequiredArgsConstructor
public class BoardController {
    @Value("${project.name}")
	String projectName;

	private final MapMapper mapMapper;

    @RequestMapping(value="/board", method=RequestMethod.GET)
	public String board(Model model) {
		System.out.println("came");
        System.out.println(mapMapper.boardSQLMAP());
		model.addAttribute("site_title", projectName);
		model.addAttribute("boardlist", mapMapper.boardSQLMAP());
		return "board/board";
	}

}
