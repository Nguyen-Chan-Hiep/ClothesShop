package com.ltweb.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dondathang")
public class dondathang {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "productName")
	private String productName;
	@Column(name = "SizeName")
	private String sizeName;
	@Column(name = "ColorName")
	private String colorName;
	@Column(name = "soluong")
	private int soluong;
	@Column(name = "dongia")
	private double dongia;
	@Column(name = "ordererId")
	private int ordererId;
	@Column(name = "status")
	private int status;
	public dondathang(String productName, String sizeName, String colorName, int soluong, double dongia, int ordererId,
			int status) {
		super();
		this.productName = productName;
		this.sizeName = sizeName;
		this.colorName = colorName;
		this.soluong = soluong;
		this.dongia = dongia;
		this.ordererId = ordererId;
		this.status = status;
	}
	public dondathang() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public double getDongia() {
		return dongia;
	}
	public void setDongia(double dongia) {
		this.dongia = dongia;
	}
	public int getOrdererId() {
		return ordererId;
	}
	public void setOrdererId(int ordererId) {
		this.ordererId = ordererId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
