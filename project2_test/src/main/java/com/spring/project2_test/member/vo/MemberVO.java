package com.spring.project2_test.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
private String user_ID;
private String user_PW;
private String user_Nickname;
private String user_Birth;
private Integer user_Gender;
private String user_City;
private String user_Email;
private String user_Phone;
private Integer user_Level;
private String user_Profile;


public MemberVO() {
	// TODO Auto-generated constructor stub
}
public MemberVO(String user_ID, String user_PW, String user_Nickname, String user_Birth, Integer user_Gender,
		String user_City, String user_Email, String user_Phone, Integer user_Level, String user_Profile) {
	super();
	this.user_ID = user_ID;
	this.user_PW = user_PW;
	this.user_Nickname = user_Nickname;
	this.user_Birth = user_Birth;
	this.user_Gender = user_Gender;
	this.user_City = user_City;
	this.user_Email = user_Email;
	this.user_Phone = user_Phone;
	this.user_Level = user_Level;
	this.user_Profile = user_Profile;
}

public String getUser_ID() {
	return user_ID;
}
public void setUser_ID(String user_ID) {
	this.user_ID = user_ID;
}
public String getUser_PW() {
	return user_PW;
}
public void setUser_PW(String user_PW) {
	this.user_PW = user_PW;
}
public String getUser_Nickname() {
	return user_Nickname;
}
public void setUser_Nickname(String user_Nickname) {
	this.user_Nickname = user_Nickname;
}
public String getUser_Birth() {
	return user_Birth;
}
public void setUser_Birth(String user_Birth) {
	this.user_Birth = user_Birth;
}
public Integer getUser_Gender() {
	return user_Gender;
}
public void setUser_Gender(Integer user_Gender) {
	this.user_Gender = user_Gender;
}
public String getUser_City() {
	return user_City;
}
public void setUser_City(String user_City) {
	this.user_City = user_City;
}
public String getUser_Email() {
	return user_Email;
}
public void setUser_Email(String user_Email) {
	this.user_Email = user_Email;
}
public String getUser_Phone() {
	return user_Phone;
}
public void setUser_Phone(String user_Phone) {
	this.user_Phone = user_Phone;
}
public Integer getUser_Level() {
	return user_Level;
}
public void setUser_Level(Integer user_Level) {
	this.user_Level = user_Level;
}
public String getUser_Profile() {
	return user_Profile;
}
public void setUser_Profile(String user_Profile) {
	this.user_Profile = user_Profile;
}



}
