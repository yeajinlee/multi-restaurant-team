package com.spring.project2_test.reviewList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

@Repository("reviewListDAO")
public class ReviewListDAOImpl implements ReviewListDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewListVO> selectAllReviewOdd() throws DataAccessException {
		List<ReviewListVO> reviewList = sqlSession.selectList("mappers.review.selectAllReviewOdd");
		return reviewList;
	}

	@Override
	public List selectAllReviewEven() throws DataAccessException {
		List<ReviewListVO> reviewList = sqlSession.selectList("mappers.review.selectAllReviewEven");
		return reviewList;
		}
}
