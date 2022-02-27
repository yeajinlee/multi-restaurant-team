package com.spring.project2_test.reconList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.reconList.vo.ReconListVO;


@Repository("reconListDAO")
public class ReconListDAOImpl implements ReconListDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReconListVO> selectTheme() throws DataAccessException {
		List<ReconListVO> reconList= sqlSession.selectList("mappers.recon.selectReconList");
		System.out.println("dao");
		return reconList;
	}

	
}
