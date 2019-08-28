package com.spring.shopping.cart;

import java.util.List;

public interface CartService {
	public List getCartList(String id) throws Exception;
	public void addProductToCart(int num, String id, int amount) throws Exception;
	public int checkDuplicatedProduct(int num) throws Exception;
	public void modifyProductAmount(int num, int amount) throws Exception;
	public void deleteProduct(String id, String products) throws Exception;
}
