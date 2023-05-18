package com.ltweb.Repository.product_Size;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.product_Size;

@Repository
public class product_SizeRepoImpl implements product_SizeRepo {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public product_Size getProduct_SizeById(int id) {
		product_Size product_Size = (product_Size) sessionFactory.getCurrentSession()
				.createQuery("from product_Size where id = :id", product_Size.class).setParameter("id", id)
				.getSingleResult();
		return product_Size;
	}

	@Override
	public product_Size getProduct_SizeByName(String name) {
		product_Size product_Size = (product_Size) sessionFactory.getCurrentSession()
				.createQuery("from product_Size where sizeName = :id", product_Size.class).setParameter("id", name)
				.getSingleResult();
		return product_Size;
	}

}
