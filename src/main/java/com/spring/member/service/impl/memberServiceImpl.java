package com.spring.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.vo.BoardVo;
import com.spring.member.dao.MemberDao;
import com.spring.member.service.memberService;
import com.spring.member.vo.MemberVo;

@Service
public class memberServiceImpl implements memberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public MemberVo memIdCheck(MemberVo memberVo) throws Exception {
		System.out.println("서비스에서 받은 정보는" + memberVo.getUserId().toString());
			return memberDao.memIdCheck(memberVo);
		}
	@Override
	public int memSignUp(MemberVo memberVo)throws Exception{
		System.out.println("서비스에서 받은 정보는" + memberVo.getUserId().toString());
		return memberDao.memSignUp(memberVo);
	}
	@Override
	public MemberVo userLogin(MemberVo memberVo) throws Exception {
		return memberDao.userLogin(memberVo);
	}
	@Override
	public List<BoardVo> frontPhoneNum(BoardVo boardVo)throws Exception{
		return memberDao.frontPhoneNum(boardVo);
	}
		
	}

