package com.ltweb.Repository.tg_product_size_color;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.tg_product_size_color;

@Repository
public class tg_product_size_colorRepoImpl implements tg_product_size_colorRepo{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public tg_product_size_color getTg_product_size_colorById(int pid, int sizeId, int colorId) {
		Session session = sessionFactory.getCurrentSession();
		tg_product_size_color tg_product_size_color = (tg_product_size_color)session.createQuery("from tg_product_size_color where product_id = :id"
				+ " and size_id = :sizeId and idcolor_id = :colorId", tg_product_size_color.class)
				.setParameter("id", pid).setParameter("sizeId", sizeId).setParameter("colorId", colorId).getSingleResult();
		return tg_product_size_color;
	}

	@Override
	public tg_product_size_color geTg_product_size_colorById(int id) {
		Session session = sessionFactory.getCurrentSession();
		tg_product_size_color tg_product_size_color = (tg_product_size_color)session.createQuery("from tg_product_size_color where id = :id", tg_product_size_color.class)
				.setParameter("id", id).getSingleResult();
		return tg_product_size_color;
	}

}
