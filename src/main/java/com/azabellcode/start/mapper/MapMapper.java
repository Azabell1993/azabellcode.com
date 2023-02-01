package com.azabellcode.start.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.azabellcode.start.dto.BoardDto;
import com.azabellcode.start.dto.MapDto;
import com.azabellcode.start.dto.MembertblDto;
import com.azabellcode.start.dto.testMapbSQLMAPDto;

@Mapper
public interface MapMapper {
	public List<MapDto> listMap();
	public List<testMapbSQLMAPDto> testMapbSQLMAP();
	public List<BoardDto> boardSQLMAP();
	public List<MembertblDto> membertblSQLMAP();
	public int membertblSQLMAPCOUNT();

	public int date();
}
