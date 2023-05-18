package com.ltweb.Service.product_Color;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.product_Color.product_ColorRepo;
import com.ltweb.Entity.product_Color;

@Service
@Transactional
public class product_ColorServiceImpl implements product_ColorService {

	@Autowired
	private product_ColorRepo product_ColorRepo;

	@Override
	public product_Color getProduct_ColorById(int id) {
		return product_ColorRepo.getProduct_ColorById(id);
	}

	@Override
	public product_Color getProduct_ColorByName(String name) {
		return product_ColorRepo.getProduct_ColorByName(name);
	}

}
