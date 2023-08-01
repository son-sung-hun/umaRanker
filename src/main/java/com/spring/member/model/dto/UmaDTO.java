package com.spring.member.model.dto;

import java.sql.Date;

public class UmaDTO {
	
	private int uma_code;
	private String uma_name;
	private String height; //미실장 우마무스메 정보 기입을 위해 String으로 변경
	private String weight;
	private String three_b; //미실장 우마무스메 정보 기입을 위해 String으로 변경
	private String three_w; //미실장 우마무스메 정보 기입을 위해 String으로 변경
	private String three_h; //미실장 우마무스메 정보 기입을 위해 String으로 변경
	private String birth_day;
	private String uma_voice;
	private String uma_content;
	private String uma_tag;
	private String color_tag;

	private String lastMonthRank;
	private String yesterdayRank;

	private String engName;

	private String ytbLink;

	private int search_count;

	private String uma_quote;

	
	public UmaDTO() {}


	public UmaDTO(int uma_code, String uma_name, String height, String weight, String three_b, String three_w, String three_h,
			String birth_day, String uma_voice, String uma_content, String uma_tag, String color_tag, String lastMonthRank, String yesterdayRank, String engName, String ytbLink, int search_count, String uma_quote) {
		super();
		this.uma_code = uma_code;
		this.uma_name = uma_name;
		this.height = height;
		this.weight = weight;
		this.three_b = three_b;
		this.three_w = three_w;
		this.three_h = three_h;
		this.birth_day = birth_day;
		this.uma_voice = uma_voice;
		this.uma_content = uma_content;
		this.uma_tag = uma_tag;
		this.color_tag = color_tag;
		this.lastMonthRank = lastMonthRank;
		this.yesterdayRank = yesterdayRank;
		this.engName = engName;
		this.ytbLink = ytbLink;
		this.search_count = search_count;
		this.uma_quote = uma_quote;
	}


	public int getUma_code() {
		return uma_code;
	}


	public void setUma_code(int uma_code) {
		this.uma_code = uma_code;
	}


	public String getUma_name() {
		return uma_name;
	}


	public void setUma_name(String uma_name) {
		this.uma_name = uma_name;
	}


	public String getHeight() {
		return height;
	}


	public void setHeight(String height) {
		this.height = height;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public String getThree_b() {
		return three_b;
	}


	public void setThree_b(String three_b) {
		this.three_b = three_b;
	}


	public String getThree_w() {
		return three_w;
	}


	public void setThree_w(String three_w) {
		this.three_w = three_w;
	}


	public String getThree_h() {
		return three_h;
	}


	public void setThree_h(String three_h) {
		this.three_h = three_h;
	}


	public String getBirth_day() {
		return birth_day;
	}


	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}


	public String getUma_voice() {
		return uma_voice;
	}


	public void setUma_voice(String uma_voice) {
		this.uma_voice = uma_voice;
	}


	public String getUma_content() {
		return uma_content;
	}


	public void setUma_content(String uma_content) {
		this.uma_content = uma_content;
	}


	public String getUma_tag() {
		return uma_tag;
	}


	public void setUma_tag(String uma_tag) {
		this.uma_tag = uma_tag;
	}


	public String getColor_tag() {
		return color_tag;
	}


	public void setColor_tag(String color_tag) {
		this.color_tag = color_tag;
	}

	public String getLastMonthRank() {return  lastMonthRank;}

	public void setLastMonthRank(String lastMonthRank) { this.lastMonthRank = lastMonthRank; }

	public String getYesterdayRank() {return yesterdayRank;}

	public void setYesterdayRank(String yesterdayRank) { this.yesterdayRank = yesterdayRank; }

	public String getEngName() {return engName;}

	public void setEngName(String engName) { this.engName = engName; }

	public String getYtbLink() {return ytbLink;}

	public void setYtbLink(String ytbLink) { this.ytbLink = ytbLink; }

	public int getSearch_count() {return search_count;}

	public void setSearch_count(int search_count) { this.search_count = search_count; }

	public String getUma_quote() {return uma_quote;}

	public void setUma_quote(String uma_quote) { this.uma_quote = uma_quote; }

	@Override
	public String toString() {
		return "UmaDTO [uma_code=" + uma_code + ", uma_name=" + uma_name + ", height=" + height + ", weight=" + weight
				+ ", three_b=" + three_b + ", three_w=" + three_w + ", three_h=" + three_h + ", birth_day=" + birth_day
				+ ", uma_voice=" + uma_voice + ", uma_content=" + uma_content + ", uma_tag=" + uma_tag + ", color_tag="
				+ color_tag + ", LastMonthRank=" + lastMonthRank + "]";
	}

	

	
	
	
}
