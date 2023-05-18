package com.ltweb.DTO;

import java.util.List;

import com.ltweb.Entity.customers;
import com.ltweb.Entity.customers_info;
import com.ltweb.Entity.dondathang;

public class DonDatHang_fAdmin {
	private customers customers;
	private customers_info customers_info;
	private List<dondathang> list;
	public DonDatHang_fAdmin(com.ltweb.Entity.customers customers, com.ltweb.Entity.customers_info customers_info,
							 List<dondathang> list) {
		super();
		this.customers = customers;
		this.customers_info = customers_info;
		this.list = list;
	}
	public customers getCustomers() {
		return customers;
	}
	public void setCustomers(customers customers) {
		this.customers = customers;
	}
	public customers_info getCustomers_info() {
		return customers_info;
	}
	public void setCustomers_info(customers_info customers_info) {
		this.customers_info = customers_info;
	}
	public List<dondathang> getList() {
		return list;
	}
	public void setList(List<dondathang> list) {
		this.list = list;
	}
}
