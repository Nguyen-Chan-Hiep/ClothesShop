package com.ltweb.Service.customers_info;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.customers_info.customers_infoRespon;
import com.ltweb.Entity.customers_info;

@Service
@Transactional
public class customer_infoServiceImpl implements customers_infoService {

	@Autowired
	private customers_infoRespon customers_infoRespon;

	@Override
	public List<customers_info> list() {
		// TODO Auto-generated method stub
		return customers_infoRespon.list();
	}

	@Override
	public customers_info getInfoByUserId(int uid) {
		// TODO Auto-generated method stub
		return customers_infoRespon.getInfoByUserId(uid);
	}

	@Override
	public void createProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country) {
		customers_infoRespon.createProfile(user_id, phone, email, address1, address2, city, country);
	}

	@Override
	public void updateProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country) {
		customers_infoRespon.updateProfile(user_id, phone, email, address1, address2, city, country);
	}

	@Override
	public void deleteProfile(int id) {
		customers_infoRespon.deleteProfile(id);
	}

}
