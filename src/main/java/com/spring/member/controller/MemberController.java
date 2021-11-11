package com.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.common.exception.LoginFailedException;
import com.spring.common.exception.MemberRegistException;
import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;
import com.spring.member.model.service.MemberService;

@Controller
@RequestMapping("/*")
public class MemberController {
	Date updateDate;
	Calendar cal;
	private final MemberService memberService;
	private static String url = "";
	private final BCryptPasswordEncoder passwordEncoder;

	private static String URL = "https://www.pixiv.net/tags/";

	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	@GetMapping(value = { "/", "main" })
	public String main(Model model, @RequestParam(value = "day_count", required = false) String day_count) {
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		
		
		//제일 최근에 크롤링 한 날짜를 가져옴
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);

		

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		if (count == 0) {
			//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}

		List<PixivDTO> daily = memberService.selectDailyBest(count);
		cal.add(Calendar.DATE, -(count));

		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("daily", daily);
		model.addAttribute("count", count);

		return "main/main";
	}

	@GetMapping("/member/soup")
	public String getCount(Model model, @RequestParam(value = "day_count", required = false) String day_count)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {
		
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		
		List<PixivDTO> pixivRanking = memberService.selectPixivRank();
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		if (count == 0) {
			//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}
		
		cal.add(Calendar.DATE, -(count));
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/dailyRanking";
	}

	@GetMapping("/member/week")
	public String getWeekCount(Model model, @RequestParam(value = "day_count", required = false) String day_count)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		Calendar cal = Calendar.getInstance();
		int date = cal.get(Calendar.DAY_OF_WEEK) - 2;
		if(date==-1) {
			date=6;
		}

		List<PixivDTO> pixivRanking = memberService.selectPixivWeekRank(date);
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		if (count == 0) {
			//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}
		
		cal.add(Calendar.DATE, -(count));
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/weeklyRanking";
	}

	@GetMapping("/member/month")
	public String getMonthCount(Model model, @RequestParam(value = "day_count", required = false) String day_count)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {
		
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		List<PixivDTO> pixivRanking = memberService.selectPixivMonthRank(count);
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM");

		if (count == 0) {
			//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}
		
		cal.add(Calendar.MONTH, -(count));
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/monthlyRanking";
	}

	@GetMapping("/member/database")
	public String getDatabase(Model model)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {

		List<UmaDTO> umaData = memberService.selectUma();
		model.addAttribute("umaData", umaData);

		return "main/databaseMain";
	}

	@GetMapping("/member/detail")
	public String getDatabaseDetail(Model model, @RequestParam(value = "uma_code", required = false) int uma_code)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {

		UmaDTO umaDetail = memberService.selectUmaDetail(uma_code);
		model.addAttribute("umaDetail", umaDetail);

		return "main/databaseDetail";
	}
}
