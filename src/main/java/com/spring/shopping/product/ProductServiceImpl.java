package com.spring.shopping.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shopping.qna.QNAVO;
import com.spring.shopping.review.ReviewVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired(required=false)
	private ProductDAO productDAO = null;
	
	@Override
	public List<ProductVO> getProductList(int category, int page) throws Exception {
		try{
			return productDAO.getProductList(category, page);
		}catch(Exception e){
			throw new Exception("목록 불러오기 실패", e);
		}
	}
	@Override
	public ProductVO getProduct(int num) throws Exception {
		try{
			return productDAO.getProduct(num);
		}catch(Exception e){
			throw new Exception(num+"번 물품 상세 내역 불러오기 실패", e);
		}
	}
	@Override
	public List<ReviewVO> getReview(int num) throws Exception {
		try{
			return productDAO.getReview(num);
		}catch(Exception e){
			throw new Exception(num+"번 리뷰 불러오기 실패", e);
		}
	}
	@Override
	public void addProduct(ProductVO productVO) throws Exception {
		try{
			productDAO.addProduct(productVO);
		}catch(Exception e){
			throw new Exception("물품 등록 실패", e);
		}
	}
	@Override
	public void productLike(int num) throws Exception {
		try{
			productDAO.productLike(num);
		}catch(Exception e){
			throw new Exception("좋아요 실패", e);
		}		
	}
	@Override
	public List<ProductVO> searchProduct(String word, int order, int page) throws Exception {
		try{
			return productDAO.searchProduct(word, order, page);
		}catch(Exception e){
			throw new Exception("물품 검색 실패", e);
		}
	}
	@Override
	public ArrayList<String> searchProductName(String word) throws Exception {
		try{
			return productDAO.searchProductName(word);
		}catch(Exception e){
			throw new Exception("자동완성 실패", e);
		}
	}
	@Override
	public ArrayList<ProductVO> getBestList() throws Exception {
		try{
			return productDAO.getBestList();
		}catch(Exception e){
			throw new Exception("인기상품 불러오기 실패", e);
		}
	}
	@Override
	public int getCount(int category) throws Exception {
		try{
			return productDAO.getCount(category);
		}catch(Exception e){
			throw new Exception("상품 개수 불러오기 실패", e);
		}
	}
	@Override
	public List<QNAVO> getQNA(int num) throws Exception {
		try{
			return productDAO.getQNA(num);
		}catch(Exception e){
			throw new Exception(num+"번 QNA 불러오기 실패", e);
		}
	}
	@Override
	public int getSearchCount(String word) throws Exception {
		try{
			return productDAO.getSearchCount(word);
		}catch(Exception e){
			throw new Exception("검색 결과 갯수 불러오기 실패", e);
		}
	}
	@Override
	public List<ProductVO> getAllProductList(int page) throws Exception {
		try{
			return productDAO.getAllProductList(page);
		}catch(Exception e){
			throw new Exception("전체 물품 목록 불러오기 실패", e);
		}
	}
	@Override
	public void delProduct(int num) throws Exception {
		try{
			productDAO.delProduct(num);
		}catch(Exception e){
			throw new Exception("물품 삭제하기 실패", e);
		}
	}
}
