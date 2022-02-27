package com.spring.project2_test.specList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.specList.dao.SpecListDAO;
import com.spring.project2_test.specList.vo.SpecListVO;

@Service("specListService")
public class SpecListServiceImpl implements SpecListService{

	
	@Autowired
	private SpecListDAO specListDAO;
	
	@Override
	public List<SpecListVO> specRest(String rest_theme) throws Exception {
		System.out.println("여기옴 서비스");
		List<SpecListVO> specList = specListDAO.selectSpecList(rest_theme);
	
		return specList;
	}

}
