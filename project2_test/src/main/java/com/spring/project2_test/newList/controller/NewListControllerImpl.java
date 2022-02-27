package com.spring.project2_test.newList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.member.vo.MemberVO;
import com.spring.project2_test.newList.service.NewListService;
import com.spring.project2_test.newList.vo.NewListVO;
import com.spring.project2_test.newList.vo.NewListVO2;


@Controller("newListController")
public class NewListControllerImpl implements NewListController{

	
	@Autowired
	private NewListService newListService;
	
	@Override
	@RequestMapping(value="/newList.do",method=RequestMethod.GET)
	public ModelAndView newList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
	
		
	
		List<NewListVO> newList= newListService.newRest();

		List<NewListVO2> defaultList= newListService.newDef();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("newList", newList);
		mav.addObject("defaultList",defaultList);	

		return mav;
	}

}
