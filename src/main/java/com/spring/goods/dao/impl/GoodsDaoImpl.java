package com.spring.goods.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.goods.dao.GoodsDao;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	SqlSession session;
}
