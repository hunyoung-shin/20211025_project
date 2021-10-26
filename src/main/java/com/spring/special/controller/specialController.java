package com.spring.special.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	//LIST
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList(HttpSession session, specialVo specialVo)throws Exception{
		
		try {
			List<specialVo> s_list = new ArrayList();
			System.out.println(s_list);
			}
			catch(Exception e) {
				System.out.println("============================================");
				System.out.println(e.getMessage().toString());
			}
		return null;
	}
	
	
	//VIEW
	@RequestMapping(value="/special/{s_num}/view.do", method = RequestMethod.GET)
	public String specialview(HttpSession session, specialVo specialVo
			,@RequestParam("s_num")int s_num
			
			)throws Exception{
		
		try {
		specialVo view = new specialVo();
		view.setS_Num(s_num);
		view = specialService.speicalView(specialVo);
		session.setAttribute("title", specialVo.getS_title());
		session.setAttribute("brandInit", specialVo.getS_brandInit());
		}
		catch(Exception e) {
			System.out.println("============================================");
			System.out.println(e.getMessage().toString());
		}
		
		//s_list = specialService.selectList();
		//System.out.println(s_list);
		return "/special/view";
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
