package com.spring.project2_test.specList.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.specList.vo.SpecListVO;

public interface SpecListDAO {

	List<SpecListVO> selectSpecList(String rest_theme) throws Exception;

}
