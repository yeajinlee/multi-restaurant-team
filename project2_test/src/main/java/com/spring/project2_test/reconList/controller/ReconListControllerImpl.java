package com.spring.project2_test.reconList.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.reconList.service.ReconListService;
import com.spring.project2_test.reconList.vo.ReconListVO;

@Controller("reconListController")
public class ReconListControllerImpl implements ReconListController{

	@Autowired 
	private ReconListService reconListService;
	
	
	@Override
	@RequestMapping(value="/reconList.do", method= RequestMethod.GET)
	public ModelAndView reconList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ReconListVO> ReconList = reconListService.ReconRest();
		System.out.println("controll"+ReconList.toString());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("ReconList", ReconList);
		return mav;
	
	}

}
