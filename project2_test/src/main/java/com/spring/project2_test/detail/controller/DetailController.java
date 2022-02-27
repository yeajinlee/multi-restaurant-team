package com.spring.project2_test.detail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.detail.vo.ReviewVO;

public interface DetailController {

	public ModelAndView detailView(@RequestParam("rest_NO") int rest_NO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity writeReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ResponseEntity deleteReview(@RequestParam("rest_NO") int rest_NO, DetailReviewVO detailReviewVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity updateReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

}
