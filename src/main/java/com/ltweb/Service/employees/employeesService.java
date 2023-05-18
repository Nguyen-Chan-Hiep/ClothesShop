package com.ltweb.Service.employees;

import java.util.List;

import com.ltweb.Entity.employees;

public interface employeesService {

	List<employees> list();

	employees getEmployee(String user);
}
