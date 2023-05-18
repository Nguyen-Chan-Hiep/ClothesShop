package com.ltweb.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tg_product_size_color")
public class tg_product_size_color {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "product_id")
	private int product_id;
	@Column(name = "size_id")
	private int size_id;
	@Column(name = "color_id")
	private int idcolor_id;
	@Column(name = "soluongdaban")
	private int soluongdaban;
	@Column(name = "soluongtrongkho")
	private int soluongtrongkho;
	
	
	public tg_product_size_color(int product_id, int size_id, int idcolor_id, int soluongdaban, int soluongtrongkho) {
		super();
		this.product_id = product_id;
		this.size_id = size_id;
		this.idcolor_id = idcolor_id;
		this.soluongdaban = soluongdaban;
		this.soluongtrongkho = soluongtrongkho;
	}

	public tg_product_size_color() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getSize_id() {
		return size_id;
	}

	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}

	public int getIdcolor_id() {
		return idcolor_id;
	}

	public void setIdcolor_id(int idcolor_id) {
		this.idcolor_id = idcolor_id;
	}

	public int getSoluongdaban() {
		return soluongdaban;
	}

	public void setSoluongdaban(int soluongdaban) {
		this.soluongdaban = soluongdaban;
	}

	public int getSoluongtrongkho() {
		return soluongtrongkho;
	}

	public void setSoluongtrongkho(int soluongtrongkho) {
		this.soluongtrongkho = soluongtrongkho;
	}
}
