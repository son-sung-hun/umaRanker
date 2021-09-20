package com.spring.member.model.dao;

import com.spring.member.model.dto.MemberDTO;

public interface MemberMapper {

	int insertMember(MemberDTO member);

	String selectEncPassword(MemberDTO member);

	MemberDTO selectMember(MemberDTO member);

}
