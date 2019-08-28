package com.spring.shopping;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shopping.product.ProductService;
import com.spring.shopping.product.ProductVO;

@Controller
@RequestMapping("/category.ca")
public class CategoryController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(params="method=getProductList")
	public String goSkincareSkin(HttpServletRequest request, Model model) throws Exception{
		List<ProductVO> productList = new ArrayList<ProductVO>();
		int category = Integer.parseInt(request.getParameter("category"));
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		int count = productService.getCount(category);
		productList = productService.getProductList(category, page);
		model.addAttribute("category", category);
		model.addAttribute("productList", productList);
		model.addAttribute("count", count);
		return "product/getProductList";
	}
}
