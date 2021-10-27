package com.spring.goods.dao;

import java.util.List;

import com.spring.special.vo.SpecialVo;

public interface GoodsDao {

	public List<SpecialVo> specialList() throws Exception;
}
