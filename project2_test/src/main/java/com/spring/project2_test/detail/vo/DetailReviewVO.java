package com.spring.project2_test.detail.vo;

import java.sql.Date;

public class DetailReviewVO {
	private int review_NO;
	private String user_ID;
	private int review_Scope;
	private String review_Text;
	private int rest_NO;
	private Date review_Date;
	
	public int getReview_NO() {
		return review_NO;
	}
	public void setReview_NO(int review_NO) {
		this.review_NO = review_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public int getReview_Scope() {
		return review_Scope;
	}
	public void setReview_Scope(int review_Scope) {
		this.review_Scope = review_Scope;
	}
	public String getReview_Text() {
		return review_Text;
	}
	public void setReview_Text(String review_Text) {
		this.review_Text = review_Text;
	}
	public int getRest_NO() {
		return rest_NO;
	}
	public void setRest_NO(int rest_NO) {
		this.rest_NO = rest_NO;
	}
	public Date getReview_Date() {
		return review_Date;
	}
	public void setReview_Date(Date review_Date) {
		this.review_Date = review_Date;
	}
	
	
}
