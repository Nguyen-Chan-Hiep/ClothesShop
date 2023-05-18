package com.ltweb.Service.customers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.customers.customersRepo;
import com.ltweb.Entity.customers;

@Service
@Transactional
public class customersServiceImpl implements customersService {

	@Autowired
	private customersRepo customersRepo;

	@Override
	public List<customers> list() {
		return customersRepo.list();
	}

	@Override
	public customers getCustomersByUsername(String name, String pass) {
		return customersRepo.getCustomersByUsername(name, pass);
	}

	@Override
	public void save(customers customers) {
		customersRepo.save(customers);
	}

	@Override
	public void delCustomer(int id) {
		customersRepo.delCustomer(id);
	}

	@Override
	public customers getCustomersById(int id) {
		return customersRepo.getCustomersById(id);
	}

	@Override
	public void updateCustomer(int id, String username, String password, String firstname, String lastname) {
		customersRepo.updateCustomer(id, username, password, firstname, lastname);
	}

	@Override
	public customers getCustomersByUsername(String name) {
		return customersRepo.getCustomersByUsername(name);
	}

	@Override
	public List<String> getUserRoles(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
