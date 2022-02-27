package com.spring.project2_test.newList.dao;

import java.util.List;

import com.spring.project2_test.newList.vo.NewListVO;
import com.spring.project2_test.newList.vo.NewListVO2;


public interface NewListDAO {

	public List<NewListVO2> defaultNewList() throws Exception;

	public List<NewListVO> selectNewList() throws Exception;
}
