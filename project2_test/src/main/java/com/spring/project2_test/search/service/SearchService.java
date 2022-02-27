package com.spring.project2_test.search.service;

import java.util.List;

import com.spring.project2_test.search.vo.SearchVO;



public interface SearchService {
	public List<SearchVO> searchRest(String searchWord) throws Exception;
	public List<String> keywordSearch(String keyword)throws Exception;
	public void searchCount(String searchWord) throws Exception;
	public List<SearchVO> sideRest(String searchWord) throws Exception;	}
