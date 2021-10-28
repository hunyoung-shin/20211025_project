package com.spring.special.service;

import java.util.List;

import com.spring.brand.vo.BrandVo;
import com.spring.special.vo.SpecialVo;

public interface SpecialService {

	public void test()throws Exception;

	public List<SpecialVo> selectList()throws Exception;

	public SpecialVo specialView(SpecialVo specialVo)throws Exception;

	public int specialInsert(SpecialVo specialVo)throws Exception;

	public int specialDelete(SpecialVo specialVo) throws Exception;

	public List<BrandVo> s_themeList()throws Exception;

	public List<SpecialVo> s_specialList()throws Exception;

	public List<BrandVo> s_brandList()throws Exception;

}
