package com.spring.project2_test.reviewList.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewListVO")
public class ReviewListVO {
	private String rest_Name;
	private String user_ID;
	private String user_Nickname;
	private int user_Level;
	private String user_Profile;
	private int review_NO;
	private int review_Scope;
	private String review_Text;
	private int rest_NO;
	private Date review_Date;
	private String images;
	public String getRest_Name() {
		return rest_Name;
	}
	public void setRest_Name(String rest_Name) {
		this.rest_Name = rest_Name;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getUser_Nickname() {
		return user_Nickname;
	}
	public void setUser_Nickname(String user_Nickname) {
		this.user_Nickname = user_Nickname;
	}
	public int getUser_Level() {
		return user_Level;
	}
	public void setUser_Level(int user_Level) {
		this.user_Level = user_Level;
	}
	public String getUser_Profile() {
		return user_Profile;
	}
	public void setUser_Profile(String user_Profile) {
		this.user_Profile = user_Profile;
	}
	public int getReview_NO() {
		return review_NO;
	}
	public void setReview_NO(int review_NO) {
		this.review_NO = review_NO;
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
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	
	

	
	

}
