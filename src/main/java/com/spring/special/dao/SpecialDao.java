package com.spring.special.dao;

import java.util.List;

import com.spring.special.vo.SpecialVo;

public interface SpecialDao {
	
	public void test()throws Exception;
	
	public List<SpecialVo> selectList()throws Exception;
	
	public SpecialVo specialView(SpecialVo specialVo)throws Exception;
	
	public int speicalInsert(SpecialVo specialVo)throws Exception;
	
	public int specialDelete(SpecialVo specialVo) throws Exception;

}