package com.azabellcode.start.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;

import com.azabellcode.start.dto.BoardDTO;


@Mapper
public interface BoardMapper {
    public int insertBoard(BoardDTO params);        // 게시글 등록
	public BoardDTO selectBoardDetail(Long idx);    // 게시글 하나 조회
	public int updateBoard(BoardDTO params);        // 게시글 수정
	public int deleteBoard(Long idx);               // 삭제여부를 Y로 만들어서 노출되지 않게 하는 역할 (DB에서 안지움), idx를 파라미터로 전달받고 WHERE로 검색한 후 Y값으로 변경
	public List<BoardDTO> selectBoardList();        // 게시글 목록 조회
	public int selectBoardTotalCount();             // 삭제가 안된 글의 개수를 조회, 나중에 페이지 처리용
	public boolean cntPlus(Long idx);               // 조회수 카운터 용

	//test map
    public List<BoardDTO> boardMap();
}
