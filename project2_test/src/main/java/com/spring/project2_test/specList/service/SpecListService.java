package com.spring.project2_test.specList.service;

import java.util.List;

import com.spring.project2_test.specList.vo.SpecListVO;

public interface SpecListService {

	List<SpecListVO> specRest(String rest_theme) throws Exception;

}
