package com.spring.member.model.dto;

import java.util.Date;

public class PixivDTO {
	private int uma_code;
	private Date upload_date;
	private String author;
	private int pic_id;
	
	
	public PixivDTO() {
		
	}


	public PixivDTO(int uma_code, Date upload_date, String author, int pic_id) {
		super();
		this.uma_code = uma_code;
		this.upload_date = upload_date;
		this.author = author;
		this.pic_id = pic_id;
	}


	public int getUma_code() {
		return uma_code;
	}


	public void setUma_code(int uma_code) {
		this.uma_code = uma_code;
	}


	public Date getUpload_date() {
		return upload_date;
	}


	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public int getPic_id() {
		return pic_id;
	}


	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}


	@Override
	public String toString() {
		return "PixivDTO [uma_code=" + uma_code + ", upload_date=" + upload_date + ", author=" + author + ", pic_id="
				+ pic_id + "]";
	}


	
	
	
	
}
