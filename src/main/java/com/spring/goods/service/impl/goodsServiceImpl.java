package com.spring.goods.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goods.dao.goodsDao;
import com.spring.goods.service.GoodsService;

@Service
public class goodsServiceImpl implements GoodsService{
	@Autowired
	goodsDao goodsDao; 
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
