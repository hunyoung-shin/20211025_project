package com.spring.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.vo.BoardVo;
import com.spring.common.CommonUtil;
import com.spring.member.service.memberService;
import com.spring.member.vo.MemberVo;



@Controller
class memberController {
	
	@Autowired
	memberService MemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(memberController.class);
	
	@RequestMapping(value="/member/test.do", method=RequestMethod.GET)
		public String testController() {
			System.out.println("새로운 컨트롤러 작성완료!");
			
			return "tutorial/result";
		}
	@RequestMapping(value="/member/memberSignUp.do", method=RequestMethod.GET)
		public String memberSignUp(Model model, BoardVo boardVo) throws Exception {
		List<BoardVo> phone_num = new ArrayList();
		phone_num = MemberService.frontPhoneNum(boardVo);
		model.addAttribute("phone_num", phone_num);
		
		return "member/signUp";
	}
	
	@RequestMapping(value="/member/memberSignUpAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberSignUpAction(
			MemberVo memberVo)throws Exception {
		HashMap<String, String> result = new HashMap<String ,String>();
		System.out.println("memberSignUpAction에 도달");
		CommonUtil commonUtil = new CommonUtil();
		int memberForm = MemberService.memSignUp(memberVo);
		result.put("success", (memberForm > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
	return callbackMsg;
}
	@RequestMapping(value="/member/memberLogin.do",method=RequestMethod.GET)
		public String memberLogin() {
		
		return "/member/login";
	}
	@RequestMapping(value="/member/memberIdCheck.do",method=RequestMethod.POST)
	@ResponseBody
		public String memberIdCheck(Locale locale,MemberVo memberVo,@RequestParam String memid)throws Exception {
		//memberForm = memberService.memberSignUp(memberVo);
		//int memberForm = memberService.memIdCheck(memberVo);
		int exist = 0;
		MemberVo resultCnt = new MemberVo();
		memberVo.setUserId(memid); 	
		CommonUtil commonUtil = new CommonUtil();
		HashMap<String, String> result = new HashMap<String, String>();
		resultCnt = MemberService.memIdCheck(memberVo);
		System.out.println(resultCnt);
		if(resultCnt != null) {	
			exist += 1;
		}
		result.put("success", (exist > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		System.out.println("callbackMsg::"+callbackMsg);
		System.out.println(result.getClass().getTypeName());
		return callbackMsg;
		}
	@RequestMapping(value="/loginUser.do",method= RequestMethod.POST)
	@ResponseBody
	public String memberLogin(HttpServletRequest request,MemberVo memberVo)throws Exception{
		MemberVo userLogin = MemberService.userLogin(memberVo);
		MemberVo userIdCheck = MemberService.memIdCheck(memberVo);
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		if(userIdCheck != null && userLogin != null) {
		HttpSession session = request.getSession();
		session.setAttribute("userId", userLogin.getUserId());
		session.setAttribute("userName", userLogin.getUserName());
		session.setMaxInactiveInterval(30*30);
		System.out.println("============세션 아이디 : "+ session.getAttribute("userId"));
		result.put("success", "1");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		System.out.println("1번 실행");
		return callbackMsg;
		}
		else if(userIdCheck == null) {
			result.put("success", "2");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			System.out.println("2번 실행");
			return callbackMsg;
		}
		else if(userLogin == null) {
			result.put("success", "3");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			System.out.println("비밀번호가 다릅니다.");
			return callbackMsg;
		}		
		return null;
	}
	@RequestMapping("/logOutUser.do")
	public String logOut(HttpSession session)throws Exception {
		System.out.println("로그아웃요청이 넘어는 오니?");
		String value= (String)session.getAttribute("userId");
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		return "redirect:/board/boardList.do";
	}
	
}
