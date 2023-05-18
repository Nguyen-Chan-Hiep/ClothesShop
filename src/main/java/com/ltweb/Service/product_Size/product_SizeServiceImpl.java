package com.ltweb.Service.product_Size;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.product_Size.product_SizeRepo;
import com.ltweb.Entity.product_Size;

@Service
@Transactional
public class product_SizeServiceImpl implements product_SizeService {

	@Autowired
	private product_SizeRepo product_SizeRepo;

	@Override
	public product_Size getProduct_SizeById(int id) {
		return product_SizeRepo.getProduct_SizeById(id);
	}

	@Override
	public product_Size getProduct_SizeByName(String name) {
		return product_SizeRepo.getProduct_SizeByName(name);
	}

}
