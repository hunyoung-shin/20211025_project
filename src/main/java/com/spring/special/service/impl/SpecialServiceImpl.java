package com.spring.special.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.special.dao.SpecialDao;
import com.spring.special.service.SpecialService;
import com.spring.special.vo.specialVo;

@Service
public class SpecialServiceImpl implements SpecialService{
	
	@Autowired
	SpecialDao specialDao;
	
	@Override
	public void test()throws Exception{};
	
	@Override
	public List<specialVo> selectList() throws Exception{
		
		return specialDao.selectList();
		
	}
	@Override
	public specialVo speicalView(specialVo specialVo)throws Exception{
		return specialDao.specialView(specialVo);
	};
}
