package com.spring.shopping.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

import com.spring.shopping.JDBCUtil.JDBCUtil;

@Component
public class ReviewDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String REVIEW_GETNAME = "select name from member where id = ?";
	private final String REVIEW_WRITE = "insert into review values(?, review_seq.nextval, ?, ?, ?)";
	private final String REVIEW_ADDPREF = "update product set total_pref = total_pref + ?, reviewcnt = reviewcnt + 1 where num = ?";
	private final String REVIEW_DELETE = "delete from review where reviewNum = ?";
	private final String REVIEW_DELPREF = "update product set total_pref = total_pref - ?, reviewcnt = reviewcnt - 1 where num = ?";
	
	public void writeReview(int num, String id, int pref, String content){		
		try{			
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_GETNAME);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			rs.next();
			String name = rs.getString("name");
			
			stmt = conn.prepareStatement(REVIEW_WRITE);
			stmt.setInt(1, num);
			stmt.setInt(2, pref);
			stmt.setString(3, content);
			stmt.setString(4, name);
			int i = stmt.executeUpdate();
			System.out.println("i in ReviewDAO : "+i);
			// 리뷰 등록 후 선호도와 리뷰 cnt를 수정해줌
			stmt = conn.prepareStatement(REVIEW_ADDPREF);
			stmt.setInt(1, pref);
			stmt.setInt(2, num);
			int j = stmt.executeUpdate();
			System.out.println("j in ReviewDAO : " + j);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
	}
	public void deleteReview(int num, int reviewNum, int pref){
		try{			
			conn = JDBCUtil.getConnection();			
			stmt = conn.prepareStatement(REVIEW_DELETE);
			stmt.setInt(1, reviewNum);
			int k = stmt.executeUpdate();
			System.out.println("k in ReviewDAO : " + k);
			// 리뷰 등록 후 선호도와 리뷰 cnt를 수정해줌
			stmt = conn.prepareStatement(REVIEW_DELPREF);
			stmt.setInt(1, pref);
			stmt.setInt(2, num);
			int l = stmt.executeUpdate();
			System.out.println("l in ReviewDAO : " + l);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
	}
}
