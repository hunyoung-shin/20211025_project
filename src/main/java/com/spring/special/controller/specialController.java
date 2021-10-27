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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.brand.vo.BrandVo;
import com.spring.special.service.SpecialService;
import com.spring.special.vo.SpecialVo;

@Controller
public class specialController {
	
	@Autowired
	SpecialService specialService;
	
	//LIST
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList(HttpSession session, Model model)throws Exception{
		
		// xml파일까지 작성 후 실행 해볼 것 -> 중간중간 '지뢰' 있음
		
		BrandVo brandVo = new BrandVo();
		// brandVo 가져올 필요가 있음 -> theme도 brandVo에 넣어서 가져올 수 있도록(또는 새로 db table 생성)
		List<String> themeList = new ArrayList<String>();
		List<SpecialVo> specialList = new ArrayList<SpecialVo>();
		List<BrandVo> brandList = new ArrayList<BrandVo>();

		/*
		 * themeList = specialService.s_themeList(); specialList =
		 * specialService.s_specialList(); brandList = specialService.s_brandList();
		 */
		 
		/*service에서 db까지 왔다갔다 할 3개
		 brandVo
		 themeList
		 specialList
		 */
		
		// model에 적용 (theme이랑 special도)
		model.addAttribute("brandVo", brandVo);
		
		return "/special/list";
	}
	
	//VIEW
	@RequestMapping(value="/special/{s_num}/view.do", method = RequestMethod.GET)
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
	@RequestMapping(value="/special/makeSpecialGoods.do", method = RequestMethod.GET)
	public String makeSpecialGoods(SpecialVo specialVo, Model model) throws Exception{
		
		model.addAttribute("s_title", specialVo.getS_title());
		model.addAttribute("s_brandInit", specialVo.getS_brandInit());
		
	return "/special/makeGoods";
	}
	@RequestMapping(value="/special/makeSpecialGoodsAction.do",method = RequestMethod.GET)
	@ResponseBody
	public String makeSpecialGoodsAction() throws Exception{
	
		return "안만듬 아직";
	}

	// 새 기획전 CREATE PAGE
	@RequestMapping(value="/special/makeSpecialPage.do",method = RequestMethod.GET)
	public String makeSpecialPage() throws Exception{
		
		return "/special/makeSpecial";
	}
	@RequestMapping(value="/special/makeSpecialPageAction.do",method = RequestMethod.GET)
	@ResponseBody
	public String makeSpecialPageAction() throws Exception{
	
		return "안만듬 아직";
	}
	
	//DELETE
	@RequestMapping(value="/special/delSpecial.do")
	public String delSpecial(SpecialVo specialVo)throws Exception{
		
		int delSpecial = 0;
		delSpecial = specialService.specialDelete(specialVo);
				
		return "/special/list.do";
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
