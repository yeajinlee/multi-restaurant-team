package com.spring.project2_test.reviewList.service;

import java.util.List;
import java.util.Map;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

public interface ReviewListService {

	public List<ReviewListVO> reviewListOdd() throws Exception;
	public List<ReviewListVO> reviewListEven() throws Exception;
}
