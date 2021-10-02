package com.spring.member.model.dto;

import java.sql.Date;

public class UmaDTO {
	
	private int uma_code;
	private String uma_name;
	private int height;
	private String weight;
	private int three_b;
	private int three_w;
	private int three_h;
	private String birth_day;
	private String uma_voice;
	private String uma_content;
	private String uma_tag;
	
	public UmaDTO() {}

	public UmaDTO(int uma_code, String uma_name, int height, String weight, int three_b, int three_w, int three_h,
			String birth_day, String uma_voice, String uma_content, String uma_tag) {
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

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public int getThree_b() {
		return three_b;
	}

	public void setThree_b(int three_b) {
		this.three_b = three_b;
	}

	public int getThree_w() {
		return three_w;
	}

	public void setThree_w(int three_w) {
		this.three_w = three_w;
	}

	public int getThree_h() {
		return three_h;
	}

	public void setThree_h(int three_h) {
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

	@Override
	public String toString() {
		return "UmaDTO [uma_code=" + uma_code + ", uma_name=" + uma_name + ", height=" + height + ", weight=" + weight
				+ ", three_b=" + three_b + ", three_w=" + three_w + ", three_h=" + three_h + ", birth_day=" + birth_day
				+ ", uma_voice=" + uma_voice + ", uma_content=" + uma_content + ", uma_tag=" + uma_tag + "]";
	}


	
	
	
}
