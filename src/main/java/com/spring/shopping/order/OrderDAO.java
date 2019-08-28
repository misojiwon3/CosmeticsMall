package com.spring.shopping.order;

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
public class OrderDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String ORDER_GETLIST = "select * from orderProduct where id = ? and seq = ?";
	private final String ORDER_ADDORDER = "insert into orderProduct values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private final String ORDER_GETMEMBER = "select * from member where id = ?";
	private final String ORDER_GETPROD = "select * from cart where num = ? and id = ?";
	private final String ORDER_CHECKNUM = "select num from orderProduct where id = ? and seq = ?";
	private final String ORDER_ADDAMOUNT = "update orderProduct set productAmount = productAmount + ?,"
											+ "totalPrice = totalPrice + ( ? * productPrice),"
											+ "totalPoint = totalPoint + ( ? * productPoint) "
											+ "where num = ? and seq = ?";
	private final String ORDER_PRODUCT = "select * from product where num = ?";
	private final String GETSEQ = "select order_seq.nextval from dual";
	
	public List<OrderVO> getOrderList(String id, int seq){
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		OrderVO vo = null;
		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ORDER_GETLIST);
			stmt.setString(1, id);
			stmt.setInt(2, seq);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				vo = new OrderVO();
				vo.setId(id);
				vo.setMemberName(rs.getString("memberName"));
				vo.setCellphone(rs.getString("cellphone"));
				vo.setEmail(rs.getString("email"));
				vo.setPostnum(rs.getString("postnum"));
				vo.setAddress(rs.getString("address"));
				vo.setMemberPoint(rs.getInt("memberPoint"));
				vo.setNum(rs.getInt("num"));
				vo.setProductName(rs.getString("productName"));
				vo.setProductImage(rs.getString("productImage"));
				vo.setProductAmount(rs.getInt("productAmount"));
				vo.setProductPrice(rs.getInt("productPrice"));
				vo.setProductPoint(rs.getInt("productPoint"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setTotalPoint(rs.getInt("totalPoint"));
				orderList.add(vo);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}	
		return orderList;
	}
	public int orderNow(String id, int num, int amount){
		int seq = 0;
		try{
			conn = JDBCUtil.getConnection();
			// orderList에 포함시킬 주문자의 정보 추출 (member)
			stmt = conn.prepareStatement(ORDER_GETMEMBER);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			rs.next();
			String memberName = rs.getString("name");
			String cellphone = rs.getString("cellphone");
			String email = rs.getString("email");
			String postnum = rs.getString("postnum");
			String address = rs.getString("address");
			int memberPoint = rs.getInt("point");
			
			// orderList에 포함시킬 상품의 정보 추출(product)
			stmt = conn.prepareStatement(ORDER_PRODUCT);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			rs.next();
			String productName = rs.getString("name");
			String productImage = rs.getString("image");
			int productPrice = rs.getInt("price");
			int productPoint = rs.getInt("point");
			
			//주문 번호 지정을 위해서 시퀀스값 추출
			stmt = conn.prepareStatement(GETSEQ);
			rs = stmt.executeQuery();
			rs.next();
			seq = rs.getInt("nextval");			
			System.out.println("OrderDAO addOrder: seq = " + seq);
			
			stmt = conn.prepareStatement(ORDER_ADDORDER);
			stmt.setInt(1, seq);
			stmt.setString(2, id);
			stmt.setString(3, memberName);
			stmt.setString(4, cellphone);
			stmt.setString(5, email);
			stmt.setString(6, postnum);
			stmt.setString(7, address);
			stmt.setInt(8, memberPoint);
			stmt.setInt(9, num);
			stmt.setString(10, productName);
			stmt.setString(11, productImage);
			stmt.setInt(12, amount);
			stmt.setInt(13, productPrice);
			stmt.setInt(14, productPoint);
			stmt.setInt(15, productPrice * amount);
			stmt.setInt(16, productPoint * amount);
			stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}
		return seq;
	}
	public int addProductToOrderList(String id, String products){
		List<Integer> orderedProductList = new ArrayList<Integer>();
		int seq = 0;
		try{
			conn = JDBCUtil.getConnection();
			// orderList에 포함시킬 주문자의 정보 추출 (member)
			stmt = conn.prepareStatement(ORDER_GETMEMBER);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			rs.next();
			String memberName = rs.getString("name");
			String cellphone = rs.getString("cellphone");
			String email = rs.getString("email");
			String postnum = rs.getString("postnum");
			String address = rs.getString("address");
			int memberPoint = rs.getInt("point");
			
			//productsd에서 num들을 tokenize해서 상품의 정보들 추출하고 리스트에 넣음
			StringTokenizer st = new StringTokenizer(products, ",");
			while(st.hasMoreTokens()){
				orderedProductList.add(Integer.parseInt(st.nextToken()));
			}
			//test print
			for(int j = 0; j < orderedProductList.size(); j++){
				System.out.println(j + "번째 : " + orderedProductList.get(j));
			}
			
			//주문 번호 지정을 위해서 시퀀스값 추출
			stmt = conn.prepareStatement(GETSEQ);
			rs = stmt.executeQuery();
			rs.next();
			seq = rs.getInt("nextval");			
			System.out.println("OrderDAO addOrder: seq = " + seq);
			
			for(int k = 0; k < orderedProductList.size(); k++){
				int num = orderedProductList.get(k);
				int exist = 0;
				stmt = conn.prepareStatement(ORDER_CHECKNUM); // 해당 아이디와 주문번호를 가진 사람들이 중복된 num을 가졌는지 검사
				stmt.setString(1, id);
				stmt.setInt(2, seq);
				rs = stmt.executeQuery();
				while(rs.next()){
					if(num == rs.getInt("num")) // 있다면 exist = 1
						exist = 1;
				}
				stmt = conn.prepareStatement(ORDER_GETPROD); // (product)
				stmt.setInt(1, num);
				stmt.setString(2, id);
				rs = stmt.executeQuery();
				rs.next();				
				String productName = rs.getString("productName");
				String productImage = rs.getString("productImage");
				int productAmount = rs.getInt("amount");
				int productPrice = rs.getInt("productPrice");
				int productPoint = rs.getInt("point");
				int totalPrice = rs.getInt("totalPrice");
				
				if(exist == 1){	// 해당 id의 주문 리스트에 같은 품목이 존재할 때 - 수량만 더해줌
					stmt = conn.prepareStatement(ORDER_ADDAMOUNT);
					stmt.setInt(1, productAmount);
					stmt.setInt(2, productAmount);
					stmt.setInt(3, productAmount);
					stmt.setInt(4, num);
					stmt.setInt(5, seq);
					stmt.executeUpdate();
					System.out.println("##OrderDAO : 수량만 더해줌");
					
				}else{		// 해당 id의 주문 리스트에 같은 품목이 존재하지 않을 경우 - 그냥 추가
					stmt = conn.prepareStatement(ORDER_ADDORDER);
					stmt.setInt(1, seq);
					stmt.setString(2, id);
					stmt.setString(3, memberName);
					stmt.setString(4, cellphone);
					stmt.setString(5, email);
					stmt.setString(6, postnum);
					stmt.setString(7, address);
					stmt.setInt(8, memberPoint);
					stmt.setInt(9, num);
					stmt.setString(10, productName);
					stmt.setString(11, productImage);
					stmt.setInt(12, productAmount);
					stmt.setInt(13, productPrice);
					stmt.setInt(14, productPoint);
					stmt.setInt(15, totalPrice);
					stmt.setInt(16, productPoint * productAmount);
					stmt.executeUpdate();
					System.out.println("##OrderDAO : 같은 상품이 존재하지 않아서 그냥 추가");
				}
			}			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}	
		return seq;
	}	
}
