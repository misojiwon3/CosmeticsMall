package com.spring.shopping.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart.ct")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(params="method=addCart")
	public String addCart(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("num"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		// ��ٱ��Ͽ� ��ǰ �߰� �� ���ư� �������� ���� request��ü�� num�� �߰�
		request.setAttribute("num", num);	
		
		// ID üũ �� �α��� ���°� �ƴϸ� �α��� ��û �������� �̵�
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}
		if(cartService.checkDuplicatedProduct(num) == 0){
			return "cart/checkDuplicatedProduct";
		}
		cartService.addProductToCart(num, id, amount);
		return "cart/checkMoveCart";
	}
	
	@RequestMapping(params="method=getCartList")
	public String getCartList(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}
		List<CartVO> cartList = new ArrayList<CartVO>();
		cartList = cartService.getCartList(id);
		int allPrice = 0;
		int allPoint = 0;
		for(int i = 0; i < cartList.size(); i++){
			allPrice += cartList.get(i).getTotalPrice();
			allPoint += cartList.get(i).getPoint() * cartList.get(i).getAmount();
		}
		model.addAttribute("allPrice", allPrice);	// ��ٱ��� ���� ��� ��ǰ ���� ��
		model.addAttribute("allPoint", allPoint);	// ��ٱ��� �� ��ǰ���� ���� ���� ����Ʈ ��
		model.addAttribute("cartList", cartList);
		return "cart/getProductListInCart";
	}
	@RequestMapping(params="method=modifyProductAmount")
	public String modifyProductAmount(HttpServletRequest request, Model model) throws Exception{
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		int num = Integer.parseInt(request.getParameter("num"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		System.out.println("cartController modifyProductAmount : "+num+", "+amount);		
		cartService.modifyProductAmount(num, amount);
		model.addAttribute("preURL", preURL);
		return "cart/checkModifyAmount";		
	}
	@RequestMapping(params="method=deleteProduct")
	public String deleteProduct(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		String id = (String)session.getAttribute("loginID");
		String products = request.getParameter("products");
		cartService.deleteProduct(id, products);
		model.addAttribute("preURL", preURL);
		return "cart/checkDelete";
	}
}
