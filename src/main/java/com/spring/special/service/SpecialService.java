package com.spring.special.service;

import java.util.List;

import com.spring.brand.vo.BrandVo;
import com.spring.special.vo.SpecialVo;

public interface SpecialService {
	
	public void test()throws Exception;
	
	public List<SpecialVo> selectList()throws Exception;
	
	public SpecialVo speicalView(SpecialVo specialVo)throws Exception;
	
	public int speicalInsert(SpecialVo specialVo)throws Exception;
	
	public int specialDelete(SpecialVo specialVo) throws Exception;

	public List<String> s_themeList()throws Exception;
	
	public List<SpecialVo> s_specialList()throws Exception;

	public List<BrandVo> s_brandList()throws Exception;
	   
}
