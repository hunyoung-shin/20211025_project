package com.spring.special.dao;

import java.util.List;

import com.spring.special.vo.specialVo;

public interface SpecialDao {
	
	public void test()throws Exception;
	
	public List<specialVo> selectList()throws Exception;
	
	public specialVo speicalView(specialVo specialVo)throws Exception;
	
}
