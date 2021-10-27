package com.spring.special.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.special.dao.SpecialDao;
import com.spring.special.service.SpecialService;
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
	public SpecialVo speicalView(SpecialVo specialVo)throws Exception{
		return specialDao.specialView(specialVo);
	};
	
	@Override
	public int speicalInsert(SpecialVo specialVo)throws Exception{
	
		return specialDao.speicalInsert(specialVo);
	}
	@Override
	   public int specialDelete(SpecialVo specialVo) throws Exception {
	      return specialDao.specialDelete(specialVo);
	   }
	
}
