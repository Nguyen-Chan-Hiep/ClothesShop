package com.ltweb.Repository.dondathang;

import java.util.List;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.dondathang;

public interface dondathangRepo {
	public void add(customers customers, List<MonHang2> list);

	public List<dondathang> getListDonDatHangByCustomerName(Integer name);

	public List<dondathang> getAll();

	public void add(List<dondathang> list);
}
