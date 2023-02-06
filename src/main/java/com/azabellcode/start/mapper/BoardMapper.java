package com.azabellcode.start.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.azabellcode.start.dto.BoardDto;
import com.azabellcode.start.dto.TBoardDto;

import java.util.List;

@Mapper
public interface BoardMapper {
    // 여기서 지정한 메서드의 이름은 쿼리의 이름과 동일해야 함 (selectBoardList)
	public List<BoardDto> selectBoardList() throws Exception; 

    void insertBoard(BoardDto board) throws Exception;		//게시판 쓰기
    


}