package com.spring.project2_test.reconList.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.reconList.vo.ReconListVO;

public interface ReconListService {

	List<ReconListVO> ReconRest() throws Exception;
	

}
