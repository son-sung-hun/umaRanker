package com.spring.member.model.dto;

import java.util.Date;

public class PixivDTO {
	private int uma_code;
	private String uma_name;
	private Date upload_date;
	private String author;
	private int pic_id;
	private int pixiv_rank;
	private int pixiv_count;
	
	public PixivDTO() {
		
	}

	
	
	public PixivDTO(int uma_code, String uma_name, Date upload_date, String author, int pic_id, int pixiv_rank,
			int pixiv_count) {
		super();
		this.uma_code = uma_code;
		this.uma_name = uma_name;
		this.upload_date = upload_date;
		this.author = author;
		this.pic_id = pic_id;
		this.pixiv_rank = pixiv_rank;
		this.pixiv_count = pixiv_count;
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



	public String getUma_name() {
		return uma_name;
	}



	public void setUma_name(String uma_name) {
		this.uma_name = uma_name;
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



	public int getPixiv_rank() {
		return pixiv_rank;
	}



	public void setPixiv_rank(int pixiv_rank) {
		this.pixiv_rank = pixiv_rank;
	}



	public int getPixiv_count() {
		return pixiv_count;
	}



	public void setPixiv_count(int pixiv_count) {
		this.pixiv_count = pixiv_count;
	}



	@Override
	public String toString() {
		return "PixivDTO [uma_code=" + uma_code + ", uma_name=" + uma_name + ", upload_date=" + upload_date
				+ ", author=" + author + ", pic_id=" + pic_id + ", pixiv_rank=" + pixiv_rank + ", pixiv_count="
				+ pixiv_count + "]";
	}

	
	
	
	
	
}
