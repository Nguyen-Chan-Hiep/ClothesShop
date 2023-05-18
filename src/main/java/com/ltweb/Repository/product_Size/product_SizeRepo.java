package com.ltweb.Repository.product_Size;

import com.ltweb.Entity.product_Size;

public interface product_SizeRepo {
	public product_Size getProduct_SizeById(int id);
	public product_Size getProduct_SizeByName(String name);
}
