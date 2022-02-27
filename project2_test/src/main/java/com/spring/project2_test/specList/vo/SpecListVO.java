package com.spring.project2_test.specList.vo;

import org.springframework.stereotype.Component;

@Component("specListVO")

public class SpecListVO {
private String rest_name;
private String rest_fileName;
private String review_text;
private String rest_theme;
private String rest_Address;
private int rest_No;

public String getRest_Address() {
	return rest_Address;
}
public void setRest_Address(String rest_Address) {
	this.rest_Address = rest_Address;
}
public String getRest_name() {
	return rest_name;
}
public void setRest_name(String rest_name) {
	this.rest_name = rest_name;
}
public String getRest_fileName() {
	return rest_fileName;
}
public void setRest_fileName(String rest_fileName) {
	this.rest_fileName = rest_fileName;
}
public String getReview_text() {
	return review_text;
}
public void setReview_text(String review_text) {
	this.review_text = review_text;
}
public String getRest_theme() {
	return rest_theme;
}
public void setRest_theme(String rest_theme) {
	this.rest_theme = rest_theme;
}
public int getRest_No() {
	return rest_No;
}
public void setRest_No(int rest_No) {
	this.rest_No = rest_No;
}

public SpecListVO() {
	// TODO Auto-generated constructor stub
}
}
