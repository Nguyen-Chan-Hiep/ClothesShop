package com.ltweb.DTO.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ltweb.DTO.Monhang;
import com.ltweb.DTO.ShoppingCart;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.Service.tg_product_size_color.tg_product_size_colorService;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.product_Color;
import com.ltweb.Entity.product_Size;
import com.ltweb.Entity.products;
import com.ltweb.Entity.tg_product_size_color;

@Component
public class ShoppingCartDto {

	@Autowired
	private productsService productsService;
	@Autowired
	private product_SizeService product_SizeService;
	@Autowired
	private product_ColorService product_ColorService;
	@Autowired
	private tg_product_size_colorService tg_product_size_colorService;

	public void addItems(int pid, int sizeid, int colorid, ShoppingCart shoppingCart, customers customers, int quanlity) {
		shoppingCart.setCustomers(customers);
		product_Color product_Color = product_ColorService.getProduct_ColorById(colorid);
		product_Size product_Size = product_SizeService.getProduct_SizeById(sizeid);
		products products = productsService.getProductById(pid);
		tg_product_size_color tg_product_size_color = tg_product_size_colorService.getTg_product_size_colorById(pid, sizeid, colorid);
		Monhang monhang = new Monhang(tg_product_size_color, quanlity, products.getPrice());
		
		if (shoppingCart.getList().size() == 0) {
			shoppingCart.getList().add(monhang);
		} else {
			boolean check = true;
			for (Monhang monhang1 : shoppingCart.getList()) {
				if (monhang1.getTg_product_size_color().getId() == tg_product_size_color.getId()) {
					int vitri = shoppingCart.getList().indexOf(monhang1);
					int curSoluong = shoppingCart.getList().get(vitri).getSoluong();
					curSoluong+=quanlity;
					Monhang mh = new Monhang(tg_product_size_color, curSoluong, products.getPrice());
					shoppingCart.getList().set(vitri, mh);
					check = false;
					break;
				}
			}
			if (check) {
				shoppingCart.getList().add(monhang);
			}
		}

	}
}
