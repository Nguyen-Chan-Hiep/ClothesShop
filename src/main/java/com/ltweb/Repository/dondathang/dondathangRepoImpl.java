package com.ltweb.Repository.dondathang;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.dondathang;

@Repository
public class dondathangRepoImpl implements dondathangRepo {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(customers customers, List<MonHang2> list) {
		try {
			for (MonHang2 monhang : list) {

				dondathang dondathang = new dondathang(monhang.getProducts().getName(),
						monhang.getProduct_Size().getSizeName(), monhang.getProduct_Color().getColorName(),
						monhang.getSoluong(), monhang.getProducts().getPrice(), customers.getId(), 0);
				sessionFactory.getCurrentSession().saveOrUpdate(dondathang);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<dondathang> getListDonDatHangByCustomerName(Integer name) {
		try {
			Session session = sessionFactory.getCurrentSession();
			List<dondathang> list = (List<dondathang>) session
					.createQuery("from dondathang where ordererId = :name", dondathang.class).setParameter("name", name)
					.list();
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<dondathang> getAll() {
		Session session = sessionFactory.getCurrentSession();
		List<dondathang> list = (List<dondathang>) session.createQuery("from dondathang", dondathang.class).list();
		return list;
	}

	@Override
	public void add(List<dondathang> list) {
		Session session = sessionFactory.getCurrentSession();
		for (dondathang dondathang : list) {
			session.saveOrUpdate(dondathang);
		}
	}
}
