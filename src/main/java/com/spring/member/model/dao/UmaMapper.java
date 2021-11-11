package com.spring.member.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

public interface UmaMapper {


	List<UmaDTO> selectUma();
	List<PixivDTO> selectDailyBest(int day_count);
	String[] selectUmaTag();
	int insertPixiv(PixivDTO dto);
	List<PixivDTO> selectPixivRank();
	List<PixivDTO> selectPixivWeekRank(Map param);
	List<PixivDTO> selectPixivMonthRank(int day_count);
	UmaDTO selectUmaDetail(int uma_code);
}
