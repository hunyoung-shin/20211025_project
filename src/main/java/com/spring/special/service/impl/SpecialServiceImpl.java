package com.spring.special.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.brand.vo.BrandVo;
import com.spring.special.dao.SpecialDao;
import com.spring.special.service.SpecialService;
import com.spring.special.vo.BannerVo;
import com.spring.special.vo.SpecialVo;

@Service
public class SpecialServiceImpl implements SpecialService{

	@Autowired
	SpecialDao specialDao;

	@Override
	public void test()throws Exception{};

	@Override
	public List<SpecialVo> selectList() throws Exception{

		return specialDao.selectList();

	}
	@Override
	public SpecialVo specialView(int s_Num)throws Exception{
		return specialDao.specialView(s_Num);
	};
	@Override
	public BannerVo bannerView(int s_Num)throws Exception{
		return specialDao.bannerView(s_Num);
	}
	@Override
	public List<String> linkSelect(String br_Id)throws Exception{
		return specialDao.linkSelect(br_Id);
	}

	@Override
	public int specialInsert(SpecialVo specialVo)throws Exception{

		return specialDao.speicalInsert(specialVo);
	}
	@Override
	public int bannerInsert(BannerVo bannerVo)throws Exception{
		return specialDao.bannerInsert(bannerVo);
	}
	@Override
	public int specialDelete(SpecialVo specialVo) throws Exception {
		// TODO Auto-generated method stub
		return specialDao.specialDelete(specialVo);
	}

	@Override
	public List<BrandVo> s_themeList()throws Exception{
		return specialDao.s_themeList();
	}

	@Override
	public List<SpecialVo> s_specialList()throws Exception{
		return specialDao.s_specialList();
	}

	@Override
	public List<BrandVo> s_brandList()throws Exception{
		return specialDao.s_brandList();

	}
}
