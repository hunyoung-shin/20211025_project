package com.spring.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.goods.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	GoodsService goodsService;
}
