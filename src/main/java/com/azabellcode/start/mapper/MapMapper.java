package com.azabellcode.start.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.azabellcode.start.dto.MapDto;

@Mapper
public interface MapMapper {
	public List<MapDto> listMap();
}
