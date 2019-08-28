package com.spring.shopping.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

import com.spring.shopping.JDBCUtil.JDBCUtil;

@Component
public class QNADAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String QNA_GETNAME= "select name from member where id = ?";
	private final String QNA_GETTIME = "select to_char(sysdate, 'YY/MM/DD HH-MI') regdate from dual";
	private final String QNA_WRITE = "insert into qna values(?, qna_seq.nextval, ?, ?, ?, ' ', ?, ?, ?)";
	private final String QNA_ADDRE = "update qna set qnaRe = ?, state = '답변완료' where qnanum = ?";
	
	public void writeQNA(String id, QNAVO qnaVO){
		try{			
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_GETNAME);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			rs.next();
			String name = rs.getString("name");
			
			stmt = conn.prepareStatement(QNA_GETTIME);
			rs = stmt.executeQuery();
			rs.next();
			String regdate = rs.getString("regdate");
			
			stmt = conn.prepareStatement(QNA_WRITE);
			stmt.setInt(1, qnaVO.getNum());
			stmt.setString(2, qnaVO.getType());
			stmt.setString(3, qnaVO.getTitle());
			stmt.setString(4, qnaVO.getContent());
			stmt.setString(5, "답변대기");
			stmt.setString(6, name);
			stmt.setString(7, regdate);
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}	
		}
	}
	public void writeQNAReview(QNAVO qnaVO){
		try{			
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_ADDRE);
			stmt.setString(1, qnaVO.getQnaRe());
			stmt.setInt(2, qnaVO.getQNAnum());
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(stmt, conn);
			}catch(Exception e){}	
		}
	}
}
