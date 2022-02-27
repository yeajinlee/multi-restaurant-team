package com.spring.project2_test.newList.service;

import java.util.List;

import com.spring.project2_test.newList.vo.NewListVO;
import com.spring.project2_test.newList.vo.NewListVO2;


public interface NewListService {

	public List<NewListVO> newRest() throws Exception;

	public List<NewListVO2> newDef() throws Exception;
}
