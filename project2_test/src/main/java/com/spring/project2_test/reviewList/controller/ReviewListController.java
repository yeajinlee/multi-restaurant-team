package com.spring.project2_test.reviewList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.detail.vo.DetailReviewVO;

public interface ReviewListController {
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity updateReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ResponseEntity deleteReview(@RequestParam("rest_NO") int rest_NO, DetailReviewVO detailReviewVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
