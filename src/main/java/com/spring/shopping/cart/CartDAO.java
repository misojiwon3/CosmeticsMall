package com.spring.shopping.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Component;

import com.spring.shopping.JDBCUtil.JDBCUtil;

@Component
public class CartDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String CART_ADDPROD = "insert into cart values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private final String CART_GETPROD = "select * from cart where id=?";
	private final String CART_GETLIST = "select * from cart where id = ?";
	private final String CART_GETPRODINFO = "select * from product where num=?";
	private final String CART_GETDUPLICATED = "select num from cart where num=?";
	private final String CART_MODIFYAMOUNT = "update cart set amount = ?, totalPrice = ? where num =?";
	private final String CART_GETPRICE = "select productPrice from cart where num = ?";
	private final String CART_DELPROD = "delete from cart where id = ? and num = ?";
	
	public List getCartList(String id){
		List cartList = new ArrayList();
		CartVO vo = null;		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CART_GETLIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				vo = new CartVO();
				vo.setNum(rs.getInt("num"));
				vo.setId(rs.getString("id"));
				vo.setProductName(rs.getString("productName"));
				vo.setProductPrice(rs.getInt("productPrice"));
				vo.setProductImage(rs.getString("productImage"));
				vo.setDesc_image(rs.getString("desc_image"));
				vo.setDesc_text(rs.getString("desc_text"));
				vo.setDetail(rs.getString("detail"));
				vo.setNumInCart(rs.getInt("numInCart"));
				vo.setAmount(rs.getInt("amount"));
				vo.setPoint(rs.getInt("point"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				cartList.add(vo);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}	
		return cartList;		
	}
	public int checkDuplicatedProduct(int num){
		int check = 0;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CART_GETDUPLICATED);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			
			if(rs.next() == false){
				check = 1;
			}else{
				System.out.println(rs.getInt("num")+"번 상품이 카트에 존재");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}	
		return check;
	}
	public void modifyProductAmount(int num, int amount){		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CART_GETPRICE);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			rs.next();
			int price = rs.getInt("productPrice");
			
			stmt = conn.prepareStatement(CART_MODIFYAMOUNT);
			stmt.setInt(1, amount);
			stmt.setInt(2, amount * price); 
			stmt.setInt(3, num);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(stmt, conn);
			}catch(Exception e){}			
		}	
	}
	public void addProductToCart(int num, String id, int amount){	// 상품의 번호와 아이디를 입력받아서 저장 
		int productCnt = 0;
		int numInCart = 0;
		try{
			conn = JDBCUtil.getConnection();
			// 카트 내 물품들에 번호를 매기기 위한 카운팅
			stmt = conn.prepareStatement(CART_GETPROD);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while(rs.next()){
				productCnt++; // cart 안의 상품 개수 체크
			}
			numInCart = productCnt + 1;
			// 카트 정보를 입력하기 위해 물품의 정보를 불로옴
			stmt = conn.prepareStatement(CART_GETPRODINFO);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			rs.next();
			String productName = rs.getString("name");
			int point = rs.getInt("point");
			int productPrice = rs.getInt("price");
			String productImage = rs.getString("image");
			String desc_image = rs.getString("desc_image");
			String desc_text = rs.getString("desc_text");
			String detail = rs.getString("detail");
			System.out.println(productImage);
			// 카트에 상품 정보 추가를 위한 Query
			stmt = conn.prepareStatement(CART_ADDPROD);
			stmt.setInt(1, num);
			stmt.setString(2, id);
			stmt.setString(3, productName);
			stmt.setInt(4, productPrice);
			stmt.setString(5, productImage);
			stmt.setString(6, desc_image);
			stmt.setString(7, desc_text);
			stmt.setString(8, detail);
			stmt.setInt(9, numInCart);
			stmt.setInt(10, amount);
			stmt.setInt(11, point);
			stmt.setInt(12, productPrice * amount);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}	
	}
	public void deleteProduct(String id, String products){
		try{
			conn = JDBCUtil.getConnection();
			StringTokenizer st = new StringTokenizer(products, ",");
			while(st.hasMoreElements()){
				stmt = conn.prepareStatement(CART_DELPROD);
				stmt.setString(1, id);
				stmt.setInt(2, Integer.parseInt(st.nextToken()));
				stmt.executeUpdate();	
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(stmt, conn);
			}catch(Exception e){}			
		}	
	}
}
