package com.ltweb.DTO;

import com.ltweb.Entity.tg_product_size_color;

public class Monhang {
	private tg_product_size_color tg_product_size_color;
	private int soluong;
	private double dongia;

	public Monhang(com.ltweb.Entity.tg_product_size_color tg_product_size_color, int soluong, double dongia) {
		super();
		this.tg_product_size_color = tg_product_size_color;
		this.soluong = soluong;
		this.dongia = dongia;
	}

	public Monhang() {
		super();
	}

	public tg_product_size_color getTg_product_size_color() {
		return tg_product_size_color;
	}

	public void setTg_product_size_color(tg_product_size_color tg_product_size_color) {
		this.tg_product_size_color = tg_product_size_color;
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

}
