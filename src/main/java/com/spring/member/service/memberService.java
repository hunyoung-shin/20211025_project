package com.spring.member.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.member.vo.MemberVo;

public interface memberService {
	public MemberVo memIdCheck(MemberVo memberVo)throws Exception;
	
	public MemberVo userLogin(MemberVo memberVo)throws Exception;
	
	public int memSignUp(MemberVo memberVo)throws Exception;
	
	public List<BoardVo> frontPhoneNum(BoardVo boardVo)throws Exception;
	
}
