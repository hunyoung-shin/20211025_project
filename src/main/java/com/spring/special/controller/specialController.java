package com.spring.special.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.special.service.SpecialService;
import com.spring.special.vo.specialVo;

@Controller
public class specialController {
	
	@Autowired
	SpecialService specialService;
	
	
	
	
	@RequestMapping(value="/special/goodsTest.do", method = RequestMethod.GET)
	public String test()throws Exception{
		System.out.println("나 실행됬음aaaaaaaaa!");
		
		return "/goods/goodsTest";
	}
	
	//List 조회
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList()throws Exception{
		List<specialVo> s_list = new ArrayList();
		s_list = specialService.selectList();
		
		return null;
	}
	
	
	
	//CREATE
	@RequestMapping(value="/special/makeGoods.do")
	public String makeGoods()throws Exception{
		
		
		return null;
	}
	
	//DELETE
	@RequestMapping(value="/special/delGoods.do")
	public String delGoods()throws Exception{
		
		
		return null;
	}
	
	//UPDATE
	@RequestMapping(value="/special/updateGoods.do")
	public String updateGoods()throws Exception{
		
		return null;
	}
	
	//MODIFY
	@RequestMapping(value="/spcial/modifyGoods.do")
	public String modifyGoods()throws Exception{
		
		return null;
	}
	

}
