package com.spring.member.model.service;

import java.util.List;

import com.spring.common.exception.LoginFailedException;
import com.spring.member.model.dto.UmaDTO;

public interface MemberService {

	List<UmaDTO> selectUma();
	String[] selectUmaTag();


}
