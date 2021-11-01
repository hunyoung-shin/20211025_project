package com.spring.special.vo;

public class SpecialVo {

	private int s_Num;
	private String s_title;
	private String s_theme;
	private String s_notice;
	private String br_Id;
	private String br_Name;
	private String main_img;	// 메인페이지용 이미지
	
	
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getBr_Id() {
		return br_Id;
	}
	public void setBr_Id(String br_Id) {
		this.br_Id = br_Id;
	}
	public String getBr_Name() {
		return br_Name;
	}
	public void setBr_Name(String br_Name) {
		this.br_Name = br_Name;
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
	public String getS_brandId() {
		return s_brandId;
	}
	public void setS_brandId(String s_brandId) {
		this.s_brandId = s_brandId;
	}

}
