package com.spring.project2_test.detail.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.detail.vo.ReviewVO;


@Repository("detailDAO")
public class DetailDAOImpl implements DetailDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException {
		DetailVO detailVO = (DetailVO) sqlSession.selectOne("mappers.detail.selectRestDetail", rest_NO);
		return detailVO;
	}
	@Override
	public List selectAllDetailImg(int rest_NO) throws DataAccessException {
		List detailImgList = sqlSession.selectList("mappers.detail.selectRestImg", rest_NO);
		return detailImgList;
	}
	
	@Override
	public List selectAllReview(int rest_NO) throws DataAccessException {
		List detailReviewList = sqlSession.selectList("mappers.detail.selectAllReview", rest_NO);
		return detailReviewList;
	}
	
	@Override
	public int countReview(int rest_NO) throws DataAccessException {
		return sqlSession.selectOne("mappers.detail.countReview", rest_NO);
	}
	
	@Override
	public List selectSideList() throws DataAccessException {
		List detailSideList = sqlSession.selectList("mappers.detail.selectSideList");
		return detailSideList;
	}
	
//	@Override
//	public void insertNewReview(Map reviewMap) throws DataAccessException {
//		List<ImageVO> imageFileList = (ArrayList) reviewMap.get("imageFileList");
//		int review_NO = (Integer) reviewMap.get("review_NO");
//		int img_FileNO = selectNewImgFileNO();
//		sqlSession.insert("mappers.detailReview.addNewReview", reviewVO);
		
//	}
//	@Override
//	public int insertNewReview(Map reviewMap) throws DataAccessException {
//		int review_NO = selectNewReviewNO();
////		int rest_NO = selectRestNO();
//		reviewMap.put("review_NO", review_NO);
////		reviewMap.put("rest_NO", rest_NO);
//		sqlSession.insert("mappers.detailReview.addNewReview", reviewMap);
//		return review_NO;
//	}
	
	@Override
	public void insertNewReview(DetailReviewVO detailReviewVO) throws DataAccessException {
		sqlSession.insert("mappers.detailReview.addNewReview", detailReviewVO);

	
	}

	
	@Override
	public void insertNewReviewImg(ImageVO imageVO) throws DataAccessException {
		sqlSession.insert("mappers.detailReview.addNewReviewImg", imageVO);

		

	}
	
	
	private int selectNewReviewNO() {
		return sqlSession.selectOne("mappers.detailReview.selectNewReviewNO");
}
	@Override
	public void insertNewImage(Map reviewMap) throws DataAccessException {
		List<ImageVO> imgFileList = (ArrayList<ImageVO>)reviewMap.get("imgFileList");
		int review_NO = (Integer) reviewMap.get("review_NO");
		for (ImageVO imageVO : imgFileList) {
			imageVO.setReview_NO(review_NO);
		}
		sqlSession.insert("mappers.detailReview.addNewReviewImg", imgFileList);
		
	}
	
//	@Override
//	public int selectRestNO() throws DataAccessException {
//		return sqlSession.selectOne("mappers.detailReview.selectRestNO");
//	}
	

	@Override

	public void deleteReview(DetailReviewVO detailReviewVO) throws DataAccessException {
		sqlSession.delete("mappers.detailReview.deleteReview", detailReviewVO);

		
	}
	
	@Override

	public void updateReview(DetailReviewVO detailReviewVO) throws DataAccessException {
		sqlSession.update("mappers.detailReview.updateReview", detailReviewVO);

		
	}

}
