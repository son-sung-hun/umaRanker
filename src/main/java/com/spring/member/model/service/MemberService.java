package com.spring.member.model.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

public interface MemberService {

	List<UmaDTO> selectUma();
	PixivDTO selectDailyBest();
	UmaDTO selectUmaDetail(int uma_code);
	boolean insertPixiv(PixivDTO dto);
	List<PixivDTO> selectPixivRank();
	List<PixivDTO> selectPixivWeekRank(int date);
	List<PixivDTO> selectPixivMonthRank();
	Date updateDate();
	void sampleScheduler2() throws IOException, ParseException, java.text.ParseException, InterruptedException;

}
