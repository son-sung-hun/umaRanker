package com.spring.member.model.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dao.UmaMapper;
import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private UmaMapper mapper;
	private static String url = "";
	@Autowired
	public MemberServiceImpl( UmaMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<UmaDTO> selectUma() {
		// TODO Auto-generated method stub
		return mapper.selectUma();
	}

	@Override
	public boolean insertPixiv(PixivDTO dto) {
		// TODO Auto-generated method stub
		return mapper.insertPixiv(dto) > 0 ? true : false;
	}

	@Override
	public List<PixivDTO> selectPixivRank() {
		// TODO Auto-generated method stub
		return mapper.selectPixivRank();
	}

	@Override
	public List<PixivDTO> selectPixivWeekRank(int date) {
		// TODO Auto-generated method stub
		return mapper.selectPixivWeekRank(date);
	}

	@Override
	public List<PixivDTO> selectPixivMonthRank() {
		// TODO Auto-generated method stub
		return mapper.selectPixivMonthRank();
	}

	@Override
	@Scheduled(fixedRate = 600000)
	public void sampleScheduler2() throws IOException, ParseException, java.text.ParseException, InterruptedException {
		// TODO Auto-generated method stub
        Date date = new Date();

		System.out.println("크롤링 시작" + date);
        List<UmaDTO> umaList = selectUma(); //말 리스트 DB에서 불러옴
        for(UmaDTO key : umaList){

        	System.out.println("태그 : "+key.getUma_tag());
        UriComponents uriCom = UriComponentsBuilder.newInstance()
            .path("www.pixiv.net/ajax/search/artworks/"+key.getUma_tag())
                .queryParam("word",key.getUma_tag())
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
        Thread.sleep(5000);

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

             int id = Integer.parseInt((String) personObject.get("id")) ;
             String title = (String) personObject.get("title");
             String userName = (String) personObject.get("userName");
             PixivDTO pixiv = new PixivDTO(key.getUma_code(),createDate,userName,id);
             System.out.println(pixiv);
             
            System.out.println("id :"+id+" 제목 : "+title+" 작가명 : "+userName+" 업로드일자 : "+simpleDateFormat.format(createDate));
            if(insertPixiv(pixiv) == true) {
           	 System.out.println("업로드 성공");
            }else {
           	 System.out.println("업로드 실패");
            }

             if(((String) personObject.get("createDate")).substring(0,10).equals(time)){
                 count++;

             }

         }
        System.out.println("오늘 올라온 "+key.getUma_tag()+"의 픽시브짤 갯수 : "+count);
         Thread.sleep(500);
        }
		System.out.println("크롤링 종료");

	}

	

	
	
}
