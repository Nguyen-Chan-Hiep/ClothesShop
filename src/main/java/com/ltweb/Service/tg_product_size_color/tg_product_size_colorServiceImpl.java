package com.ltweb.Service.tg_product_size_color;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.tg_product_size_color.tg_product_size_colorRepo;
import com.ltweb.Entity.tg_product_size_color;

@Service
@Transactional
public class tg_product_size_colorServiceImpl implements tg_product_size_colorService{
	
	@Autowired
	private tg_product_size_colorRepo tg_product_size_colorRepo;
	
	@Override
	public tg_product_size_color getTg_product_size_colorById(int pid, int sizeId, int colorId) {
		return tg_product_size_colorRepo.getTg_product_size_colorById(pid, sizeId, colorId);
	}

	@Override
	public tg_product_size_color geTg_product_size_colorById(int id) {
		return tg_product_size_colorRepo.geTg_product_size_colorById(id);
	}
	
}
