package com.ltweb.Service.dondathang;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Repository.dondathang.dondathangRepo;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.dondathang;

@Service
@Transactional
public class dondathangServiceImpl implements dondathangService{
	
	@Autowired
	private dondathangRepo dondathangRepo;

	@Override
	public void add(customers customers, List<MonHang2> list) {
		dondathangRepo.add(customers, list);
	}


	@Override
	public List<dondathang> getListDonDatHangByCustomerName(Integer name) {
		return dondathangRepo.getListDonDatHangByCustomerName(name);
	}


	@Override
	public List<dondathang> getAll() {
		return dondathangRepo.getAll();
	}


	@Override
	public void add(List<dondathang> list) {
		dondathangRepo.add(list);
		
	}

}
