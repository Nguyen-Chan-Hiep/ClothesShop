package com.ltweb.Repository.tg_product_size_color;

import com.ltweb.Entity.tg_product_size_color;

public interface tg_product_size_colorRepo {
	public tg_product_size_color getTg_product_size_colorById(int pid, int sizeId, int colorId);
	public tg_product_size_color geTg_product_size_colorById(int id);
}
