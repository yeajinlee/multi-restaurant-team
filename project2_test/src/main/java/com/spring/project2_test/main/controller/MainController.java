package com.spring.project2_test.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MainController {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
