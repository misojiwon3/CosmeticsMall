package com.spring.shopping.member;

import java.util.List;

public interface MemberService {
	public MemberVO login(MemberVO memberVO) throws Exception;
	public List searchZipcode(String searchdong) throws Exception;
	public void join(MemberVO memberVO) throws Exception;
	public int checkId(String id) throws Exception;
	public MemberVO getMember(String id) throws Exception;
	public List<MemberVO> getMemberList() throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
}
