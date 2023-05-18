package com.ltweb.Service.dondathang;

import java.util.List;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.dondathang;

public interface dondathangService {
	public List<dondathang> getListDonDatHangByCustomerName(Integer name);

	public void add(customers customers, List<MonHang2> list);

	public List<dondathang> getAll();

	public void add(List<dondathang> list);
}
