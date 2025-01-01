package com.azabellcode.start.mapper;

import com.azabellcode.start.dto.BoardDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param; // 이 부분 추가

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDto> selectBoardList() throws Exception;

    void insertBoard(BoardDto board) throws Exception;

    void deleteBoard(int boardIdx) throws Exception;

    void insertReply(BoardDto board) throws Exception;

    BoardDto selectBoardDetail(int boardIdx) throws Exception;

    void increaseHitCnt(int boardIdx) throws Exception;

    // 페이징 처리를 위한 게시글 목록 조회
    List<BoardDto> findBoardList(@Param("offset") int offset, @Param("pageSize") int pageSize); // @Param import

    // 전체 게시글 수 조회
    int countAllBoards();
}
