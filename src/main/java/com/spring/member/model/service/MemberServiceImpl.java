package com.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dao.MemberMapper;
import com.spring.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper, BCryptPasswordEncoder passwordEncoder) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public boolean registMember(MemberDTO member) {
		
		return mapper.insertMember(member) > 0? true: false;
	}

	@Override
	public MemberDTO loginMember(MemberDTO member) throws LoginFailedException {
		
		if(!passwordEncoder.matches(member.getPwd(), mapper.selectEncPassword(member))){
			throw new LoginFailedException("로그인 실패!");
		}
		
		return mapper.selectMember(member);
	}
	
}
