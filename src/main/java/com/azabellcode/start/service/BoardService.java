package com.azabellcode.start.service;

import java.util.List;

import com.azabellcode.start.dto.BoardDto;
import com.azabellcode.start.dto.TBoardDto;

public interface BoardService {
    List<BoardDto> selectBoardList() throws Exception;

    void insertBoard(BoardDto board) throws Exception;

}
