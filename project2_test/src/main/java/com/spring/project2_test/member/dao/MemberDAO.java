package com.spring.project2_test.member.dao;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.member.vo.MemberVO;



public interface MemberDAO {

	 public MemberVO login(MemberVO memberVO) throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException;
}