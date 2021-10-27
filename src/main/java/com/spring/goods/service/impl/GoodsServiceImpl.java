package com.spring.goods.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goods.dao.GoodsDao;
import com.spring.goods.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDao goodsDao;
	
	
}
