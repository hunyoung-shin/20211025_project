package com.spring.special.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.special.service.SpecialService;

@Controller
public class specialController {

	SpecialService specialService;
	
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList() throws Exception{
		
		return "special/list";
	}
	
	@RequestMapping(value = "special/view.do", method = RequestMethod.GET)
	public String specialView() throws Exception{
		
		return "special/view";
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
