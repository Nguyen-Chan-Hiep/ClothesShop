package com.ltweb.Service.customers;

import java.util.List;

import com.ltweb.Entity.customers;

public interface customersService {
	public List<customers> list();

	public customers getCustomersByUsername(String name, String pass);

	public void save(customers customers);

	public customers getCustomersByUsername(String name);

	public void delCustomer(int id);

	void updateCustomer(int id, String username, String password, String firstname, String lastname);

	public customers getCustomersById(int id);
	
	public List<String> getUserRoles(String username);
}
