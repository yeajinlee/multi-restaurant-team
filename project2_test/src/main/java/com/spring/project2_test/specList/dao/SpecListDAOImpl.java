package com.spring.project2_test.specList.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.specList.vo.SpecListVO;

@Repository("specListDAO")
public class SpecListDAOImpl implements SpecListDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SpecListVO> selectSpecList(String rest_theme) throws Exception {
		System.out.println("����� �ٿ�");
		List<SpecListVO> specList= sqlSession.selectList("mappers.spec.selectSpecList", rest_theme);
		System.out.println("�ٽð����� �ٿ�2");
		return specList;
	}



}
