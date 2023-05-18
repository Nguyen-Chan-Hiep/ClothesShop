package com.ltweb.Repository.admin;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.employees;

@Repository
public class employeesResponImpl implements employeeRespon {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<employees> list() {
		Session session = sessionFactory.getCurrentSession();
		List<employees> list = session.createQuery("from employees", employees.class).list();
		return list;
	}

	@Override
	public employees getEmloyees(String user) {
		try {
			employees employee = (employees) sessionFactory.getCurrentSession()
					.createQuery("from employees where username = :user").setParameter("user", user).getSingleResult();
			return employee;
		} catch (Exception e) {
			return null;
		}

	}

}
