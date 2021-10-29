package com.spring.special.vo;

import org.springframework.web.multipart.MultipartFile;

public class SpecialVo {

	private int s_Num;
	private String s_title;
	private MultipartFile s_image;
	private String s_imagePath;
	private String s_theme;
	private String s_notice;
	private MultipartFile s_linkImg;
	private String s_linkImgPath;
	private String br_Name;
	
	public String getBr_Name() {
		return br_Name;
	}
	public void setBr_Name(String br_Name) {
		this.br_Name = br_Name;
	}
	public String getS_imagePath() {
		return s_imagePath;
	}
	public void setS_imagePath(String s_imagePath) {
		this.s_imagePath = s_imagePath;
	}
	public String getS_linkImgPath() {
		return s_linkImgPath;
	}
	public void setS_linkImgPath(String s_linkImgPath) {
		this.s_linkImgPath = s_linkImgPath;
	}
	public String getS_brandInit() {
		return s_brandInit;
	}
	public void setS_brandInit(String s_brandInit) {
		this.s_brandInit = s_brandInit;
	}
	private String s_brandId;
	private String s_brandInit;
	
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
