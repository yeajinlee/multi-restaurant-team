package com.spring.project2_test.detail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.detail.dao.DetailDAO;
import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.detail.vo.ReviewVO;

@Service("detailService")
public class DetailServiceImpl implements DetailService{
	@Autowired
	private DetailDAO detailDAO;
	
	@Override
	public Map detailContent(int rest_NO) throws Exception {
		Map detailMap = new HashMap();
		DetailVO detailVO = detailDAO.selectDetailContent(rest_NO);
		detailMap.put("detailVO", detailVO);
		return detailMap;
	}
	
	@Override
	public List detailImage(int rest_NO) throws Exception {
		List detailImgList = detailDAO.selectAllDetailImg(rest_NO);
		return detailImgList;
	}
	
	@Override
	public List<ReviewVO> reviewList(int rest_NO) throws Exception {
		List<ReviewVO> detailReviewList= detailDAO.selectAllReview(rest_NO);
		return detailReviewList;
	}
	
	@Override
	public int reviewCount(int rest_NO) throws Exception {
		int reviewCnt = detailDAO.countReview(rest_NO);
		return reviewCnt;
	}
	
	@Override
	public List detailSideList() throws Exception {
		List detailSideList = detailDAO.selectSideList();
		return detailSideList;
	}

//	@Override
//	public int writeReview(Map reviewMap) throws Exception {
//		int review_NO = detailDAO.insertNewReview(reviewMap);
//		reviewMap.put("review_NO", review_NO);
//		detailDAO.insertNewImage(reviewMap);
//		return review_NO;
//	}
	
	@Override
	public void addNewReview(DetailReviewVO detailReviewVO) throws Exception {
		detailDAO.insertNewReview(detailReviewVO);
	}
	

	@Override
	public void addNewReviewImg(ImageVO imageVO) throws Exception {
		detailDAO.insertNewReviewImg(imageVO);
		
	}

//	@Override
//	public int selectRestNO() throws Exception {
//		int rest_NO = detailDAO.selectRestNO();
//		return rest_NO;
//	}
	

	@Override
	public void deleteReview(DetailReviewVO detailReviewVO) throws Exception {
		detailDAO.deleteReview(detailReviewVO);

		
	}
	
	@Override
	public void updateReview(DetailReviewVO detailReviewVO) throws Exception {
		detailDAO.updateReview(detailReviewVO);

		
	}

	
}
