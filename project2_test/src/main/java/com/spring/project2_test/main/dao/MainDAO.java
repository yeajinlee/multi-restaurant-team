package com.spring.project2_test.main.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface MainDAO {

	public List selectRestList() throws DataAccessException;



}
