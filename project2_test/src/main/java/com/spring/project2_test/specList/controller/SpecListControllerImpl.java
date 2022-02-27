package com.spring.project2_test.specList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.specList.service.SpecListService;
import com.spring.project2_test.specList.vo.SpecListVO;




@Controller("spectListController")
public class SpecListControllerImpl implements SpecListController{

	@Autowired
	private SpecListService specListService;

	
	@Override
	@RequestMapping(value="/specList.do", method = RequestMethod.GET)
	public ModelAndView specList(@RequestParam("rest_theme")String rest_theme, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(rest_theme);
		
		String viewName= (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List<SpecListVO> specList = specListService.specRest(rest_theme);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("specList",specList);
		mav.addObject("rest_theme",rest_theme);
		System.out.println("controll"+specList.toString());
		return mav;
	}

}
