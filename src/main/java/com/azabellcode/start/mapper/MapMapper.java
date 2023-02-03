package com.azabellcode.start.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;

import com.azabellcode.start.dto.BoardDTO;
import com.azabellcode.start.dto.MapDto;
import com.azabellcode.start.dto.MembertblDto;
import com.azabellcode.start.dto.testMapbSQLMAPDto;

@Mapper
public interface MapMapper {
	public List<MapDto> listMap();
	public List<testMapbSQLMAPDto> testMapbSQLMAP();
	public List<MembertblDto> membertblSQLMAP();
	public int membertblSQLMAPCOUNT();
	public int date();
}
