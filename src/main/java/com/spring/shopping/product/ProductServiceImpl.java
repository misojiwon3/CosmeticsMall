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
			throw new Exception("��� �ҷ����� ����", e);
		}
	}
	@Override
	public ProductVO getProduct(int num) throws Exception {
		try{
			return productDAO.getProduct(num);
		}catch(Exception e){
			throw new Exception(num+"�� ��ǰ �� ���� �ҷ����� ����", e);
		}
	}
	@Override
	public List<ReviewVO> getReview(int num) throws Exception {
		try{
			return productDAO.getReview(num);
		}catch(Exception e){
			throw new Exception(num+"�� ���� �ҷ����� ����", e);
		}
	}
	@Override
	public void addProduct(ProductVO productVO) throws Exception {
		try{
			productDAO.addProduct(productVO);
		}catch(Exception e){
			throw new Exception("��ǰ ��� ����", e);
		}
	}
	@Override
	public void productLike(int num) throws Exception {
		try{
			productDAO.productLike(num);
		}catch(Exception e){
			throw new Exception("���ƿ� ����", e);
		}		
	}
	@Override
	public List<ProductVO> searchProduct(String word, int order, int page) throws Exception {
		try{
			return productDAO.searchProduct(word, order, page);
		}catch(Exception e){
			throw new Exception("��ǰ �˻� ����", e);
		}
	}
	@Override
	public ArrayList<String> searchProductName(String word) throws Exception {
		try{
			return productDAO.searchProductName(word);
		}catch(Exception e){
			throw new Exception("�ڵ��ϼ� ����", e);
		}
	}
	@Override
	public ArrayList<ProductVO> getBestList() throws Exception {
		try{
			return productDAO.getBestList();
		}catch(Exception e){
			throw new Exception("�α��ǰ �ҷ����� ����", e);
		}
	}
	@Override
	public int getCount(int category) throws Exception {
		try{
			return productDAO.getCount(category);
		}catch(Exception e){
			throw new Exception("��ǰ ���� �ҷ����� ����", e);
		}
	}
	@Override
	public List<QNAVO> getQNA(int num) throws Exception {
		try{
			return productDAO.getQNA(num);
		}catch(Exception e){
			throw new Exception(num+"�� QNA �ҷ����� ����", e);
		}
	}
	@Override
	public int getSearchCount(String word) throws Exception {
		try{
			return productDAO.getSearchCount(word);
		}catch(Exception e){
			throw new Exception("�˻� ��� ���� �ҷ����� ����", e);
		}
	}
	@Override
	public List<ProductVO> getAllProductList(int page) throws Exception {
		try{
			return productDAO.getAllProductList(page);
		}catch(Exception e){
			throw new Exception("��ü ��ǰ ��� �ҷ����� ����", e);
		}
	}
	@Override
	public void delProduct(int num) throws Exception {
		try{
			productDAO.delProduct(num);
		}catch(Exception e){
			throw new Exception("��ǰ �����ϱ� ����", e);
		}
	}
}
