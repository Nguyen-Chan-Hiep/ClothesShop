package com.ltweb.Service.products;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltweb.Repository.products.productsRespon;
import com.ltweb.Entity.products;
import com.ltweb.Entity.tg_product_size_color;

@Service
@Transactional
public class productsServiceImpl implements productsService {

	@Autowired
	private productsRespon productsRespon;

	@Override
	public List<products> list() {
		return productsRespon.list();
	}

	@Override
	public List<products> getListProductsByCateId(int cate_id) {
		return productsRespon.getProductsByCateId(cate_id);
	}

	@Override
	public products getProductById(int id) {
		return productsRespon.getProductById(id);
	}

	@Override
	public void addProducts(String name, String description, String image, float price, String gender) {
		productsRespon.addProduct(name, description, image, price, gender);
	}

	@Override
	public void updateProduct(int id, String name, String description, String image, float price) {
		productsRespon.updateProduct(id, name, description, image, price);
	}

	@Override
	public void deleteProduct(int id) {
		productsRespon.deleteProduct(id);
	}

	@Override
	public List<products> getThreeProducts(int soluong) {
		return productsRespon.getThreeProducts(soluong);
	}

	@Override
	public products getLastProducts() {
		return productsRespon.getLastProduct();
	}

	@Override
	public tg_product_size_color getByid(int id) {
		return productsRespon.getByid(id);
	}

	@Override
	public List<products> searchProducts(String txt) {
		return productsRespon.searchProducts(txt);
	}

	@Override
	public void createsizecolor(int id, int sold, int stock, int sizeid, int colorid) {
		productsRespon.createsizecolor(id, sold, stock, sizeid, colorid);

	}

	@Override
	public void updatesizecolor(int id, int sold, int stock, int sizeid, int colorid) {
		productsRespon.createsizecolor(id, sold, stock, sizeid, colorid);

	}

	@Override
	public List<products> listProductForMen(int soluong, String status) {
		return productsRespon.listProductForMen(soluong, status);
	}

}
