package com.ltweb.Repository.products;

import java.util.List;

import com.ltweb.Entity.products;
import com.ltweb.Entity.tg_product_size_color;

public interface productsRespon {

	public List<products> list();

	public List<products> getProductsByCateId(int cate_id);

	public products getProductById(int id);

	public void addProduct(String name, String description, String image, float price, String gender);

	public products getLastProduct();

	public void updateProduct(int id, String name, String description, String image, float price);

	public List<products> getThreeProducts(int soluong);

	public void deleteProduct(int id);

	public tg_product_size_color getByid(int id);

	public void createsizecolor(int id, int sold, int stock, int sizeid, int colorid);

	public void updatesizecolor(int id, int sold, int stock, int sizeid, int colorid);

	public List<products> searchProducts(String txt);

	public List<products> listProductForMen(int soluong, String status);

}
