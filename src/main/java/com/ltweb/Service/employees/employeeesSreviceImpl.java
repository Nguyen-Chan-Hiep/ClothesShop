package com.ltweb.Service.employees;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.admin.employeeRespon;
import com.ltweb.Entity.employees;

@Service
@Transactional
public class employeeesSreviceImpl implements employeesService {

	@Autowired
	private employeeRespon emplRes;

	@Override
	public List<employees> list() {
		return emplRes.list();
	}

	@Override
	public employees getEmployee(String user) {
		return emplRes.getEmloyees(user);
	}

}
