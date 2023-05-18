package com.ltweb.Repository.products;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ltweb.Entity.products;
import com.ltweb.Entity.tg_product_size_color;

@Repository
public class productsResponImpl implements productsRespon {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<products> list() {
		List<products> list = sessionFactory.getCurrentSession().createQuery("from products", products.class).list();
		return list;
	}

	@Override
	public List<products> getProductsByCateId(int cate_id) {
		List<products> list = sessionFactory.getCurrentSession()
				.createQuery("from products where category_id =:cate_id", products.class)
				.setParameter("cate_id", cate_id).list();
		return list;
	}

	@Override
	public products getProductById(int id) {
		products product = (products) sessionFactory.getCurrentSession().createQuery("from products where id =:id")
				.setParameter("id", id).getSingleResult();
		return product;
	}

	@Override
	public void updateProduct(int id, String name, String description, String image, float price) {
		sessionFactory.getCurrentSession().createQuery(
				"update products set name =:name, description=:description, image=:image, price=:price where id=:id")
				.setParameter("id", id).setParameter("name", name).setParameter("description", description)
				.setParameter("image", image).setParameter("price", price).executeUpdate();
	}

	@Override
	public void deleteProduct(int id) {
		sessionFactory.getCurrentSession().createQuery("delete from products where id = :id").setParameter("id", id)
				.executeUpdate();
	}

	@Override
	public List<products> getThreeProducts(int soluong) {
		Session session = sessionFactory.getCurrentSession();
		List<products> list = (List<products>) session
				.createNativeQuery("select * from products limit 4 offset :a", products.class)
				.setParameter("a", soluong).list();
//		List<product> list = (List<product>) session.createQuery("from product limit 3", product.class).list();
		return list;
	}

	@Override
	public products getLastProduct() {
		Session session = sessionFactory.getCurrentSession();
		products products = (com.ltweb.Entity.products) session
				.createQuery("from products where id = (select max(id) from products)").getSingleResult();
		return products;
	}

	@Override
	public tg_product_size_color getByid(int id) {
		try {
			tg_product_size_color product_size_color = (tg_product_size_color) sessionFactory.getCurrentSession()
					.createQuery("from tg_product_size_color where product_id =:pid").setParameter("pid", id)
					.getSingleResult();
			return product_size_color;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<products> searchProducts(String txt) {
		try {
			Session session = sessionFactory.getCurrentSession();
			List<products> list = session.createQuery("from products where name like '%" + txt + "%'", products.class)
					.list();
			return list;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public void updatesizecolor(int id, int sold, int stock, int sizeid, int colorid) {
		try {
			sessionFactory.getCurrentSession().createQuery(
					"update tg_product_size_color set color_id =:colorid, size_id=:sizeid, soluongdaban=:sold, soluongtrongkho=:stock where product_id=:id")
					.setParameter("id", id).setParameter("sold", sold).setParameter("stock", stock)
					.setParameter("sizeid", sizeid).setParameter("colorid", colorid);
		} catch (Exception e) {
			tg_product_size_color size_color = new tg_product_size_color(id, sizeid, colorid, sold, stock);
			sessionFactory.getCurrentSession().save(size_color);
		}
	}

	@Override
	public void createsizecolor(int id, int sold, int stock, int sizeid, int colorid) {
		tg_product_size_color size_color = new tg_product_size_color(id, sizeid, colorid, sold, stock);
		sessionFactory.getCurrentSession().save(size_color);
	}

	@Override
	public void addProduct(String name, String description, String image, float price, String gender) {
		products product = new products(name, description, image, price, gender);
		sessionFactory.getCurrentSession().save(product);
	}

	@Override
	public List<products> listProductForMen(int soluong, String status) {
		Session session = sessionFactory.getCurrentSession();
		List<products> list = (List<products>) session
				.createNativeQuery("select * from products where gender = :t limit 4 offset :a", products.class)
				.setParameter("t", status).setParameter("a", soluong).list();
		return list;
	}

}
