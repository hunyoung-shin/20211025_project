package com.spring.special.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.special.dao.SpecialDao;

@Repository
public class SpecialDaoImpl implements SpecialDao{
	
	@Autowired
	SqlSession session;
	
	@Override
	public void test()throws Exception{
	};
}
