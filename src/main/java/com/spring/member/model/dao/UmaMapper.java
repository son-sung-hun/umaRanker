package com.spring.member.model.dao;

import java.util.List;

import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

public interface UmaMapper {


	List<UmaDTO> selectUma();
	String[] selectUmaTag();
	int insertPixiv(PixivDTO dto);

}
