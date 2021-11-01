package com.spring.special.dao;

import java.util.List;

import com.spring.brand.vo.BrandVo;
import com.spring.special.vo.BannerVo;
import com.spring.special.vo.SpecialVo;

public interface SpecialDao {

	public void test()throws Exception;

	public List<SpecialVo> selectList()throws Exception;

	public SpecialVo specialView(int s_Num)throws Exception;
	
	public BannerVo bannerView(int s_Num)throws Exception;
	
	public List<String> linkSelect(String br_Id)throws Exception;

	public int speicalInsert(SpecialVo specialVo)throws Exception;
	
	public int bannerInsert(BannerVo bannerVo)throws Exception;

	public int specialDelete(SpecialVo specialVo) throws Exception;

	public List<BrandVo> s_themeList()throws Exception;

	public List<SpecialVo> s_specialList()throws Exception;

	public List<BrandVo> s_brandList()throws Exception;

}