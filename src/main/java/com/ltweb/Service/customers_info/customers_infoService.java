package com.ltweb.Service.customers_info;

import java.util.List;

import com.ltweb.Entity.customers_info;

public interface customers_infoService {

	List<customers_info> list();

	customers_info getInfoByUserId(int uid);

	void createProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country);

	void updateProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country);

	void deleteProfile(int id);
}
