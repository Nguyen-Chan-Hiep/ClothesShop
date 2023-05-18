package com.ltweb.Api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ltweb.DTO.DonDatHang_fAdmin;
import com.ltweb.DTO.MonHang2;
import com.ltweb.Service.dondathang.dondathangService;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.dondathang;
import com.ltweb.Entity.products;

@RestController
public class ApiController {

	@Autowired
	private productsService productsService;
	@Autowired
	private product_SizeService product_SizeService;
	@Autowired
	private product_ColorService product_ColorService;
	@Autowired
	private dondathangService dondathangService;

	@PostMapping(path = "/loadFourProducts", produces = "text/plain; charset=UTF-8")
	public String getThreeProducts(HttpServletRequest request) {
		String string = "";
		int soluong = Integer.parseInt(request.getParameter("soluong"));
		List<products> list = productsService.getThreeProducts(soluong);
		for (products products : list) {
			string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
					+ products.getDescription() + "," + products.getPrice() + "," + products.getGender() + "+";
		}

		return string;
	}

	@PostMapping("/loadProducts")
	public String loadProductsForMen(HttpServletRequest request) {
		String string = "";
		List<products> list = new ArrayList<products>();
		int soluong = Integer.parseInt(request.getParameter("num"));
		String status = request.getParameter("status");
		list = productsService.listProductForMen(soluong, status);
		for (products products : list) {
			string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
					+ products.getDescription() + "," + products.getPrice() + "," + products.getGender() + "+";

		}
		System.out.println(string);
		return string;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(path = "/delItemCart", produces = "text/plain; charset=UTF-8")
	public String delItemsCart(HttpServletRequest request, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("pid"));
		int sizeid = Integer.parseInt(request.getParameter("co"));
		int colorid = Integer.parseInt(request.getParameter("mau"));
		String s = "";
		double sum = 0;
		List<MonHang2> list = (List<MonHang2>) session.getAttribute("cart");
		for (MonHang2 monhang : list) {
			if (monhang.getProducts().getId() == id && monhang.getProduct_Size().getId() == sizeid && monhang.getProduct_Color().getId() == colorid) {
				int vitri = list.indexOf(monhang);
				list.remove(vitri);
				break;
			}
		}
		if (list.size() > 0) {
			for (MonHang2 monhang : list) {

				s += monhang.getProducts().getImage() + "," + monhang.getProducts().getName() + ","
						+ monhang.getProducts().getPrice() + "," + monhang.getSoluong() + ","
						+ monhang.getProducts().getId() + "," + monhang.getProduct_Size().getSizeName() + ","
						+ monhang.getProduct_Color().getColorName() ;
				sum += monhang.getProducts().getPrice() * monhang.getSoluong();

			}
			s+=list.size()+":";
		} else {
			sum = 0;
		}
		s += String.valueOf(sum);
		session.setAttribute("total", sum);
		session.setAttribute("soluong", list.size());
		return s;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/cong")
	public String congSoluong(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		List<MonHang2> list = (List<MonHang2>) session.getAttribute("cart");
		double tong = (double)session.getAttribute("total");
		tong = 0;
		int pid = Integer.parseInt(request.getParameter("pid"));
		int co = Integer.parseInt(request.getParameter("co"));
		int mau = Integer.parseInt(request.getParameter("mau"));
		int soluong = Integer.parseInt(request.getParameter("soluong"))  + 1;
		double total = 0;
		for (MonHang2 monhang2 : list) {
			if(monhang2.getProducts().getId() == pid && monhang2.getProduct_Size().getId() == co
					&& monhang2.getProduct_Color().getId() == mau) {
				int vitri = list.indexOf(monhang2);
				list.get(vitri).setSoluong(soluong);
				total = soluong*monhang2.getProducts().getPrice();
			}
			tong +=monhang2.getSoluong()*monhang2.getProducts().getPrice();
		}
		return String.valueOf(total)+","+String.valueOf(tong);
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/tru")
	public String truSoluong(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		List<MonHang2> list = (List<MonHang2>)session.getAttribute("cart");
		double tong = (double)session.getAttribute("total");
		tong = 0;
		int pid = Integer.parseInt(request.getParameter("pid"));
		int co = Integer.parseInt(request.getParameter("co"));
		int mau = Integer.parseInt(request.getParameter("mau"));
		int soluong = Integer.parseInt(request.getParameter("soluong")) -1;
		double total = 0;
		for (MonHang2 monhang2 : list) {
			if(monhang2.getProducts().getId() == pid && monhang2.getProduct_Size().getId() == co
					&& monhang2.getProduct_Color().getId() == mau) {
				int vitri = list.indexOf(monhang2);
				list.get(vitri).setSoluong(soluong);
				total = soluong*monhang2.getProducts().getPrice();
			}
				tong += monhang2.getSoluong() * monhang2.getProducts().getPrice();
		}
		return String.valueOf(total)+","+String.valueOf(tong);
	}

	@PostMapping(path = "/search", produces = "text/plain; charset=UTF-8")
	public String searchProduct(HttpServletRequest request) {
		String query = request.getParameter("query");
		System.out.println(query);
		List<products> list = productsService.searchProducts(query);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return string;
	}

	@GetMapping(path = "/firstThreeProducts", produces = "text/plain; charset=UTF-8")
	public String firstThreeProducts() {
		List<products> list = productsService.getThreeProducts(0);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
		}
		return string;
	}

	@PostMapping(path = "/loadProductById", produces = "text/plain; charset=UTF-8")
	public String loadProductById(HttpServletRequest request) {
		int cid = Integer.parseInt(request.getParameter("cid"));
		List<products> list = productsService.getListProductsByCateId(cid);
		String string = "";
		try {
			for (products products : list) {
				string += products.getId() + "," + products.getImage() + "," + products.getName() + ","
						+ products.getDescription() + "," + products.getPrice() + "+";
			}
		} catch (Exception e) {
		}
		return string;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(path = "/add", produces = "text/plain; charset=UTF-8")
	public String add(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		customers customers = (customers) session.getAttribute("user");
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		Integer sizeId = Integer.parseInt(request.getParameter("co"));
		Integer colorId = Integer.parseInt(request.getParameter("mau"));
		Integer quanlity = Integer.parseInt(request.getParameter("quantity"));
		String string = "";
		MonHang2 monhang = new MonHang2(productsService.getProductById(pid),
				product_SizeService.getProduct_SizeById(sizeId), product_ColorService.getProduct_ColorById(colorId),
				quanlity);

		List<MonHang2> listMonHang2 = (List<MonHang2>) session.getAttribute("cart");
		Cookie[] cookies = request.getCookies();
		try {
			int vitri = -1;
			if (listMonHang2.size() == 0) {
				listMonHang2.add(monhang);
			} else {
				boolean check = true;

				for (MonHang2 monhang2 : listMonHang2) {
					if(monhang2.getProducts().getId() == monhang.getProducts().getId() && monhang2.getProduct_Color().getColorName().equals(monhang.getProduct_Color().getColorName())
							&& monhang2.getProduct_Size().getSizeName().equals(monhang.getProduct_Size().getSizeName())) {

						check = false;
						vitri = listMonHang2.indexOf(monhang2);
						int curSoluong = listMonHang2.get(vitri).getSoluong() + monhang.getSoluong();
						MonHang2 mhMonHang2 = new MonHang2(monhang2.getProducts(), monhang2.getProduct_Size(),
								monhang2.getProduct_Color(), curSoluong);
						listMonHang2.set(vitri, mhMonHang2);
						break;
					}
				}
				if (check) {
					listMonHang2.add(monhang);
				}
			}
			session.setAttribute("cart", listMonHang2);
			
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(String.valueOf(customers.getId()))) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
			
			
			double sum = (double) session.getAttribute("total");
			sum = 0;
			for (MonHang2 monhang2 : listMonHang2) {
				sum+=monhang2.getSoluong() * monhang2.getProducts().getPrice(); 
				string += monhang2.getProducts().getImage()+","+monhang2.getProducts().getName()+","+monhang2.getSoluong()+","+monhang2.getProducts().getPrice()+
						","+monhang2.getProduct_Size().getSizeName()+","+monhang2.getProduct_Color().getColorName()+":";
			}
			
			string+=sum+":"+ listMonHang2.size()+":";
			session.setAttribute("total", sum);
			session.setAttribute("soluong", listMonHang2.size());
			

		} catch (Exception e) {
		}
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(String.valueOf(customers.getId()))) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		System.out.println(listMonHang2.size());
		String ck = "";
		for (MonHang2 monhang2 : listMonHang2) {
			ck+=monhang2.getProducts().getId()+":"+monhang2.getProduct_Size().getId()+":"+monhang2.getProduct_Color().getId()+":"+monhang2.getSoluong()+"_";
		}
		Cookie cookie = new Cookie(String.valueOf(customers.getId()), ck);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		return string;
	}

