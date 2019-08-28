package com.spring.shopping.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired(required=false)
	private MemberDAO memberDAO = null;
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		try{
			MemberVO vo = memberDAO.login(memberVO);
			return vo;
		}catch(Exception e){
			throw new Exception(memberVO.getId() + "�� ȸ���� �α��� ����", e);
		}
	}

	@Override
	public List searchZipcode(String searchdong) throws Exception {
		try{
			return memberDAO.searchZipcode(searchdong);
		}catch(Exception e){
			throw new Exception("�����ȣ ��� �ҷ����� ����", e);
		}
	}

	@Override
	public void join(MemberVO memberVO) throws Exception {
		try{
			memberDAO.join(memberVO);
		}catch(Exception e){
			throw new Exception("ȸ������ ����", e);
		}
		
	}

	@Override
	public int checkId(String id) throws Exception {
		try{
			return memberDAO.checkId(id);
		}catch(Exception e){
			throw new Exception("���̵� üũ ����", e);
		}
	}

	@Override
	public MemberVO getMember(String id) throws Exception {
		try{
			return memberDAO.getMember(id);
		}catch(Exception e){
			throw new Exception("��� ���� �ҷ����� ����", e);
		}
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		try{
			memberDAO.updateMember(memberVO);
		}catch(Exception e){
			throw new Exception("��� ���� ���� ����", e);
		}		
	}

	@Override
	public List<MemberVO> getMemberList() throws Exception {
		try{
			return memberDAO.getMemberList();
		}catch(Exception e){
			throw new Exception("��� ��� �ҷ����� ����", e);
		}	
	}

}
