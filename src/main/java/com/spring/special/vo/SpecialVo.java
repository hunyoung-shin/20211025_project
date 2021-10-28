package com.spring.special.vo;

import org.springframework.web.multipart.MultipartFile;

public class SpecialVo {

	private int s_Num;
	private String s_title;
	private MultipartFile s_image;
	private String s_theme;
	private String s_notice;
	private MultipartFile s_linkImg;
	private String s_brandId;
	public int getS_Num() {
		return s_Num;
	}
	public void setS_Num(int s_Num) {
		this.s_Num = s_Num;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_theme() {
		return s_theme;
	}
	public void setS_theme(String s_theme) {
		this.s_theme = s_theme;
	}
	public String getS_notice() {
		return s_notice;
	}
	public void setS_notice(String s_notice) {
		this.s_notice = s_notice;
	}
	public MultipartFile getS_image() {
		return s_image;
	}
	public void setS_image(MultipartFile s_image) {
		this.s_image = s_image;
	}
	public MultipartFile getS_linkImg() {
		return s_linkImg;
	}
	public void setS_linkImg(MultipartFile s_linkImg) {
		this.s_linkImg = s_linkImg;
	}
	public String getS_brandId() {
		return s_brandId;
	}
	public void setS_brandId(String s_brandId) {
		this.s_brandId = s_brandId;
	}

}
