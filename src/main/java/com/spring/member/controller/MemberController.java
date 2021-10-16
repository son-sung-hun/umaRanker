package com.spring.member.controller;

import java.io.File;
import java.io.IOException;
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
	private final MemberService memberService;
	private static String url = "";
	private final BCryptPasswordEncoder passwordEncoder;
	
    private static String TEST_URL = "https://www.pixiv.net/ajax/search/artworks/%E3%83%9E%E3%83%A4%E3%83%8E%E3%83%88%E3%83%83%E3%83%97%E3%82%AC%E3%83%B3?word=%E3%83%9E%E3%83%A4%E3%83%8E%E3%83%88%E3%83%83%E3%83%97%E3%82%AC%E3%83%B3&order=date_d&mode=all&p=1&s_mode=s_tag&type=all&lang=ko";
    
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@GetMapping(value={"/", "main"})
	public String main(Model model) {
		List<PixivDTO> daily = memberService.selectDailyBest();
        model.addAttribute("daily",daily);

		return "main/main";
	}
	
	@GetMapping("/member/soup")
	public String getCount(Model model) throws IOException, ParseException, java.text.ParseException, InterruptedException {
	
        List<PixivDTO> pixivRanking = memberService.selectPixivRank();
        updateDate = memberService.updateDate();
        model.addAttribute("updateDate",updateDate);
        model.addAttribute("pixivRanking",pixivRanking);
        

        return "main/dailyRanking";
	}
	
	
	
	@GetMapping("/member/week")
	public String getWeekCount(Model model) throws IOException, ParseException, java.text.ParseException, InterruptedException {
	
		Calendar cal = Calendar.getInstance();
		int date = cal.get(Calendar.DAY_OF_WEEK)-1;
		
        List<PixivDTO> pixivRanking = memberService.selectPixivWeekRank(date);
        updateDate = memberService.updateDate();
        model.addAttribute("updateDate",updateDate);
        model.addAttribute("pixivRanking",pixivRanking);


        return "main/weeklyRanking";
	}
	
	@GetMapping("/member/month")
	public String getMonthCount(Model model) throws IOException, ParseException, java.text.ParseException, InterruptedException {
	
		
		
        List<PixivDTO> pixivRanking = memberService.selectPixivMonthRank();
        updateDate = memberService.updateDate();
        model.addAttribute("updateDate",updateDate);
        model.addAttribute("pixivRanking",pixivRanking);


        return "main/monthlyRanking";
	}
	
	@GetMapping("/member/database")
	public String getDatabase(Model model) throws IOException, ParseException, java.text.ParseException, InterruptedException {
	
		
		
        List<UmaDTO> umaData = memberService.selectUma();
        model.addAttribute("umaData",umaData);


        return "main/databaseMain";
	}
	
	@GetMapping("/member/detail")
	public String getDatabaseDetail(Model model
			,@RequestParam(value="uma_code", required=false) int uma_code) throws IOException, ParseException, java.text.ParseException, InterruptedException {
	
		
		
        UmaDTO umaDetail = memberService.selectUmaDetail(uma_code);
        model.addAttribute("umaDetail",umaDetail);


        return "main/databaseDetail";
	}
}
