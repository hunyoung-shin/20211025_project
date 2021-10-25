package com.spring.board.vo;

import java.util.List;

public class PageVo {
	
	private int pageNo = 0;
	private String checked[];
	private List<String> checkedList;
	private List checkedA;
	
	public String[] getChecked() {
		return checked;
	}

	public void setChecked(String[] checked) {
		this.checked = checked;
	}

	public List getCheckedA() {
		return checkedA;
	}

	public void setCheckedA(List checkedA) {
		this.checkedA = checkedA;
	}

	public List<String> getCheckedList() {
		return checkedList;
	}

	public void setCheckedList(List<String> checkedList) {
		this.checkedList = checkedList;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
		
}