	@PostMapping(path = "/chitiet", produces = "text/plain; charset=UTF-8")
	public String chitiet(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("query"));
		System.out.println(id);
		String s = "";
		List<dondathang> list = dondathangService.getListDonDatHangByCustomerName(id);
		s += "<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n"
				+ "	    <div class=\"modal-content\" style=\"color: black; width: 500px; text-align: center;\">\r\n"
				+ "	      <div class=\"modal-header\">\r\n"
				+ "	        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Chi tiáº¿t Ä‘Æ¡n hÃ ng</h5>\r\n"
				+ "	        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n"
				+ "	          <span aria-hidden=\"true\">&times;</span>\r\n" + "	        </button>\r\n"
				+ "	      </div>\r\n" + "	      <div class=\"modal-body\">\r\n"
				+ "	        <table style=\"border: 1px ; width: 100%\">\r\n"
				+ "	        	<tr style=\"margin-left: 20px\">\r\n"
				+ "	        		<th style=\\\"margin-left: 60px\\\">Product Name</th>\r\n"
				+ "	        		<th>Size-MÃ u sáº¯c</th>\r\n" + "	        		<th>Sá»‘ lÆ°á»£ng</th>\r\n"
				+ "	        		<th>Ä�Æ¡n giÃ¡</th>\r\n" + "	        	</tr>";
		for (dondathang dondathang : list) {
			s += "<tr>\r\n" + "        			<td>" + dondathang.getProductName() + "</td>\r\n"
					+ "        			<td>" + dondathang.getSizeName() + " - " + dondathang.getColorName()
					+ "</td>\r\n" + "        			<td>" + dondathang.getSoluong() + "</td>\r\n"
					+ "        			<td>" + dondathang.getDongia() + "</td>\r\n" + "        		</tr>";
		}
		s += "</table>\r\n" + "	      </div>\r\n" + "	      <div class=\"modal-footer\">\r\n"
				+ "	        <button type=\"button\" onclick=\"testt(" + id
				+ ")\" class=\"btn btn-success text-red\" data-dismiss=\"modal\">Duyá»‡t Ä‘Æ¡n</button>\r\n"
				+ "	      </div>\r\n" + "	    </div>\r\n" + "	  </div>";
		return s;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(path = "/duyetdon", produces = "text/plain; charset=UTF-8")
	public String duyetdon(HttpServletRequest request, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("status"));
		System.out.println(id);
		HashMap<Integer, DonDatHang_fAdmin> hashMap = (HashMap<Integer, DonDatHang_fAdmin>) session
				.getAttribute("listOrders");
		for (dondathang dondathang : hashMap.get(id).getList()) {
			dondathang.setStatus(1);

		}
		dondathangService.add(hashMap.get(id).getList());
		String string = "<td id=\"" + String.valueOf(id + 1000) + "\">\r\n"
				+ "										<div style=\"margin-right: 10px;\"><i class=\"fas fa-check-square\" style=\"font-size: 20px; color: #33FF4F; margin-right: 10px;\"></i>  Ä�Ã£ duyá»‡t Ä‘Æ¡n</div>\r\n"
				+ "									</td>";
		return string;
	}
}
