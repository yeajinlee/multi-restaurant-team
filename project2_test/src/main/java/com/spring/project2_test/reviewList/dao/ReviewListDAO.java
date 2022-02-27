package com.spring.project2_test.reviewList.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

public interface ReviewListDAO {

	public List<ReviewListVO> selectAllReviewOdd() throws DataAccessException;

	public List<ReviewListVO> selectAllReviewEven() throws DataAccessException;

}
