package com.spring.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dao.UmaMapper;
import com.spring.member.model.dto.UmaDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private UmaMapper mapper;
	
	@Autowired
	public MemberServiceImpl(UmaMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<UmaDTO> selectUma() {
		// TODO Auto-generated method stub
		return mapper.selectUma();
	}
	
	

	
	
}
