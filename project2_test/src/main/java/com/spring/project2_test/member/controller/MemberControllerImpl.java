package com.spring.project2_test.member.controller;



import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2_test.member.service.MemberService;
import com.spring.project2_test.member.vo.MemberVO;

////main, overlap
@Controller("memberController")
public class MemberControllerImpl implements MemberController{

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//로그인 창
	@Override
	@RequestMapping(value="/loginForm.do", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
//		Map memberMap = memberService.login();
		ModelAndView mav = new ModelAndView(viewName);
		

		return mav;
	}
	
	//회원가입 창
	@Override
	@RequestMapping(value="/joinForm.do", method = RequestMethod.GET)
	public ModelAndView joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
//		Map memberMap = memberService.login();
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}
	
	//마이페이지 창
	@Override
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(MemberVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		session = request.getSession();
		session.setAttribute("member", memberVO);
		
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}
	
	
	
	
//	@Override
//	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
//	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		memberVO = memberService.login(member);
//		if (memberVO != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("member", memberVO);
//			session.setAttribute("isLogOn", true);
//			String action = (String) session.getAttribute("action");
//			session.removeAttribute("action"); // �� ���ڱ� remove ..������ �����
//			if (action != null) {
//				mav.setViewName("redirect" + action);
//			} else {
//				mav.setViewName("redirect:/main.do");
//			}
//		} else {
//			rAttr.addAttribute("result", "loginFailed");
//			mav.setViewName("redirect:/login.do");
//		}
//		return mav;
//	}
	
	//로그인 호출 메소드
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(MemberVO vo, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("post login");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = memberService.login(vo);
		this.memberVO = vo;
		ModelAndView mav = new ModelAndView ();
		if(memberVO == null) {
			session.setAttribute("member", null);
			rAttr.addFlashAttribute("msg",false);
			mav.setViewName("redirect:/loginForm.do");
			
		}else {
			session.setAttribute("member", vo);
			rAttr.addFlashAttribute("msg",true);
			mav.setViewName("redirect:/main.do");
		}
		return mav;
	}



	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.invalidate();
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("redirect:/main.do");
		return mav;
	}


	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("get register");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result=0;
		result = memberService.addMember(vo);
		ModelAndView mav= new ModelAndView("redirect:/loginForm.do");
		
			
		return mav;
	}

	@RequestMapping(value = "/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}

	



	


	
}