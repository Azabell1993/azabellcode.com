package com.azabellcode.start.service;

import java.util.List;

import com.azabellcode.start.dto.BoardDto;

public interface BoardService {
    List<BoardDto> selectBoardList() throws Exception;

    void insertBoard(BoardDto board) throws Exception;
    void deleteBoard(int boardIdx) throws Exception;
    void insertReply(BoardDto board) throws Exception;
    void increaseHitCnt(int boardIdx) throws Exception;
    BoardDto selectBoardDetail(int boardIdx) throws Exception;
}
