package com.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.spring.member.model.dto.MemberDTO;
import com.spring.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
@SessionAttributes("loginMember")
public class MemberController {
	
	private final MemberService memberService;
	private final BCryptPasswordEncoder passwordEncoder;
	private static String url = "";
    private static String TEST_URL = "https://www.pixiv.net/ajax/search/artworks/%E3%83%9E%E3%83%A4%E3%83%8E%E3%83%88%E3%83%83%E3%83%97%E3%82%AC%E3%83%B3?word=%E3%83%9E%E3%83%A4%E3%83%8E%E3%83%88%E3%83%83%E3%83%97%E3%82%AC%E3%83%B3&order=date_d&mode=all&p=1&s_mode=s_tag&type=all&lang=ko";
    
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@GetMapping("/regist")
	public void registForm() {}
	
	@PostMapping("/regist")
	public String registMember(@ModelAttribute MemberDTO member, 
			HttpServletRequest request, 
			@RequestParam(name="photo", required=false) MultipartFile photo,
			RedirectAttributes rttr) 
					throws MemberRegistException {
		
		System.out.println(member);
		System.out.println(photo);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles";
		
		File mkdir = new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdirs();
		}
		
		String originFileName = "";
		String ext = "";
		String changeName = "";
		
		if(photo.getSize() > 0) {
			originFileName = photo.getOriginalFilename();
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			changeName = UUID.randomUUID().toString().replace("-",  "");
			
			try {
				photo.transferTo(new File(filePath + "\\" + changeName + ext));
			} catch (IOException e) {
				e.printStackTrace();
				
				new File(filePath + "\\" + changeName + ext).delete();
				throw new MemberRegistException("사진 업로드 때문에 회원 가입 실패함!");
			}
		}
			
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		if(member.getGender().equals("1") || member.getGender().equals("3")) {
			member.setGender("M");
		}else {
			member.setGender("F");
		}
		
		/* Exception 핸들러 동작 확인 */
//		boolean test = true;
//		if(test) {
//			throw new MemberRegistException("당신은 우리와 함께 할 수 없습니다.");
//		}
		
		if(!memberService.registMember(member)) {
			
			new File(filePath + "\\" + changeName + ext).delete();
			throw new MemberRegistException("당신은 우리와 함께 할 수 없습니다.");
		}
		
		rttr.addFlashAttribute("message", "회원 가입에 성공하셨습니다.");
		
		return "redirect:/";
	}
	
	
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO member, Model model) throws LoginFailedException {
			
		model.addAttribute("loginMember", memberService.loginMember(member));
				
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	@PostMapping("/idDupCheck")
	public void idDupCheck(HttpServletResponse response) throws IOException {
		
		response.getWriter().write("false");
	}
	
	@GetMapping("/soup")
	public String getCount(Model model) throws IOException, ParseException, java.text.ParseException, InterruptedException {
		String mayano = "マヤノトップガン";
        String[] umamusume = {"ゴールドシチー","フジキセキ","ヒシアマゾン","セイウンスカイ","ナリタブライアン"
        ,"スマートファルコン","ナリタタイシン","カレンチャン","ビワハヤヒデ","ミホノブルボン","テイエムオペラオー"
        ,"キングヘイロー","ナイスネイチャ","マチカネフクキタル","ハルウララ","ウイニングチケット","アグネスタキオン","メジロライアン"
                ,"スーパークリーク","マヤノトップガン","エアグルーヴ"};

        //String[] umamusume = {"ゴールドシチー"};
        String ranking = "";
        for(String key : umamusume){


        UriComponents uriCom = UriComponentsBuilder.newInstance()
            .path("www.pixiv.net/ajax/search/artworks/"+key)
                .queryParam("word",key)
                .queryParam("order","date_d")
                .queryParam("mode","all")
                .queryParam("p",1)
                .queryParam("s_mode","s_tag")
                .queryParam("type","all")
                .queryParam("lang","ko")

            .build();

        url = "https://"+uriCom.toString();
        //System.out.println("주소 : "+uriCom.toString());
        //System.out.println("Jsoup를 쓴 값");

        Document doc = Jsoup.connect(url).ignoreContentType(true).get();



        String json = doc.text();
        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParse.parse(json);

      //  String data = jsonObject.get("userId").toString();

        Boolean error = (Boolean) jsonObject.get("error");
        JSONObject array = (JSONObject) jsonObject.get("body");
        JSONObject illustManga = (JSONObject) array.get("illustManga");
        JSONArray data = (JSONArray) illustManga.get("data");


        //System.out.println(doc);
        //System.out.println(jsonObject);

        //System.out.println(error);
        //System.out.println(array);
        //System.out.println(illustManga);
        int count = 0;
         for(int i=0; i < data.size(); i++) {
            // System.out.println("======== " + (i+1) + "번 ========");
             JSONObject personObject = (JSONObject) data.get(i);


             SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssX");
             SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
             Date createDate = simpleDateFormat.parse((String) personObject.get("createDate"));
             Date sysdate = new Date();
             String time = format1.format(sysdate).substring(0,10);
             String id = (String) personObject.get("id");
             String title = (String) personObject.get("title");
             String userName = (String) personObject.get("userName");
            // System.out.println("id :"+id+" 제목 : "+title+" 작가명 : "+userName+" 업로드일자 : "+createDate);


             if(((String) personObject.get("createDate")).substring(0,10).equals(time)){
                 count++;

             }

         }
        System.out.println("오늘 올라온 "+key+"의 픽시브짤 갯수 : "+count);
        ranking += "오늘 올라온 "+key+"의 픽시브짤 갯수 : "+count+"\n";
         Thread.sleep(500);
        }
        
        model.addAttribute("ranking",ranking);
        return "main/dailyRanking";
	}
}
