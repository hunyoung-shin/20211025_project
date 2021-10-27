package com.spring.special.dao;

import java.util.List;

import com.spring.special.vo.specialVo;

public interface SpecialDao {
	
	public void test()throws Exception;
	
	public List<specialVo> selectList()throws Exception;
	
	public specialVo specialView(specialVo specialVo)throws Exception;
	
	public int speicalInsert(specialVo specialVo)throws Exception;

}