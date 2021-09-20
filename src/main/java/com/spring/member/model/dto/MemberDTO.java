package com.spring.member.model.dto;

import java.sql.Date;

public class MemberDTO {
	
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String birthDay;
	private String gender;
	private String phone;
	private String address;
	private java.sql.Date enrollDate;
	private java.sql.Date modifyDate;
	private String role;
	private String status;
	
	public MemberDTO() {}
	
	public MemberDTO(int no, String id, String pwd, String name, String email, String birthDay, String gender,
			String phone, String address, Date enrollDate, Date modifyDate, String role, String status) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birthDay = birthDay;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.role = role;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public java.sql.Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(java.sql.Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", birthDay=" + birthDay + ", gender=" + gender + ", phone=" + phone + ", address=" + address
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", role=" + role + ", status=" + status
				+ "]";
	}
	
}
