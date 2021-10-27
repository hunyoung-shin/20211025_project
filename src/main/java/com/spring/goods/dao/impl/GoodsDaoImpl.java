package com.spring.goods.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.goods.dao.GoodsDao;
import com.spring.special.vo.SpecialVo;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	SqlSession session;
	
	public List<SpecialVo> specialList() throws Exception{
		
		// 나중에 수정할 것
		return session.selectList(null);
	}
}
