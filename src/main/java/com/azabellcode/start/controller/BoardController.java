package com.azabellcode.start.controller;

import com.azabellcode.start.dto.BoardDto;
import com.azabellcode.start.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // 추가된 부분
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/board/openBoardList.do")
    public String openBoardList(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10; // 한 페이지에 보여질 게시글 수
    
        // 페이지가 1보다 작을 경우 기본값으로 설정
        if (page < 1) {
            page = 1;
        }
    
        int offset = (page - 1) * pageSize; // SQL 쿼리에서 LIMIT의 시작 지점 계산
    
        // 게시글 리스트 가져오기
        List<BoardDto> boardList = boardService.getBoardList(offset, pageSize);
        if (boardList == null) {
            boardList = new ArrayList<>();
        }
    
        // 전체 게시글 수
        int totalCount = boardService.getBoardCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    
        // 데이터를 모델에 추가
        model.addAttribute("boardList", boardList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
    
        return "thymeleaf/board/board";
    }
    

    @RequestMapping("/board/openBoardWrite.do")
    public String openBoardWrite() {
        return "thymeleaf/board/write";
    }

    @RequestMapping("/board/insertBoard.do")
    public String insertBoard(@ModelAttribute BoardDto board) throws Exception {
        boardService.insertBoard(board);
        return "redirect:/board/openBoardList.do";
    }

    @RequestMapping("/board/openBoardDetail.do")
    public ModelAndView openBoardDetail(@RequestParam("boardIdx") int boardIdx) throws Exception {
        boardService.increaseHitCnt(boardIdx); // 조회수 증가
        BoardDto board = boardService.selectBoardDetail(boardIdx); // 업데이트된 데이터 조회
        ModelAndView mv = new ModelAndView("thymeleaf/board/detail");
        mv.addObject("board", board);
        return mv;
    }

    @RequestMapping("/board/deleteBoard.do")
    public String deleteBoard(@RequestParam("boardIdx") int boardIdx, @RequestParam("password") String password) throws Exception {
        BoardDto board = boardService.selectBoardDetail(boardIdx);

        if (board == null || !board.getPassword().equals(password)) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않거나 게시글이 존재하지 않습니다.");
        }

        boardService.deleteBoard(boardIdx);
        return "redirect:/board/openBoardList.do"; // 삭제 후 목록으로 리다이렉트
    }

    @RequestMapping("/board/openBoardReply.do")
    public ModelAndView openBoardReply(@RequestParam("boardIdx") int boardIdx) throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/board/reply");
        BoardDto parentBoard = boardService.selectBoardDetail(boardIdx);
        mv.addObject("parentBoard", parentBoard);
        return mv;
    }

    @RequestMapping("/board/insertReply.do")
    public String insertReply(@ModelAttribute BoardDto board) throws Exception {
        boardService.insertReply(board);
        return "redirect:/board/openBoardList.do";
    }

}
