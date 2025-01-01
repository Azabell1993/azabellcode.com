package com.azabellcode.start.service;

import com.azabellcode.start.dto.BoardDto;

import java.util.List;

public interface BoardService {
    List<BoardDto> selectBoardList() throws Exception;

    void insertBoard(BoardDto board) throws Exception;

    void deleteBoard(int boardIdx) throws Exception;

    void insertReply(BoardDto board) throws Exception;

    void increaseHitCnt(int boardIdx) throws Exception;

    List<BoardDto> getBoardList(int page, int pageSize);

    int getBoardCount(); // 전체 게시글 수 조회

    BoardDto selectBoardDetail(int boardIdx) throws Exception;
}
