package com.spring.shopping.order;

import java.util.List;

public interface OrderService {
	public List<OrderVO> getOrderList(String id, int seq) throws Exception;
	public int addProductToOrderList(String id, String products) throws Exception;
	public int orderNow(String id, int num, int amount) throws Exception;
}
