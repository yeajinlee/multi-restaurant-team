package com.spring.project2_test.search.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("searchVO")
public class SearchVO {
	private int rest_NO;
	private String rest_Name;
	private String rest_Address;
	private int rest_View;
	private Date rest_OpenDate;
	private String img_fileName;
	
	
	public String getImg_fileName() {
		return img_fileName;
	}

	public void setImg_fileName(String img_fileName) {
		this.img_fileName = img_fileName;
	}

	public SearchVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getRest_NO() {
		return rest_NO;
	}
	public void setRest_NO(int rest_NO) {
		this.rest_NO = rest_NO;
	}
	public String getRest_Name() {
		return rest_Name;
	}
	public void setRest_Name(String rest_Name) {
		this.rest_Name = rest_Name;
	}
	public String getRest_Address() {
		return rest_Address;
	}
	public void setRest_Address(String rest_Address) {
		this.rest_Address = rest_Address;
	}
	public int getRest_View() {
		return rest_View;
	}
	public void setRest_View(int rest_View) {
		this.rest_View = rest_View;
	}
	public Date getRest_OpenDate() {
		return rest_OpenDate;
	}
	public void setRest_OpenDate(Date rest_OpenDate) {
		this.rest_OpenDate = rest_OpenDate;
	}

	
	

}
