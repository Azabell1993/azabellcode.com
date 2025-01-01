package com.azabellcode.start.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.azabellcode.start.dto.BoardDto;

import java.util.List;

@Mapper
public interface BoardMapper {
    // 여기서 지정한 메서드의 이름은 쿼리의 이름과 동일해야 함 (selectBoardList)
	public List<BoardDto> selectBoardList() throws Exception; 

    void insertBoard(BoardDto board) throws Exception;		//게시판 쓰기
    void deleteBoard(int boardIdx) throws Exception;        // 게시판 삭제
     void insertReply(BoardDto board) throws Exception;  // 댓글 쓰기
    BoardDto selectBoardDetail(int boardIdx) throws Exception;    //게시판 상세보기
    void increaseHitCnt(int boardIdx) throws Exception;    //조회수 증가
}