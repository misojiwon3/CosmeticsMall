package com.spring.shopping.member;

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
public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String MEMBER_SEARCH = "select * from member where id = ? and password = ?";
	private final String MEMBER_JOIN = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private final String MEMBER_INFO = "select * from member where id = ?";
	private final String MEMBER_UPDATE = "update member set password = ?, email = ?, cellphone = ?, postnum = ?, address = ? where id = ?";
	private final String MEMBER_GETLIST = "select * from member";
	
	public MemberVO login(MemberVO memberVO){
		MemberVO vo = null;
		try{
			conn = JDBCUtil.getConnection();	// static method
			stmt = conn.prepareStatement(MEMBER_SEARCH);
			stmt.setString(1, memberVO.getId());
			stmt.setString(2, memberVO.getPassword());
			rs = stmt.executeQuery();
			if(rs.next()){
				vo = new MemberVO();
				vo.setId(rs.getString("ID"));
				vo.setName(rs.getString("NAME"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.closeResource(rs, stmt, conn);
		}
		return vo;
	}
	
	public List searchZipcode(String searchdong) {
		String sql = "select * from zipcode where dong like ?";
		List zipcodeList = new ArrayList();
		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchdong+"%");
			rs = stmt.executeQuery();
			
			while(rs.next()){
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String ri = rs.getString("ri");
				String bunji = rs.getString("bunji");
				if(ri==null)
					ri="";
				if(bunji==null)
					bunji="";
				String zipcode = rs.getString("zipcode");
				String addr = sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
				
				zipcodeList.add(zipcode+","+addr);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}			
		}		
		return zipcodeList;		
	}
	public void join(MemberVO memberVO){
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_JOIN);
			stmt.setString(1, memberVO.getName());
			stmt.setString(2, memberVO.getGender());
			stmt.setString(3, memberVO.getBirth_year()+"/"+memberVO.getBirth_month()+"/"+memberVO.getBirth_day());
			stmt.setString(4, memberVO.getId());
			stmt.setString(5, memberVO.getPassword());
			stmt.setString(6, memberVO.getEmail1()+"@"+memberVO.getEmail2());
			stmt.setString(7, memberVO.getCellphone1()+"-"+memberVO.getCellphone2()+"-"+memberVO.getCellphone3());
			stmt.setString(8, memberVO.getPostnum());
			stmt.setString(9, memberVO.getAddress1()+","+memberVO.getAddress2());
			stmt.setInt(10, 0);
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.closeResource(stmt, conn);
		}
	}
	public int checkId(String id) throws SQLException {
		String sql = null;
		int x = -1;
		
		try{
			conn = JDBCUtil.getConnection();
			sql = "select id from member where id = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				x=1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}		
		}
		return x;
	}
	public MemberVO getMember(String id){
		MemberVO vo = null;		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INFO);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			rs.next();
			
			String birth[] = rs.getString("birthday").split("/");
			String email[] = rs.getString("email").split("@");
			String cellphone[] = rs.getString("cellphone").split("-");
			String address[] = rs.getString("address").split(",");
			
			vo = new MemberVO();
			vo.setName(rs.getString("name"));
			vo.setGender(rs.getString("gender"));
			vo.setBirth_year(birth[0]);
			vo.setBirth_month(birth[1]);
			vo.setBirth_day(birth[2]);
			vo.setId(id);
			vo.setEmail1(email[0]);
			vo.setEmail2(email[1]);
			vo.setCellphone1(cellphone[0]);
			vo.setCellphone2(cellphone[1]);
			vo.setCellphone3(cellphone[2]);
			vo.setPostnum(rs.getString("postnum"));
			vo.setAddress1(address[0]);
			vo.setAddress2(address[1]);
			vo.setPoint(rs.getInt("point"));
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}		
		}
		return vo;				
	}
	public List<MemberVO> getMemberList(){
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		MemberVO vo = null;
		String[] birth = null;
		String[] email = null;
		String[] cellphone = null;
		String[] address = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GETLIST);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				vo = new MemberVO();
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				birth = rs.getString("birthday").split("/");
				vo.setBirth_day(birth[2]);
				vo.setBirth_month(birth[1]);
				vo.setBirth_year(birth[0]);
				vo.setId(rs.getString("id"));
				email = rs.getString("email").split("@");
				vo.setEmail1(email[0]);
				vo.setEmail2(email[1]);
				cellphone = rs.getString("cellphone").split("-");
				vo.setCellphone1(cellphone[0]);
				vo.setCellphone2(cellphone[1]);
				vo.setCellphone3(cellphone[2]);
				vo.setPostnum(rs.getString("postnum"));
				address = rs.getString("address").split(",");
				vo.setAddress1(address[0]);
				vo.setAddress2(address[1]);
				vo.setPoint(rs.getInt("point"));
				memberList.add(vo);
			}		
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}		
		}
		return memberList;
	}
	public void updateMember(MemberVO memberVO){		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			System.out.println(memberVO.getId());
			stmt.setString(1, memberVO.getPassword());
			stmt.setString(2, memberVO.getEmail1()+"@"+memberVO.getEmail2());
			stmt.setString(3, memberVO.getCellphone1()+"-"+memberVO.getCellphone2()+"-"+memberVO.getCellphone3());
			stmt.setString(4, memberVO.getPostnum());
			stmt.setString(5, memberVO.getAddress1()+","+memberVO.getAddress2());
			stmt.setString(6, memberVO.getId());
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				JDBCUtil.closeResource(rs, stmt, conn);
			}catch(Exception e){}		
		}		
	}
}
