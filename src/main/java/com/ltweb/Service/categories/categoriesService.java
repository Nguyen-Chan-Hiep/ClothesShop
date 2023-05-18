package com.ltweb.Service.categories;

import java.util.List;

import com.ltweb.Entity.categories;

public interface categoriesService {

	List<categories> list();

	void addCategory(String name);

	void delCategory(int id);

	categories getCateByName(String name);

	categories getCateById(int id);
}
