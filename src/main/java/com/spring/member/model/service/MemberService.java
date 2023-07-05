package com.spring.member.model.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

public interface MemberService {

	List<UmaDTO> selectUma();
	List<PixivDTO> selectDailyBest(int day_count);
	UmaDTO selectUmaDetail(int uma_code);
	boolean insertPixiv(PixivDTO dto);
	List<PixivDTO> selectPixivRank(int day_count);
	List<PixivDTO> selectPixivWeekRank(Map param);
	List<PixivDTO> selectPixivMonthRank(int day_count);
	Date updateDate();
	void sampleScheduler2() throws IOException, ParseException, java.text.ParseException, InterruptedException;

	void sampleScheduler3();

	void sampleScheduler4();

	void updateLastMonthRank(Map param);
	int selectPixivMonthRankFromUmaCode(Map param);

	void updateYesterdayRank(Map param);

	void updateSearchCount(int uma_code);


	List<PixivDTO> selectPixivRankByUmaCode(int day_count);

	List<UmaDTO> selectUmaDescSearchCount();


}
