package com.spring.member.model.dao;

import java.util.Date;
import java.util.List;

import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

public interface UmaMapper {


	List<UmaDTO> selectUma();
	PixivDTO selectDailyBest();
	String[] selectUmaTag();
	int insertPixiv(PixivDTO dto);
	List<PixivDTO> selectPixivRank();
	List<PixivDTO> selectPixivWeekRank(int date);
	List<PixivDTO> selectPixivMonthRank();
	UmaDTO selectUmaDetail(int uma_code);
}
