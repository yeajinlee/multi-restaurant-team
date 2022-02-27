package com.spring.project2_test.newList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.newList.vo.NewListVO;
import com.spring.project2_test.newList.vo.NewListVO2;

@Repository("newListDAO")
public class NewListDAOImpl implements NewListDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NewListVO> selectNewList() throws Exception {
		List<NewListVO> newList=sqlSession.selectList("mappers.newlist.selectNewList");
		return newList;
	}
	@Override
	public List<NewListVO2> defaultNewList() throws Exception {
		List<NewListVO2> defaultList=sqlSession.selectList("mappers.newlist.defaultNewList");
		return defaultList;
	}
}
