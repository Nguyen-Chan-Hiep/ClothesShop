package com.ltweb.Repository.customers_info;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.customers_info;

@Repository
public class customers_infoResponImpl implements customers_infoRespon {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<customers_info> list() {
		List<customers_info> list = sessionFactory.getCurrentSession()
				.createQuery("from customers_info", customers_info.class).list();
		return list;
	}

	@Override
	public customers_info getInfoByUserId(int uid) {
		try {
			customers_info customers_info = (customers_info) sessionFactory.getCurrentSession()
					.createQuery("from customers_info where user_id = :uid").setParameter("uid", uid).getSingleResult();
			return customers_info;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public void createProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country) {
		customers_info customers_info = new customers_info(user_id, phone, email, address1, address2, city, country);
		sessionFactory.getCurrentSession().save(customers_info);
	}

	@Override
	public void updateProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country) {
		sessionFactory.getCurrentSession().createQuery(
				"update customers_info set phonenumber =:phone, email =:email, address1 =:address1, address2 =:address2, city =:city, country =:country where user_id =:user_id")
				.setParameter("user_id", user_id).setParameter("phone", phone).setParameter("email", email)
				.setParameter("address1", address1).setParameter("address2", address2).setParameter("city", city)
				.setParameter("country", country);
	}

	@Override
	public void deleteProfile(int id) {
		sessionFactory.getCurrentSession().createQuery("delete * from customers_info where id =:id").setParameter("id",
				id);
	}

}
