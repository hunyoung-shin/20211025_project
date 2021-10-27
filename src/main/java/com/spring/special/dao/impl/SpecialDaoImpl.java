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
	
	@Override
	public specialVo specialView(specialVo specialVo)throws Exception{
		
		return session.selectOne("special", "specialView");
	}
	
	@Override
	public int speicalInsert(specialVo specialVo)throws Exception{
		
		return session.insert("special.specialInsert", specialVo);
	}
	
	@Override
	public int specialDelete(specialVo specialVo) throws Exception{
		
		
		return session.delete("special.specialDelete", specialVo);
	}
	
}
