package com.spring.member.model.service;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dto.MemberDTO;

public interface MemberService {

	boolean registMember(MemberDTO member);

	MemberDTO loginMember(MemberDTO member) throws LoginFailedException;

}
