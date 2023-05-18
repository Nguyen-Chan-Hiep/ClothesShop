package com.ltweb.Repository.customers_info;

import java.util.List;

import com.ltweb.Entity.customers_info;

public interface customers_infoRespon {

	public List<customers_info> list();

	public customers_info getInfoByUserId(int uid);

	public void createProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country);

	public void updateProfile(int user_id, String phone, String email, String address1, String address2, String city,
			String country);

	public void deleteProfile(int id);

}
