package com.azabellcode.start.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.azabellcode.start.dto.BoardDto;
import com.azabellcode.start.mapper.BoardMapper;
import com.azabellcode.start.service.BoardService;

import lombok.RequiredArgsConstructor;

import org.springframework.ui.Model;

@Controller
@RequiredArgsConstructor
public class BoardController {
    	
	@Value("${project.name}")
	String projectName;
    
    @Autowired
    private BoardService boardService; //서비스와 연결

    @Autowired
    private BoardMapper boardMapper;


    @RequestMapping("/board/openBoardList.do") //노테이션의 값으로 주소 지정
    public ModelAndView openBoardList(Model model) throws Exception{
        
		model.addAttribute("site_title", projectName);
        
    	//templates 폴더 아래있는 /boardList.html을 의미함. Thymeleaf와 같은 템플릿엔진을 사용할 경우 스프링 부트의 자동 설정 기능으로 '.html'과 같은 접미사 생략 가능
    	ModelAndView mv = new ModelAndView("/board/board"); 
        //게시글 목록을 조회하기 위해 ServiceImpl 클래스의 selectBoardList 메서드 호출
        List<BoardDto> boardlist = boardService.selectBoardList();  
        mv.addObject("list", boardlist);
        return mv;
    }

    @RequestMapping("/board/openBoardWrite.do")		//게시글 작성 화면 호출
    public String openBoardWrite() throws Exception{
    	return "/board/write";
    }
    
    @RequestMapping("/board/insertBoard.do")		//작성된 게시글 등록 기능 메소드, html의 form 태그 action에서 입력한 주소
    public String insertBoard(@ModelAttribute BoardDto board) throws Exception{
    	boardService.insertBoard(board);
    	return "redirect:/board/openBoardList.do";	//게시글 리스트로 이동
    }

    
}