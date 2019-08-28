package com.spring.shopping.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shopping.product.ProductVO;

@Controller
@RequestMapping("/order.or")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(params="method=addOrder")
	public String addOrder(HttpServletRequest request, HttpSession session) throws Exception{
		String products = request.getParameter("products");
		String id = (String)session.getAttribute("loginID");
		System.out.println("OrderController cheched : String products " + products);
		int seq = orderService.addProductToOrderList(id, products);
		System.out.println("OrderController addOrder");
		return "redirect:/order.or?method=getOrderList&seq="+seq;
	}
	
	@RequestMapping(params="method=getOrderList")
	public String getOrderList(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginID");
		int seq = Integer.parseInt(request.getParameter("seq"));
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		orderList = orderService.getOrderList(id, seq);
		model.addAttribute("orderList", orderList);
		return "order/getOrderList";
	}
	@RequestMapping(params="method=orderNow")
	public String orderNow(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}
		int num = Integer.parseInt(request.getParameter("num"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		System.out.println("[id] "+id+" [num] "+num+" [amount] "+amount);
		int seq = orderService.orderNow(id, num, amount);
		return "redirect:/order.or?method=getOrderList&seq="+seq;
	}
}
