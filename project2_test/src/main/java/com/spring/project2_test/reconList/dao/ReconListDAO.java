package com.spring.project2_test.reconList.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ReconListDAO {

	List selectTheme() throws DataAccessException;

}
