package com.ltweb.Repository.customers;

import java.util.List;

import com.ltweb.Entity.customers;

public interface customersRepo {
	public List<customers> list();

	public customers getCustomersByUsername(String name, String pass);

	public customers getCustomersByUsername(String name);

	public void save(customers customers);

	public void delCustomer(int id);

	public void updateCustomer(int id, String username, String password, String firstname, String lastname);

	public customers getCustomersById(int id);
	
	public List<String> getUserRoles(String username);
	
}
