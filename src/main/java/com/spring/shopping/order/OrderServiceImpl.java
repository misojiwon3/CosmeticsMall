package com.spring.shopping.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired(required=false)
	private OrderDAO orderDAO = null;

	@Override
	public int addProductToOrderList(String id, String products) throws Exception {
		try{
			return orderDAO.addProductToOrderList(id, products);
		}catch(Exception e){
			throw new Exception("�ֹ�����Ʈ ��� ����", e);
		}		
	}

	@Override
	public List<OrderVO> getOrderList(String id, int seq) throws Exception {
		try{
			return orderDAO.getOrderList(id, seq);
		}catch(Exception e){
			throw new Exception("�ֹ�����Ʈ ��� ����", e);
		}
	}

	@Override
	public int orderNow(String id, int num, int amount) throws Exception {
		try{
			return orderDAO.orderNow(id, num, amount);
		}catch(Exception e){
			throw new Exception("�ٷ� �ֹ� ����Ʈ ��� ����", e);
		}
	}
}
