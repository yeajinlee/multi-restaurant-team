package com.spring.project2_test.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;



@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List selectRestList() throws DataAccessException {
		List restList = sqlSession.selectList("mappers.main.selectRestList");
		return restList;
	}
	
	
}
