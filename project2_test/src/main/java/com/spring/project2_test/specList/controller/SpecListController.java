package com.spring.project2_test.specList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.driver.DatabaseError;

public interface SpecListController {

	public ModelAndView specList(@RequestParam("rest_theme") String rest_theme,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	}
	

