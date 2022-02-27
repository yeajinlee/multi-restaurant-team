package com.spring.project2_test.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2_test.member.vo.MemberVO;


public interface MemberController {
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypage(@ModelAttribute("member") MemberVO member,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
            RedirectAttributes rAttr,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView login(@ModelAttribute("member") MemberVO member,
//            RedirectAttributes rAttr,
//            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
