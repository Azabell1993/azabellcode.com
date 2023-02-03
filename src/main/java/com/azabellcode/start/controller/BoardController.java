package com.azabellcode.start.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

import com.azabellcode.start.dto.BoardDTO;
import com.azabellcode.start.mapper.BoardMapper;

@Controller
@RequiredArgsConstructor    
public class BoardController {
    	
	@Value("${project.name}")
	String projectName;


	@Autowired
	private BoardMapper boardMapper;

    
    @RequestMapping(value="/board", method=RequestMethod.GET)
	public String board(Model model) {
		model.addAttribute("site_title", projectName);
		System.out.println("came");
        System.out.println(boardMapper.boardMap());
		model.addAttribute("site_title", projectName);
		model.addAttribute("boardlist", boardMapper.boardMap());

		return "board/board";
	}
	
}
