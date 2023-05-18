package com.ltweb.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Service.customers.customersService;
import com.ltweb.Service.employees.employeesService;
import com.ltweb.Service.product_Color.product_ColorService;
import com.ltweb.Service.product_Size.product_SizeService;
import com.ltweb.Service.products.productsService;
import com.ltweb.Entity.customers;
import com.ltweb.Entity.employees;
import com.ltweb.Entity.product_Color;
import com.ltweb.Entity.product_Size;
import com.ltweb.Entity.products;

@Controller
@RequestMapping(value = "/login", method = RequestMethod.GET)
@SessionAttributes("user")
public class LoginController {

	@Autowired
	private customersService customersService;

	@Autowired
	private employeesService employService;

	@Autowired
	private productsService productsService;

	@Autowired
	private product_SizeService product_SizeService;

	@Autowired
	private product_ColorService product_ColorService;

	@GetMapping("/dangnhap")
	public String login() {
		return "user/Login";
	}

	@GetMapping("/registry")
	public String dangky(Model model) {
		model.addAttribute("c", new customers());
		return "user/Registry";
	}

	@PostMapping("/checkRegistry")
	public String checkRegistry(@ModelAttribute("c") customers customers, Model model, HttpSession session) {
		if (customersService.getCustomersByUsername(customers.getUsername()) == null) {
			customersService.save(customers);
			model.addAttribute("user", customers);
			return "redirect:/home";
		} else {
			session.setAttribute("exit", "Tài khoản đã tồn tại");
			return "redirect:/login/registry";
		}

	}

	@PostMapping("/checkLogin")
	public String checkLogin(Model model, HttpSession ses, Authentication authentication, HttpServletRequest request) {

		customers customer = customersService.getCustomersByUsername(authentication.getName());
		employees employee = employService.getEmployee(authentication.getName());
		if (employee == null) {
			String string = "";
			model.addAttribute("user", customer);
			Cookie[] cookies = request.getCookies();
			List<MonHang2> list = new ArrayList<MonHang2>();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(String.valueOf(customer.getId()))) {

						string += cookie.getValue();
					}
				}

				if (string != "") {
					String[] arr = string.split("_");
					for (String string2 : arr) {
						String[] arr2 = string2.split(":");
						products products = productsService.getProductById(Integer.parseInt(arr2[0]));
						product_Color product_Color = product_ColorService
								.getProduct_ColorById(Integer.parseInt(arr2[2]));
						product_Size product_Size = product_SizeService.getProduct_SizeById(Integer.parseInt(arr2[1]));
						Integer soluongInteger = Integer.parseInt(arr2[3]);
						MonHang2 monhang2 = new MonHang2(products, product_Size, product_Color, soluongInteger);
						list.add(monhang2);
					}

//					Double total = total(list);
//					ses.setAttribute("total", String.valueOf(total));
				}
			}
			ses.setAttribute("cart", list);
			return "redirect:/product";
		} else {
			model.addAttribute("user", employee);
			return "redirect:/adminhome";
		}
	}

	public Double total(List<MonHang2> list) {
		double sum = 0;
		for (MonHang2 monhang : list) {
			sum += monhang.getSoluong() * monhang.getProducts().getPrice();
		}
		return sum;
	}
}
