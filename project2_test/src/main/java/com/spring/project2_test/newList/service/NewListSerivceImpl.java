package com.spring.project2_test.newList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.newList.dao.NewListDAO;
import com.spring.project2_test.newList.vo.NewListVO;
import com.spring.project2_test.newList.vo.NewListVO2;
@Service("newListService")
public class NewListSerivceImpl implements NewListService{

	@Autowired
	private NewListDAO newListDAO;
	
	@Override
	public List<NewListVO> newRest() throws Exception {
	List<NewListVO> newList= newListDAO.selectNewList();
		return newList;
	}
	@Override
	public List<NewListVO2> newDef() throws Exception {
	List<NewListVO2> defaultList= newListDAO.defaultNewList();
		return defaultList;
	}
}
