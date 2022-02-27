package com.spring.project2_test.reconList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.reconList.dao.ReconListDAO;
import com.spring.project2_test.reconList.vo.ReconListVO;


@Service("reconListService")
public class ReconListServiceImpl implements ReconListService{

	@Autowired
	ReconListDAO reconListDAO;
	
	@Override
	public List<ReconListVO> ReconRest() throws Exception {
		List<ReconListVO> reconList =reconListDAO.selectTheme();
		System.out.println("serv");
		return reconList;
	}

}
