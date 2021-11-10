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
import org.springframework.ui.Model;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dao.UmaMapper;
import com.spring.member.model.dto.PixivDTO;
import com.spring.member.model.dto.UmaDTO;

@Service
public class MemberServiceImpl implements MemberService {
	public Date date;
	private UmaMapper mapper;
	private static String url = "";

	@Autowired
	public MemberServiceImpl(UmaMapper mapper) {
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
	@Scheduled(fixedRate = 4800000) //90분마다 자동 반복되게 스케쥴링 함
	public void sampleScheduler2() throws IOException, ParseException, java.text.ParseException, InterruptedException {
		date = new Date();
		boolean uploadFail = false;
		System.out.println("크롤링 시작" + date);
		List<UmaDTO> umaList = selectUma(); // 우마무스메 리스트를 DB에서 불러옴
		for (UmaDTO key : umaList) {
			uploadFail = false;
			System.out.println("태그 : " + key.getUma_tag());
			for (int cnt = 1; cnt < 11; cnt++) {
				System.out.println("===============" + key.getUma_name() + " " + cnt + " 페이지===================");
				
				//데이터를 가져오기 위한 Request URL을 작성
				UriComponents uriCom = UriComponentsBuilder.newInstance()
						.path("www.pixiv.net/ajax/search/illustrations/" + key.getUma_tag())
						.queryParam("word", key.getUma_tag()).queryParam("order", "date_d").queryParam("mode", "all")
						.queryParam("p", cnt).queryParam("s_mode", "s_tag").queryParam("type", "illust_and_ugoira")
						.queryParam("lang", "ko").build();

				url = "https://" + uriCom.toString();
				Thread.sleep(5000);
				System.out.println("===url = " + url);
				//해당 URL의 검색 결과를 크롤링해옴
				Document doc = Jsoup.connect(url).ignoreContentType(true).get();
				
				//JSON 형식의 데이터를 JSONArray에 입력
				String json = doc.text();
				JSONParser jsonParse = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParse.parse(json);

				JSONObject array = (JSONObject) jsonObject.get("body");
				JSONObject illustManga = (JSONObject) array.get("illust");
				JSONArray data = (JSONArray) illustManga.get("data");

				int count = 0;
				System.out.println("==============데이터 사이즈 = " + data.size() + "================");
				for (int i = 0; i < data.size(); i++) {
					JSONObject personObject = (JSONObject) data.get(i);
					//날짜 형식을 맞춰줌
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssX");
					SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date createDate = simpleDateFormat.parse((String) personObject.get("createDate"));

					Date sysdate = new Date();
					String time = format1.format(sysdate).substring(0, 10);
					int id = Integer.parseInt((String) personObject.get("id"));
					String title = (String) personObject.get("title");
					String userName = (String) personObject.get("userName");
					//해당 일러스트의 정보 하나를 PixivDTO에 등록
					PixivDTO pixiv = new PixivDTO(key.getUma_code(), createDate, userName, id);
					System.out.println(pixiv);

					System.out.println("id :" + id + " 제목 : " + title + " 작가명 : " + userName + " 업로드일자 : "
							+ simpleDateFormat.format(createDate));
					if (insertPixiv(pixiv) == true) {
						//위의 정보를 토대로 DB에 INSERT를 시작함
						System.out.println("업로드 성공");
					} else {
						//DB내에서는 UMA_CODE와 PIC_ID가 다중키로 제약조건이 걸려있으므로 이미 업로드 된 데이터는 업로드 되지 않음
						System.out.println("업로드 실패");
						//이미 업로드 되어 실패가 되어있을때는 uploadFail을 true로 바꿔둔다
						uploadFail = true;
					}
					if (((String) personObject.get("createDate")).substring(0, 10).equals(time)) {
						count++;
					}
				}
				Thread.sleep(500);
				if (data.size() != 60) {
					//data.size()는 현재 크롤링한 한 페이지의 일러스트 수를 의미한다.
					//1페이지에 표시되는 일러스트 수는 최대 60장이며 한 페이지에 60장이 채워지지 않은 상황은
					//현재 페이지가 마지막 페이지라는 뜻으로 반복을 미리 끝내버린다.
					cnt = 11;
				}
				if (uploadFail == true) {
					//이번 반복에서 이미 업로드 된 일러스트가 있다면
					//다음 페이지에 있는 검색결과는 크롤링을 안해도 되니 크롤링 시간 절약을 위해 반복을 끝낸다.
					System.out.println("========스킵========");
					cnt = 10;
				}
				if (cnt == 10) {
					System.out.println("오늘 올라온 " + key.getUma_tag() + "의 픽시브 일러스트 갯수 : " + count);
				}
			}
		}
		System.out.println("크롤링 종료");
	}

	@Override
	public Date updateDate() {
		// TODO Auto-generated method stub
		return date;
	}

	@Override
	public UmaDTO selectUmaDetail(int uma_code) {
		// TODO Auto-generated method stub
		return mapper.selectUmaDetail(uma_code);
	}

	@Override
	public List<PixivDTO> selectDailyBest(int day_count) {
		// TODO Auto-generated method stub
		return mapper.selectDailyBest(day_count);
	}

}
