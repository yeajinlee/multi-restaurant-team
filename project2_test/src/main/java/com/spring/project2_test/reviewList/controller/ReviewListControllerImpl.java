package com.spring.project2_test.reviewList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.detail.service.DetailService;
import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.reviewList.service.ReviewListService;

@Controller("reviewListController")
public class ReviewListControllerImpl implements ReviewListController {
	@Autowired
	private ReviewListService reviewListService;
	
	@Autowired
	private DetailService detailService;
	
	
	@Override
	@RequestMapping(value="/reviewList.do", method=RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List reviewListOdd = reviewListService.reviewListOdd();
		mav.addObject("reviewListlOdd", reviewListOdd);
		List reviewListEven = reviewListService.reviewListEven();
		mav.addObject("reviewListlEven", reviewListEven);
		return mav;
	}
	
	@Override
	@RequestMapping(value="reviewList/updateReview.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity updateReview(DetailReviewVO detailReviewVO, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String msg;
		
		try {
			detailService.updateReview(detailReviewVO);
			msg = "<script>";

			msg += "alert('UPDATE COMPLETE');";

			msg += "location.href='" + multipartRequest.getContextPath() + "/reviewList.do'";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";

			msg += "alert('UPDATE COMPLETE.')";

			msg += "location.href='" + multipartRequest.getContextPath() + "/reviewList.do'";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/reviewList/deleteReview.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity deleteReview(@RequestParam("rest_NO") int rest_NO, DetailReviewVO detailReviewVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			detailService.deleteReview(detailReviewVO);
			msg = "<script>";

			msg += "alert('DELETE COMPLETE');";

			msg += "location.href='" + request.getContextPath() + "/reviewList.do'";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";

			msg += "alert('DELETE COMPLETE.')";

			msg += "location.href='" + request.getContextPath() + "/reviewList.do'";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
}
