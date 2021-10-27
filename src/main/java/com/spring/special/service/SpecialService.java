package com.spring.special.service;

import java.util.List;

import com.spring.special.vo.specialVo;

public interface SpecialService {
	
	public void test()throws Exception;
	
	public List<specialVo> selectList()throws Exception;
	
	public specialVo speicalView(specialVo specialVo)throws Exception;
	
	public int speicalInsert(specialVo specialVo)throws Exception;
	
	public specialVo speicalDelete(specialVo specialVo)throws Exception;

	public specialVo speicalUpdate(specialVo specialVo)throws Exception;
}
