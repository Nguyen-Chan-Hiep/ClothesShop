package com.ltweb.Service.products;

import java.util.List;

import com.ltweb.Entity.products;
import com.ltweb.Entity.tg_product_size_color;

public interface productsService {

	List<products> list();

	List<products> getListProductsByCateId(int cate_id);

	products getProductById(int id);

	public products getLastProducts();

	void addProducts(String name, String description, String image, float price, String gender);

	void updateProduct(int id, String name, String description, String image, float price);

	public List<products> getThreeProducts(int soluong);

	void deleteProduct(int id);

	tg_product_size_color getByid(int id);

	void createsizecolor(int id, int sold, int stock, int sizeid, int colorid);

	void updatesizecolor(int id, int sold, int stock, int sizeid, int colorid);

	public List<products> searchProducts(String txt);

	public List<products> listProductForMen(int soluong, String status);

}
