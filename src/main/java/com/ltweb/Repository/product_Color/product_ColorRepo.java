package com.ltweb.Repository.product_Color;

import com.ltweb.Entity.product_Color;

public interface product_ColorRepo {
	public product_Color getProduct_ColorById(int id);
	public product_Color getProduct_ColorByName(String name);
}
