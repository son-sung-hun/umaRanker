package com.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

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
	public String main(Model model, @RequestParam(value = "day_count", required = false) String day_count) throws java.text.ParseException {
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		
		
		//제일 최근에 크롤링 한 날짜를 가져옴
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);

		

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");




		List<PixivDTO> daily = memberService.selectDailyBest(count);

		List<UmaDTO> umaDTOS = memberService.selectUma();
		if(daily.size() == umaDTOS.size()){

			daily = memberService.selectDailyBest(count+1);
			cal.add(Calendar.DATE, -(count+1));
		}else{
			cal.add(Calendar.DATE, -(count));
			if (count == 0) {
				//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
				df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			}
		}



		SimpleDateFormat birthFormat = new SimpleDateFormat("M월 d일");
		UmaDTO umaDTO;

		boolean birth = false;
		for(int i=0; i<daily.size(); i++){
			umaDTO = memberService.selectUmaDetail(daily.get(i).getUma_code());
			if(birthFormat.format(cal.getTime()).equals(umaDTO.getBirth_day())){
				birth=true;
				if(i!=0){
					Collections.swap(daily,0,i);
				}
			}


		}

		String rankResult;
		int rankVariance = 0;

		int dailyRank = daily.get(0).getPixiv_rank();
		int yesterDayRank = Integer.parseInt(memberService.selectUmaDetail(daily.get(0).getUma_code()).getYesterdayRank());

		if(yesterDayRank>dailyRank){ //순위 상승
			rankVariance = yesterDayRank-dailyRank;
			rankResult = "increase";
		}else if(yesterDayRank<dailyRank){ //순위 하락
			rankVariance = dailyRank-yesterDayRank;
			rankResult = "decrease";
		}else{ //순위 유지
			rankResult = "noChange";
		}

		List<UmaDTO> searchQuery = memberService.selectUma();



		model.addAttribute("searchQuery",searchQuery);
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("daily", daily);
		model.addAttribute("count", count);
		model.addAttribute("birth", birth);
		model.addAttribute("size", daily.size());
		model.addAttribute("rankResult", rankResult);
		model.addAttribute("rankVariance", rankVariance);

		return "main/main";
	}

	@GetMapping("/day")
	public String getCount(Model model, @RequestParam(value = "day_count", required = false) String day_count)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {
		
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		
		List<PixivDTO> pixivRanking = memberService.selectPixivRank(count);
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0; i< pixivRanking.size(); i++){
			if(pixivRanking.get(i).getPixiv_count()==0){
				pixivRanking.remove(i--);
			}

		}

		System.out.println("pixivRanking.size() = "+pixivRanking.size());
		if (count == 0) {
			//현재 랭킹일시엔 시 분 초까지 표기함(크롤링 한 시각을 확인 시켜주기 위함)
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}
		
		cal.add(Calendar.DATE, -(count));

		List<UmaDTO> searchQuery = memberService.selectUma();



		model.addAttribute("searchQuery",searchQuery);
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/dailyRanking";
	}

	@GetMapping("/week")
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
		Map param = new HashMap();
		param.put("date", date);
		param.put("day_count", count);

		List<PixivDTO> pixivRanking = memberService.selectPixivWeekRank(param);
		for(int i=0; i< pixivRanking.size(); i++){
			if(pixivRanking.get(i).getPixiv_count()==0){
				pixivRanking.remove(i--);
			}

		}
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");


		cal.add(Calendar.DATE, -date);

		cal.add(Calendar.DATE, -(count*7));

		model.addAttribute("beforeDate", df.format(cal.getTime()));


		df = new SimpleDateFormat("yyyy-MM-dd");
		if(count==0) {
			cal.add(Calendar.DATE, date);
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}else{
			cal.add(Calendar.DATE, 6);
		}
		List<UmaDTO> searchQuery = memberService.selectUma();



		model.addAttribute("searchQuery",searchQuery);
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/weeklyRanking";
	}

	@GetMapping("/month")
	public String getMonthCount(Model model, @RequestParam(value = "day_count", required = false) String day_count)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {
		
		int count = 0;
		
		if (day_count != null) {
			count = Integer.parseInt(day_count);
		}
		List<PixivDTO> pixivRanking = memberService.selectPixivMonthRank(count);
		for(int i=0; i< pixivRanking.size(); i++){
			if(pixivRanking.get(i).getPixiv_count()==0){
				pixivRanking.remove(i--);
			}

		}
		updateDate = memberService.updateDate();
		cal = Calendar.getInstance();
		cal.setTime(updateDate);
		DateFormat df = new SimpleDateFormat("yyyy-MM");

		if (count == 0) {
			df = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		}
		
		cal.add(Calendar.MONTH, -(count));
		List<UmaDTO> searchQuery = memberService.selectUma();



		model.addAttribute("searchQuery",searchQuery);
		model.addAttribute("updateDate", df.format(cal.getTime()));
		model.addAttribute("pixivRanking", pixivRanking);
		model.addAttribute("count", count);

		return "main/monthlyRanking";
	}

	@GetMapping("/database")
	public String getDatabase(Model model)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {

		List<UmaDTO> umaData = memberService.selectUma();

		model.addAttribute("searchQuery", umaData);
		model.addAttribute("umaData", umaData);

		return "main/databaseMain";
	}


	@GetMapping("/database/detail")
	public String getDatabaseDetail(Model model, @RequestParam(value = "uma_code", required = false) int uma_code)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {

		UmaDTO umaDetail = memberService.selectUmaDetail(uma_code);

		Map param = new HashMap();
		String rankResult;
		int rankVariance = 0;

		param.put("uma_code", uma_code);
		param.put("day_count", 0);

		int monthlyRank = memberService.selectPixivMonthRankFromUmaCode(param);
		int lastMonthRank = Integer.parseInt(umaDetail.getLastMonthRank());

		if(lastMonthRank>monthlyRank){ //순위 상승
			rankVariance = lastMonthRank-monthlyRank;
			rankResult = "increase";
		}else if(lastMonthRank<monthlyRank){ //순위 하락
			rankVariance = monthlyRank-lastMonthRank;
			rankResult = "decrease";
		}else{ //순위 유지
			rankResult = "noChange";
		}

		String umaLink = umaDetail.getEngName().toLowerCase().replace(" ","").replace(".","");

		List<UmaDTO> searchQuery = memberService.selectUma();



		model.addAttribute("searchQuery",searchQuery);
		model.addAttribute("umaDetail", umaDetail);
		model.addAttribute("rankResult", rankResult);
		model.addAttribute("rankVariance", rankVariance);
		model.addAttribute("monthlyRank", monthlyRank);
		model.addAttribute("umaLink", umaLink);

		return "main/databaseDetail";
	}

	@GetMapping("/search")
	public String getSearchData(Model model, HttpServletRequest httpServletRequest)
			throws IOException, ParseException, java.text.ParseException, InterruptedException {

		String name = httpServletRequest.getParameter("uma_name");

		int uma_code = 0;

		List<UmaDTO> searchQuery = memberService.selectUma();
		if(name.equals("")){
			Random random = new Random();
			uma_code = random.nextInt(searchQuery.size());
		}
		for(int i=0; i<searchQuery.size(); i++){
			if(name.equals(searchQuery.get(i).getUma_name())){
				uma_code = searchQuery.get(i).getUma_code();
			}
		}
		if(uma_code!=0){
			getDatabaseDetail(model,uma_code);
			return "main/databaseDetail";
		}
		model.addAttribute("searchQuery",searchQuery);

		return "error/searchError";
	}

}
