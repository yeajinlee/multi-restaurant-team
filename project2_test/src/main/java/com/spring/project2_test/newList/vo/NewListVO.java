package com.spring.project2_test.newList.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("newListVO")
public class NewListVO {
	private String rest_Name;
	private String rest_FileName;
	private Date rest_OpenDate;
	private int rest_NO;
	private String rest_Price;
	private String rest_Address;
	private String rest_Scope;
	private String rest_Social;
	private String user_ID;
	public String getRest_Name() {
		return rest_Name;
	}
	public void setRest_Name(String rest_Name) {
		this.rest_Name = rest_Name;
	}
	public String getRest_FileName() {
		return rest_FileName;
	}
	public void setRest_FileName(String rest_FileName) {
		this.rest_FileName = rest_FileName;
	}
	public Date getRest_OpenDate() {
		return rest_OpenDate;
	}
	public void setRest_OpenDate(Date rest_OpenDate) {
		this.rest_OpenDate = rest_OpenDate;
	}
	public int getRest_NO() {
		return rest_NO;
	}
	public void setRest_NO(int rest_NO) {
		this.rest_NO = rest_NO;
	}
	public String getRest_Price() {
		return rest_Price;
	}
	public void setRest_Price(String rest_Price) {
		this.rest_Price = rest_Price;
	}
	public String getRest_Address() {
		return rest_Address;
	}
	public void setRest_Address(String rest_Address) {
		this.rest_Address = rest_Address;
	}
	public String getRest_Scope() {
		return rest_Scope;
	}
	public void setRest_Scope(String rest_Scope) {
		this.rest_Scope = rest_Scope;
	}
	public String getRest_Social() {
		return rest_Social;
	}
	public void setRest_Social(String rest_Social) {
		this.rest_Social = rest_Social;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	


}
