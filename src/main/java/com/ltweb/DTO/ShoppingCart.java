package com.ltweb.DTO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ltweb.Entity.customers;

@Component
public class ShoppingCart {
	private customers customers;
	private List<Monhang> list = new ArrayList<Monhang>();

	public ShoppingCart() {
		super();
	}

	public ShoppingCart(com.ltweb.Entity.customers customers, List<Monhang> list) {
		super();
		this.customers = customers;
		this.list = list;
	}



	public customers getCustomers() {
		return customers;
	}

	public void setCustomers(customers customers) {
		this.customers = customers;
	}

	public List<Monhang> getList() {
		try {
			return list;
		} catch (Exception e) {
			return null;
		}
		
	}

	public void setList(List<Monhang> list) {
		this.list = list;
	}
	
}
