package com.spring.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.goods.service.GoodsService;

@Controller
public class goodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/goods/goodsTest.do")
	public String test() throws Exception{
		System.out.println("나 실행됬음aa!");
		
		return "/goods/goodsTest";
	}

}
