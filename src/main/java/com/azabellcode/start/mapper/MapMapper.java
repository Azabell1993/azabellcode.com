package com.azabellcode.start.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.azabellcode.start.dto.BoardDTO;
import com.azabellcode.start.dto.MapDto;

@Mapper
public interface MapMapper {
	public List<MapDto> listMap();
<<<<<<< HEAD
=======
	public List<testMapbSQLMAPDto> testMapbSQLMAP();
	public List<MembertblDto> membertblSQLMAP();
	public int membertblSQLMAPCOUNT();
	public int date();
>>>>>>> 24e21efcbb1629616b4954d556c6bb8b1fb02c75
}
