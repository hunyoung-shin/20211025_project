package com.spring.board.vo;

import java.util.List;

public class BoardVo {
	
	private String 	boardType;
	private int boardNum;
	private String 	boardTitle;
	private String 	boardComment;
	private String 	creator;
	private String	modifier;
	private int totalCnt;
	private List<BoardVo> boardVoList;
	private String codeId;
	private String codeName;
	private String codeType;
	private String checked;
	private int pageNo;
	private String boardUserName;
	
	public String getBoardUserName() {
		return boardUserName;
	}
	public void setBoardUserName(String boardUserName) {
		this.boardUserName = boardUserName;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public List<BoardVo> getBoardVoList() {
		return boardVoList;
	}
	public void setBoardVoList(List<BoardVo> boardVoList) {
		this.boardVoList = boardVoList;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	
	
}
