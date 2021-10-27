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
	
	//LIST
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList(HttpSession session, specialVo specialVo)throws Exception{
		
		try {
			List<specialVo> s_list = new ArrayList();
			System.out.println(s_list);
			}
			catch(Exception e) {
				System.out.println("============================================");
				System.out.println("에러는 : "+e.getMessage().toString());;
			}
		return null;
	}
	
	//VIEW
	@RequestMapping(value="/special/{s_num}/view.do", method = RequestMethod.GET)
	public String specialview(HttpSession session, specialVo specialVo
			,@RequestParam("s_num")int s_num)throws Exception{
		
		try {
			specialVo view = new specialVo();
			view.setS_Num(s_num);
			view = specialService.speicalView(specialVo);
			session.setAttribute("title", specialVo.getS_title());
			session.setAttribute("brandInit", specialVo.getS_brandInit());
			session.setMaxInactiveInterval(60*10);
			session.getCreationTime();
		}
		catch(Exception e) {
			System.out.println("============================================");
			System.out.println("에러는 : "+e.getMessage().toString());
		}
	
		return "/special/view";
	}
	
	
	//CREATE
	@RequestMapping(value="/speical/makeSpeical.do")
		public String makeSpecial(specialVo specialVo)throws Exception{
		
		int insertSpecial = 0;
		insertSpecial = specialService.speicalInsert(specialVo);
		
		
		return "/speical/signUp";
	}

	//CREATE
	@RequestMapping(value="/speical/makeSpeicalPage.do",method = RequestMethod.GET)
		public String makeSpecialPage(specialVo specialVo)throws Exception{
		
		return "/speical/makeSpecial";
	}
	//DELETE
	@RequestMapping(value="/special/delSpecial.do")
	public String delSpecial(specialVo specialVo)throws Exception{
		
		int delSpecial = 0;
		delSpecial = specialService.specialDelete(specialVo);
				
		return null;
	}
	
	//UPDATE
	@RequestMapping(value="/special/updateSpecial.do")
	public String updateGoods()throws Exception{
		
		return null;
	}
	
	//MODIFY
	@RequestMapping(value="/spcial/modifySpecial.do")
	public String modifyGoods()throws Exception{
		
		return null;
	}
	

}
