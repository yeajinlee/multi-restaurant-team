package com.spring.project2_test.reconList.vo;

import org.springframework.stereotype.Component;

@Component("reconListVO")
public class ReconListVO {

	private String rest_theme;
	public String getRest_theme() {
	return rest_theme;
	}
	public void setRest_theme(String rest_theme) {
	this.rest_theme = rest_theme;
	}
	public ReconListVO() {
	}
}
