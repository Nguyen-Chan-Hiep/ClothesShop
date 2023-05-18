package com.ltweb.Repository.product_Color;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.product_Color;

@Repository
public class product_ColorRepoImpl implements product_ColorRepo {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public product_Color getProduct_ColorById(int id) {
		product_Color product_Color = (product_Color) sessionFactory.getCurrentSession()
				.createQuery("from product_Color where id = :id", product_Color.class).setParameter("id", id)
				.getSingleResult();
		return product_Color;
	}

	@Override
	public product_Color getProduct_ColorByName(String name) {
		product_Color product_Color = (product_Color) sessionFactory.getCurrentSession()
				.createQuery("from product_Color where colorName = :id", product_Color.class).setParameter("id", name)
				.getSingleResult();
		return product_Color;
	}

}
