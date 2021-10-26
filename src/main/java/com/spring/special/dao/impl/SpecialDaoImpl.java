package com.spring.special.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.special.dao.SpecialDao;
import com.spring.special.vo.specialVo;

@Repository
public class SpecialDaoImpl implements SpecialDao{
	
	@Autowired
	SqlSession session;
	
	@Override
	public void test()throws Exception{};
	
	
	@Override
	public List<specialVo> selectList()throws Exception{
		
		return session.selectList("special", "specialList");
	} 
	
}
