package com.spring.special.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BannerVo {

	private String s_Num;
	private String main_img;
	private MultipartFile main_imgFile;
	private String link_img;
	private MultipartFile link_imgFile;
	private String ban_img;
	private List<MultipartFile> ban_imgFile;
	private String ban_video;
	private String br_Id;
	

	public String getBr_Id() {
		return br_Id;
	}
	public void setBr_Id(String br_Id) {
		this.br_Id = br_Id;
	}
	public String getS_Num() {
		return s_Num;
	}
	public void setS_Num(String s_Num) {
		this.s_Num = s_Num;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public MultipartFile getMain_imgFile() {
		return main_imgFile;
	}
	public void setMain_imgFile(MultipartFile main_imgFile) {
		this.main_imgFile = main_imgFile;
	}
	public String getLink_img() {
		return link_img;
	}
	public void setLink_img(String link_img) {
		this.link_img = link_img;
	}
	public MultipartFile getLink_imgFile() {
		return link_imgFile;
	}
	public void setLink_imgFile(MultipartFile link_imgFile) {
		this.link_imgFile = link_imgFile;
	}
	public String getBan_img() {
		return ban_img;
	}
	public void setBan_img(String ban_img) {
		this.ban_img = ban_img;
	}
	public List<MultipartFile> getBan_imgFile() {
		return ban_imgFile;
	}
	public void setBan_imgFile(List<MultipartFile> ban_imgFile) {
		this.ban_imgFile = ban_imgFile;
	}
	public String getBan_video() {
		return ban_video;
	}
	public void setBan_video(String ban_video) {
		this.ban_video = ban_video;
	}
	
	
}
