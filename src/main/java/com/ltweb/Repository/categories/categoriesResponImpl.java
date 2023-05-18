package com.ltweb.Repository.categories;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.categories;

@Repository
public class categoriesResponImpl implements categoriesRespon {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<categories> list() {
		List<categories> list = sessionFactory.getCurrentSession().createQuery("from categories", categories.class)
				.list();
		return list;
	}

	@SuppressWarnings("unused")
	@Override
	public void addCategory(String name) {
		try {
			categories category = (categories) sessionFactory.getCurrentSession()
					.createQuery("from categories where name=:name").setParameter("name", name).getSingleResult();
		} catch (Exception e) {
			categories category = new categories(name);
			sessionFactory.getCurrentSession().save(category);
		}

	}

	@Override
	public void delCategory(int id) {
		try {
			sessionFactory.getCurrentSession().createQuery("delete from categories where id =:id")
					.setParameter("id", id).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public categories getCateByName(String name) {
		try {
			categories category = (categories) sessionFactory.getCurrentSession()
					.createQuery("from categories where name=:name").setParameter("name", name).getSingleResult();
			return category;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public categories getCateById(int id) {
		try {
			categories category = (categories) sessionFactory.getCurrentSession()
					.createQuery("from categories where id=:id").setParameter("id", id).getSingleResult();
			return category;
		} catch (Exception e) {
			return null;
		}

	}

}
