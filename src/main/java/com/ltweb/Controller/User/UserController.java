package com.ltweb.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ltweb.DTO.MonHang2;
import com.ltweb.Service.categories.categoriesService;
import com.ltweb.Service.products.productsService;
import com.ltweb.Entity.categories;
import com.ltweb.Entity.products;

@Controller
@SessionAttributes({ "cart", "total" })
public class UserController {

	@Autowired
	private productsService productsService;

	@Autowired
	private categoriesService categoriesService;

	@SuppressWarnings("unchecked")
	@GetMapping("/dangxuat")
	public String dangxuat(HttpSession session, HttpServletRequest request) {

		session.removeAttribute("user");
		List<MonHang2> list = (List<MonHang2>) session.getAttribute("cart");
		if (list != null) {
			list.clear();
		}
		session.setAttribute("cart", list);
		return "redirect:/home";
	}

	@GetMapping({ "/", "/shop", "/home" })
	public ModelAndView shop(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("user/shop");
		if (session.getAttribute("cart") == null) {
			List<MonHang2> listMonHang2 = new ArrayList<MonHang2>();
			modelAndView.addObject("cart", listMonHang2);
			double sum = 0;
			modelAndView.addObject("total", sum);
		}

		List<categories> listC = categoriesService.list();
		modelAndView.addObject("listC", listC);

		products products = productsService.getLastProducts();
		modelAndView.addObject("p", products);
		List<products> listP = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listP);
		return modelAndView;
	}

	@GetMapping({ "/product" })
	public ModelAndView product(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("user/product");
		List<products> listFourProducts = productsService.getThreeProducts(0);
		modelAndView.addObject("listP", listFourProducts);
		return modelAndView;
	}

	@GetMapping({ "/about" })
	public ModelAndView about() {
		ModelAndView modelAndView = new ModelAndView("user/about");
		return modelAndView;
	}

	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("pid") int pid, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("user/Detail");
		products products = productsService.getProductById(pid);
		session.setAttribute("p", products);
		session.setAttribute("cid", pid);
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart")
	public ModelAndView shopingcart(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("/user/ShoppingCart");
		List<MonHang2> list = (List<MonHang2>) session.getAttribute("cart");
		modelAndView.addObject("cart", list);
		return modelAndView;
	}
}
