package com.spring.shopping.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.shopping.JDBCUtil.JDBCUtil;
import com.spring.shopping.review.ReviewVO;
import com.spring.shopping.qna.QNAVO;

@Component
public class ProductDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String PRODUCT_GETLIST = "select * from (select rownum r, num, name, brief, "
			+ "category, price, point, capacity, desc_image, desc_text, detail, total_pref, "
			+ "reviewcnt, image, mfd, numoflike from product where category = ?) "
			+ "where r >= ? and r <= ? ";
	private final String PRODUCT_GETALLLIST = "select * from product where num >= ? and num <= ? order by num";
	private final String PRODUCT_GETCNT = "select count(*) from product where category=?";
	private final String PRODUCT_GETSEARCHCNT = "select count(*) from product where name like ? or brief like ?";
	private final String PRODUCT_GETPROD = "select * from product where num = ?";
	private final String PRODUCT_GETREVIEW = "select * from review where num=? order by reviewnum";
	private final String PRODUCT_GETQNA = "select * from qna where num=? order by qnanum";
	private final String PRODUCT_ADDPRODUCT = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private final String PRODUCT_DELPRODUCT = "delete from product where num = ?";
	private final String PRODUCT_LIKE = "update product set numoflike = numoflike + 1 where num = ?";
	private final String cols = "rownum r, num, name, brief, category, price, point, capacity, desc_image, "
			+ "desc_text, detail, total_pref, reviewcnt, image, mfd, numoflike";
	private final String PRODUCT_SEARCH = "select * from (select "+cols+" from product where name like ? or brief like ?) where r >= ? and r <= ?";
	private final String PRODUCT_SEARCH1 = "select * from (select "+cols+" from (select "+cols+" from product where name like ? or brief like ? order by price desc)) where r >= ? and r <= ?";
	private final String PRODUCT_SEARCH2 = "select * from (select "+cols+" from (select "+cols+" from product where name like ? or brief like ? order by price asc)) where r >= ? and r <= ?";
	private final String PRODUCT_SEARCH3 = "select * from (select "+cols+" from (select "+cols+" from product where name like ? or brief like ? order by numoflike desc)) where r >= ? and r <= ?";
	private final String PRODUCT_SEARCH4 = "select * from (select "+cols+" from (select "+cols+" from product where name like ? or brief like ? order by reviewcnt desc)) where r >= ? and r <= ?";
	private final String PRODUCT_SEARCH5 = "select * from (select "+cols+" from (select "+cols+" from product where name like ? or brief like ? order by decode(reviewcnt, 0, 0, total_pref/reviewcnt) desc)) where r >= ? and r <= ?";
	private final String PRODUCT_GETBEST = "select e.* from (select * from product order by numoflike desc )e where rownum <= 12";
	
	public void addProduct(ProductVO vo){
		String desc_image = vo.getDesc_image();
		desc_image = desc_image.substring(0, desc_image.length()-1);
		System.out.println("ProductDAO addProduct : " + vo.getName().length());
		System.out.println("ProductDAO addProduct : " + vo.getMfd());
		System.out.println("ProductDAO addProduct : " + vo.getMfd().length());
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_ADDPRODUCT);
			stmt.setInt(1, vo.getNum());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getBrief());
			stmt.setInt(4, vo.getCategory());
			stmt.setInt(5, vo.getPrice());
			stmt.setInt(6, vo.getPoint());
			stmt.setString(7, vo.getCapacity());
			if(desc_image.equals("null")){
				stmt.setString(8, "none");
			}else{
				stmt.setString(8, desc_image);
			}			
			stmt.setString(9, vo.getDesc_text());
			stmt.setString(10, vo.getDetail());
			stmt.setInt(11, vo.getTotal_pref());
			stmt.setInt(12, vo.getReviewCnt());
			stmt.setString(13, vo.getImage());
			stmt.setString(14, vo.getMfd());
			stmt.setInt(15, vo.getNumoflike());
			stmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
	}
	public void delProduct(int num){
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_DELPRODUCT);
			stmt.setInt(1, num);
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(stmt, conn);
			}catch(Exception e){}	
		}
	}
	public List<ProductVO> getProductList(int category, int page){
		List<ProductVO> productList = new ArrayList<ProductVO>();
		ProductVO vo = null;
		int amount = 8;
		int start = page * amount - (amount - 1);
		int end = page * amount ;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETLIST);
			stmt.setInt(1, category);
			stmt.setInt(2, start);
			stmt.setInt(3, end);
			rs = stmt.executeQuery();	
			while(rs.next()){
				vo = new ProductVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBrief(rs.getString("brief"));
				vo.setPrice(rs.getInt("price"));
				vo.setCapacity(rs.getString("capacity"));
				vo.setDesc_image(rs.getString("desc_image"));
				vo.setDesc_text(rs.getString("desc_text"));
				vo.setDetail(rs.getString("detail"));
				vo.setTotal_pref(rs.getInt("total_pref"));
				vo.setImage(rs.getString("image"));
				vo.setMfd(rs.getString("mfd"));
				vo.setNumoflike(rs.getInt("numoflike"));
				productList.add(vo);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return productList;
	}
	public List<ProductVO> getAllProductList(int page){
		List<ProductVO> allProductList = new ArrayList<ProductVO>();
		ProductVO vo = null;
		int amount = 7;
		int start = page * amount - (amount - 1);
		int end = page * amount ;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETALLLIST);
			stmt.setInt(1, start);
			stmt.setInt(2, end);
			rs = stmt.executeQuery();	
			while(rs.next()){
				vo = new ProductVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBrief(rs.getString("brief"));
				vo.setPrice(rs.getInt("price"));
				vo.setCapacity(rs.getString("capacity"));
				vo.setDesc_image(rs.getString("desc_image"));
				vo.setDesc_text(rs.getString("desc_text"));
				vo.setDetail(rs.getString("detail"));
				vo.setTotal_pref(rs.getInt("total_pref"));
				vo.setImage(rs.getString("image"));
				vo.setMfd(rs.getString("mfd"));
				vo.setNumoflike(rs.getInt("numoflike"));
				allProductList.add(vo);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return allProductList;
	}
	public int getCount(int category){
		int count = 0;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETCNT);
			stmt.setInt(1, category);
			rs = stmt.executeQuery();	
			rs.next();
			count = rs.getInt("count(*)");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return count;
	}
	public int getSearchCount(String word){
		int count = 0;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETSEARCHCNT);
			stmt.setString(1, "%"+word+"%");
			stmt.setString(2, "%"+word+"%");
			rs = stmt.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}		
		return count;
	}
	public ProductVO getProduct(int num){
		ProductVO vo = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETPROD);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();			
			rs.next();
			
			vo = new ProductVO();
			vo.setNum(rs.getInt("num"));
			vo.setName(rs.getString("name"));
			vo.setBrief(rs.getString("brief"));
			vo.setPrice(rs.getInt("price"));
			vo.setPoint(rs.getInt("point"));
			vo.setCapacity(rs.getString("capacity"));
			if(rs.getString("desc_image") != null){
				vo.setDesc_image(rs.getString("desc_image"));
			}else{
				vo.setDesc_image(null);
			}
			if(rs.getString("desc_text") != null){
				vo.setDesc_text(rs.getString("desc_text"));
			}else{
				vo.setDesc_text(null);
			}
			vo.setDetail(rs.getString("detail"));
			vo.setTotal_pref(rs.getInt("total_pref"));
			vo.setReviewCnt(rs.getInt("reviewCnt"));
			vo.setImage(rs.getString("image"));
			vo.setMfd(rs.getString("mfd"));
			vo.setNumoflike(rs.getInt("numoflike"));

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return vo;
	}
	public List<ReviewVO> getReview(int num){
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		ReviewVO vo = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETREVIEW);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();	
			
			while(rs.next()){
				vo = new ReviewVO();
				vo.setNum(rs.getInt("num"));
				vo.setReviewNum(rs.getInt("reviewNum"));
				vo.setPref(rs.getInt("pref"));
				vo.setContent(rs.getString("content"));
				vo.setName(rs.getString("name"));	
				reviewList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return reviewList;
	}
	public List<QNAVO> getQNA(int num){
		List<QNAVO> qnaList = new ArrayList<QNAVO>();
		QNAVO vo = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETQNA);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();	
			
			while(rs.next()){
				vo = new QNAVO();
				vo.setNum(rs.getInt("num"));
				vo.setQNAnum(rs.getInt("QNAnum"));
				vo.setType(rs.getString("type"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setQnaRe(rs.getString("qnaRe"));
				vo.setState(rs.getString("state"));
				vo.setName(rs.getString("name"));
				vo.setRegdate(rs.getString("regdate"));
				qnaList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return qnaList;
	}
	public void productLike(int num){		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_LIKE);
			stmt.setInt(1, num);
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
	}
	public List<ProductVO> searchProduct(String word, int order, int page){
		List<ProductVO> searchProductList = new ArrayList<ProductVO>();
		ProductVO vo = null;
		int amount = 6;
		int start = page * amount - 5;
		int end = page * amount ;
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		try{
			conn = JDBCUtil.getConnection();
			if(order == 0){
				stmt = conn.prepareStatement(PRODUCT_SEARCH);	// 그냥 정렬
			}else if(order == 1){
				stmt = conn.prepareStatement(PRODUCT_SEARCH1);	// 높은 가격순 
			}else if(order == 2){
				stmt = conn.prepareStatement(PRODUCT_SEARCH2);	// 낮은 가격순
			}else if(order == 3){
				stmt = conn.prepareStatement(PRODUCT_SEARCH3);	// 좋아요 순
			}else if(order == 4){
				stmt = conn.prepareStatement(PRODUCT_SEARCH4);	// 리뷰 많은 순
			}else if(order == 5){
				stmt = conn.prepareStatement(PRODUCT_SEARCH5);	// 선호도 순
			}
			stmt.setString(1, "%"+word+"%");
			stmt.setString(2, "%"+word+"%");
			stmt.setInt(3, start);
			stmt.setInt(4, end);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				vo = new ProductVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setBrief(rs.getString("brief"));
				vo.setCategory(rs.getInt("category"));
				vo.setPrice(rs.getInt("price"));
				vo.setPoint(rs.getInt("point"));
				vo.setCapacity(rs.getString("capacity"));
				vo.setDesc_image(rs.getString("desc_image"));
				vo.setDesc_text(rs.getString("desc_text"));
				vo.setDetail(rs.getString("detail"));
				vo.setTotal_pref(rs.getInt("total_pref"));
				vo.setReviewCnt(rs.getInt("reviewCnt"));
				vo.setImage(rs.getString("image"));
				vo.setMfd(rs.getString("mfd"));
				vo.setNumoflike(rs.getInt("numoflike"));
				searchProductList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}		
		return searchProductList;
	}	
	public ArrayList<String> searchProductName(String word){
		String sql = "select name from product where name like ?";
		ArrayList<String> wordList= new ArrayList<String>();
		
		System.out.println("word in DAO : "+word);
		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+word+"%");
			rs = stmt.executeQuery();
			while(rs.next()){
				wordList.add(rs.getString("name"));
			}			

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		
		return wordList; 
	}
	public ArrayList<ProductVO> getBestList(){
		ArrayList<ProductVO> bestList = new ArrayList<ProductVO>();
		ProductVO vo = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCT_GETBEST);
			rs = stmt.executeQuery();
			while(rs.next()){
				vo = new ProductVO();
				vo.setNum(rs.getInt("num"));
				vo.setImage(rs.getString("image"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				bestList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
		return bestList;
	}
}
