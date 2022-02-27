package com.spring.project2_test.detail.service;

import java.util.List;
import java.util.Map;

import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.detail.vo.ReviewVO;

public interface DetailService {

	public Map detailContent(int rest_NO) throws Exception;

	public List detailImage(int rest_NO) throws Exception;

	public List<ReviewVO> reviewList(int rest_NO) throws Exception;
	
	public int reviewCount(int rest_NO) throws Exception;

	public List detailSideList() throws Exception;


	public void deleteReview(DetailReviewVO detailReviewVO) throws Exception;

	public void updateReview(DetailReviewVO detailReviewVO) throws Exception;

	public void addNewReview(DetailReviewVO detailReviewVO) throws Exception;

	public void addNewReviewImg(ImageVO imageVO) throws Exception;


	


}
