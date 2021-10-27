package com.spring.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.goods.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/special")
	public void test()throws Exception{
		System.out.println("혼자야?");
		 
		
		
	}
	
	
}
