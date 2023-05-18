package com.ltweb.Service.categories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.categories.categoriesRespon;
import com.ltweb.Entity.categories;

@Service
@Transactional
public class categoriesServiceImpl implements categoriesService {

	@Autowired
	private categoriesRespon categoriesRespon;

	@Override
	public List<categories> list() {
		return categoriesRespon.list();
	}

	@Override
	public void addCategory(String name) {
		categoriesRespon.addCategory(name);
	}

	@Override
	public void delCategory(int id) {
		categoriesRespon.delCategory(id);
	}

	@Override
	public categories getCateByName(String name) {
		return categoriesRespon.getCateByName(name);
	}

	@Override
	public categories getCateById(int id) {
		return categoriesRespon.getCateById(id);
	}

}
