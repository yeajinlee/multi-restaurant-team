package com.spring.project2_test.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.main.dao.MainDAO;


@Service("mainService")
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List restList() throws Exception {
		List restList = mainDAO.selectRestList();
		return restList;
	}
}
