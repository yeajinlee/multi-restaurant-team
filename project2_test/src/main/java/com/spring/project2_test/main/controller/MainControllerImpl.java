package com.spring.project2_test.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.main.service.MainService;
import com.spring.project2_test.main.vo.MainVO;


@Controller("mainController")
public class MainControllerImpl implements MainController{
	@Autowired
	public MainService mainService;
	
	
	@RequestMapping(value="/main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session= request.getSession();
		List restList = mainService.restList();
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		mav.addObject("restList", restList);

		return mav;
	}
}
