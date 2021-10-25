package com.spring.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.vo.BoardVo;
import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository
public class memberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public MemberVo memIdCheck(MemberVo memberVo)throws Exception{
		return sqlsession.selectOne("member.memIdCheck", memberVo);
	}
	@Override
	public MemberVo userLogin(MemberVo memberVo)throws Exception{
		return sqlsession.selectOne("member.userLogin", memberVo);
	}
	
	@Override
	public int memSignUp(MemberVo memberVo)throws Exception{
			int i = sqlsession.insert("member.memSignUp", memberVo);
		return 1;
	}
	
	@Override
	public List<BoardVo> frontPhoneNum(BoardVo boardVo)throws Exception{
		
		return sqlsession.selectList("member.frontPhoneNum", boardVo);
	}
}
