package com.spring.project2_test.search.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.project2_test.search.dao.SearchDAO;
import com.spring.project2_test.search.vo.SearchVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;

	@Override
	public List<SearchVO> searchRest(String searchWord) throws Exception {
		List<SearchVO> restLists = searchDAO.selectBySearchWord(searchWord);
		System.out.println("this is service");
		return restLists;
	}
	public void searchCount(String searchWord) throws Exception {
		searchDAO.countBy(searchWord);
	}
	@Override
	public List<SearchVO> sideRest(String searchWord) throws Exception {
		List<SearchVO> sideLists = searchDAO.sideBySearchWord(searchWord);
		System.out.println("this is side Service");
		return sideLists;
	}
	
	
	
	@Override
	public List<String> keywordSearch(String keyword) {
		List<String> list = searchDAO.selectKeywordSearch(keyword);
		return list;
	}
}
