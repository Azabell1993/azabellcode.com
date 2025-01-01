package com.azabellcode.start.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.azabellcode.start.mapper.BoardMapper;
import com.azabellcode.start.dto.BoardDto;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
    @Autowired //Mapper와 연결
	private BoardMapper boardMapper;

	@Override
	public List<BoardDto> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

	@Override
	public void insertBoard(BoardDto board) throws Exception {
		boardMapper.insertBoard(board);
	}

	@Override
	public BoardDto selectBoardDetail(int boardIdx) throws Exception {
    	return boardMapper.selectBoardDetail(boardIdx);
	}

	@Override
	public void deleteBoard(int boardIdx) throws Exception {
		boardMapper.deleteBoard(boardIdx);
	}

	@Override
	public void insertReply(BoardDto board) throws Exception {
		boardMapper.insertReply(board);
	}

	@Override
	public void increaseHitCnt(int boardIdx) throws Exception {
		boardMapper.increaseHitCnt(boardIdx);
	}

	@Override
	public List<BoardDto> getBoardList(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		List<BoardDto> boardList = boardMapper.findBoardList(offset, pageSize);
		return boardList != null ? boardList : new ArrayList<>();
	}

    @Override
    public int getBoardCount() {
        return boardMapper.countAllBoards(); // Mapper를 통해 전체 게시글 수 조회
    }

}
