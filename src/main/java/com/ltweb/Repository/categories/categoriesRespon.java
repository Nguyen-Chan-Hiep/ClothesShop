package com.ltweb.Repository.categories;

import java.util.List;

import com.ltweb.Entity.categories;

public interface categoriesRespon {

	public List<categories> list();

	public void addCategory(String name);

	public void delCategory(int id);

	public categories getCateByName(String name);

	public categories getCateById(int id);
}
