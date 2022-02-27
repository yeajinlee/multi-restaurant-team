package com.spring.project2_test.newList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.newList.vo.NewListVO;

public interface NewListController {

	public ModelAndView newList(HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}
