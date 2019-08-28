package com.spring.shopping.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService{

	@Autowired(required=false)
	private CartDAO cartDAO = null;
	
	@Override
	public List getCartList(String id) throws Exception {
		try{
			return cartDAO.getCartList(id);
		}catch(Exception e){
			throw new Exception(id + "회원의 장바구니 목록 불러오기 실패", e);
		}
	}

	@Override
	public void addProductToCart(int num, String id, int amount) throws Exception {
		try{
			cartDAO.addProductToCart(num, id, amount);
		}catch(Exception e){
			throw new Exception(num + "번 상품 장바구니에 추가 실패", e);
		}		
	}

	@Override
	public int checkDuplicatedProduct(int num) throws Exception {
		try{
			return cartDAO.checkDuplicatedProduct(num);
		}catch(Exception e){
			throw new Exception(num + "번 상품 확인 실패", e);
		}
	}

	@Override
	public void modifyProductAmount(int num, int amount) throws Exception {
		try{
			cartDAO.modifyProductAmount(num, amount);
		}catch(Exception e){
			throw new Exception(num + "번 상품 수량 수정 실패", e);
		}		
	}

	@Override
	public void deleteProduct(String id, String products) throws Exception {
		try{
			cartDAO.deleteProduct(id, products);
		}catch(Exception e){
			throw new Exception("상품 삭제 실패", e);
		}
	}
}
