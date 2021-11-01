package com.spring.special.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.brand.vo.BrandVo;
import com.spring.special.dao.SpecialDao;
import com.spring.special.vo.BannerVo;
import com.spring.special.vo.SpecialVo;

@Repository
public class SpecialDaoImpl implements SpecialDao{

	@Autowired
	SqlSession session;

	@Override
	public void test()throws Exception{};


	@Override
	public List<SpecialVo> selectList()throws Exception{

		return session.selectList("special.specialList");
	}

	@Override
	public SpecialVo specialView(int s_Num)throws Exception{

		return session.selectOne("special.specialView", s_Num);
	}
	
	@Override
	public BannerVo bannerView(int s_Num)throws Exception{
		
		return session.selectOne("special.bannerView", s_Num);
	}
	@Override
	public List<String> linkSelect(String br_Id)throws Exception{
		return session.selectList("special.linkSelect", br_Id);
	}

	@Override
	public int speicalInsert(SpecialVo specialVo)throws Exception{

		return session.insert("special.specialInsert", specialVo);
	}
	@Override
	public int bannerInsert(BannerVo bannerVo)throws Exception{
		
		return session.insert("special.bannerInsert", bannerVo);
	}

	@Override
	public int specialDelete(SpecialVo specialVo) throws Exception{

		return session.delete("special.specialDelete", specialVo);
	}

	@Override
	public List<BrandVo> s_themeList()throws Exception{

		return session.selectList("special.s_themeList");
	}

	@Override
	public List<SpecialVo> s_specialList()throws Exception{

		return session.selectList("special.s_specialList");
	}

	@Override
	public List<BrandVo> s_brandList()throws Exception{

		return session.selectList("special.s_brandList");
	}

}
