package com.spring.special.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.special.service.SpecialService;
import com.spring.special.vo.SpecialVo;

@Controller
public class specialController {
	
	@Autowired
	SpecialService specialService;
	
	//LIST
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList(HttpSession session, SpecialVo specialVo)throws Exception{
		
		try {
			List<SpecialVo> s_list = new ArrayList();
			System.out.println(s_list);
			}
			catch(Exception e) {
				System.out.println("============================================");
				System.out.println("에러는 : "+e.getMessage().toString());;
			}
		return null;
	}
	
	//VIEW
	@RequestMapping(value="/special/view.do", method = RequestMethod.GET)
	public String specialview(HttpSession session, SpecialVo specialVo
			,@RequestParam("s_num")int s_num)throws Exception{
		
		try {
			SpecialVo view = new SpecialVo();
			view.setS_Num(s_num);
			view = specialService.speicalView(specialVo);
			session.setAttribute("s_title", specialVo.getS_title());
			session.setAttribute("s_brandInit", specialVo.getS_brandInit());
			session.setMaxInactiveInterval(60*10);
			session.getCreationTime();
		}
		catch(Exception e) {
			System.out.println("============================================");
			System.out.println("에러는 : "+e.getMessage().toString());
		}
	
		return "/special/view";
	}
	
	
	// 기획전내 상품 추가
	@RequestMapping(value="/special/makeSpeicalGoods.do", method = RequestMethod.GET)
		public String makeSpecialGoods(SpecialVo specialVo, Model model) throws Exception{
		
		model.addAttribute("s_title", specialVo.getS_title());
		model.addAttribute("s_brandInit", specialVo.getS_brandInit());
		
		return "/special/makeGoods";
	}

	// 새 기획전 CREATE
	@RequestMapping(value="/special/makeSpeicalPage.do",method = RequestMethod.GET)
		public String makeSpecialPage() throws Exception{
		
		return "/special/makeSpecial";
	}
	//DELETE
	@RequestMapping(value="/special/delSpecial.do")
	public String delSpecial(SpecialVo specialVo)throws Exception{
		
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
	@RequestMapping(value="/special/modifySpecial.do")
	public String modifyGoods()throws Exception{
		
		return null;
	}
	

}
