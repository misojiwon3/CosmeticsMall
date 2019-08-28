package com.spring.shopping.product;

import java.util.ArrayList;
import java.util.List;

import com.spring.shopping.qna.QNAVO;
import com.spring.shopping.review.ReviewVO;

public interface ProductService {
	public void addProduct(ProductVO productVO) throws Exception;
	public void delProduct(int num) throws Exception;
	public List<ProductVO> getProductList(int category, int page) throws Exception;
	public List<ProductVO> getAllProductList(int page) throws Exception;
	public int getCount(int category) throws Exception;
	public int getSearchCount(String word) throws Exception;
	public ProductVO getProduct(int num) throws Exception;
	public List<ReviewVO> getReview(int num) throws Exception;
	public List<QNAVO> getQNA(int num) throws Exception;
	public void productLike(int num) throws Exception;
	public List<ProductVO> searchProduct(String word, int order, int page) throws Exception;
	public ArrayList<String> searchProductName(String word) throws Exception;
	public ArrayList<ProductVO> getBestList() throws Exception;
}