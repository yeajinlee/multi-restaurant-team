package com.spring.project2_test.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.member.vo.MemberVO;





public interface MemberService {
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
}