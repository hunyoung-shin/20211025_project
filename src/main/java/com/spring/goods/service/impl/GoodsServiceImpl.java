package com.spring.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goods.dao.GoodsDao;
import com.spring.goods.service.GoodsService;
import com.spring.special.vo.SpecialVo;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDao goodsDao;
	
	public List<SpecialVo> specialList() throws Exception{
		
		return goodsDao.specialList();
	}
	
}
