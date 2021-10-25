package com.spring.special.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.special.dao.SpecialDao;
import com.spring.special.service.SpecialService;

@Service
public class SpecialServiceImpl implements SpecialService{
	
	@Autowired
	SpecialDao specialDao;
	
	@Override
	public void test()throws Exception{};
}
