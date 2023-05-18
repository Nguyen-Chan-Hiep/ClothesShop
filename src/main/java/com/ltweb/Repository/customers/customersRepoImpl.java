package com.ltweb.Repository.customers;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.customers;

@Repository
public class customersRepoImpl implements customersRepo {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<customers> list() {
		List<customers> list = sessionFactory.getCurrentSession().createQuery("from customers", customers.class).list();
		return list;
	}

	@Override
	public customers getCustomersByUsername(String name, String pass) {
		try {
			customers customers = (com.ltweb.Entity.customers) sessionFactory.getCurrentSession()
					.createQuery("from customers where username=:name and password=:pass").setParameter("name", name)
					.setParameter("pass", pass).getSingleResult();
			return customers;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void save(customers customers) {
		sessionFactory.getCurrentSession().save(customers);
	}

	@Override
	public void delCustomer(int id) {
		sessionFactory.getCurrentSession().createQuery("delete from customers where id = :id ").setParameter("id", id)
				.executeUpdate();
	}

	@Override
	public customers getCustomersById(int id) {
		try {
			customers customer = (customers) sessionFactory.getCurrentSession()
					.createQuery("from customers where id=:id").setParameter("id", id).getSingleResult();
			return customer;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public void updateCustomer(int id, String username, String password, String firstname, String lastname) {
		sessionFactory.getCurrentSession().createQuery(
				"update customers set username=:username, password=:password, firstname=:firstname, lastname=:lastname where id=:id")
				.setParameter("username", username).setParameter("password", password).setParameter("id", id)
				.setParameter("firstname", firstname).setParameter("lastname", lastname).executeUpdate();
	}

	@Override
	public customers getCustomersByUsername(String name) {
		try {
			customers customers = (com.ltweb.Entity.customers) sessionFactory.getCurrentSession()
					.createQuery("from customers where username=:name").setParameter("name", name).getSingleResult();
			return customers;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<String> getUserRoles(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
