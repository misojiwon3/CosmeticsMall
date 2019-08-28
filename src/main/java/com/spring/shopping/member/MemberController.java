package com.spring.shopping.member;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member.me")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(params="method=loginPage")
	public String loginPage(HttpServletRequest request) throws Exception{
		String preURL = request.getHeader("referer");
		request.setAttribute("preURL", preURL);
		System.out.println("preURL : " + preURL);
		return "member/loginPage";
	}
	@RequestMapping(params="method=login")
	public String login(HttpServletRequest request, MemberVO memberVO, HttpSession session, Model model) throws Exception{
		String preURL = (String)request.getParameter("preURL");
		System.out.println("preURL login : " + preURL);
		MemberVO vo = memberService.login(memberVO);		
		if(vo != null){
			session.setAttribute("loginID", vo.getId());
			session.setAttribute("userName", vo.getName());
			if(vo.getId().equals("admin")){
				return "admin/addProduct";
			}
			model.addAttribute("preURL", preURL);
			return "member/loginOk";	// 로그인폼으로 오기 전 페이지로 보내줘야된다
		}else{
			return "home";
		}
	}
	@RequestMapping(params="method=adminPage")
	public String adminPage() throws Exception{
		return "admin/adminPage";
	}
	@RequestMapping(params="method=logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:./";
	}	
	@RequestMapping(params="method=joinPage")
	public String joinPage(HttpServletRequest request) throws Exception{
		String preURL = request.getHeader("referer");
		request.setAttribute("preURL", preURL);
		return "member/joinPage";
	}
	@RequestMapping(params="method=join")
	public String join(HttpServletRequest request, MemberVO memberVO, HttpSession session, Model model) throws Exception{
		String preURL = (String)request.getParameter("preURL");
		memberService.join(memberVO);	
		model.addAttribute("preURL", preURL);
		return "member/joinOk";
	}
	@RequestMapping(params="method=updatePage")
	public String updatePage(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginID");
		MemberVO memberVO = memberService.getMember(id);
		String postnum[] = memberVO.getPostnum().split("-");
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("postnum1", postnum[0]);
		model.addAttribute("postnum2", postnum[1]);
		return "member/updatePage";
	}
	@RequestMapping(params="method=update")
	public String update(MemberVO memberVO, HttpServletRequest request, HttpSession session) throws Exception{
		String id = (String)session.getAttribute("loginID");
		memberVO.setId(id);
		memberVO.setPostnum(request.getParameter("ZIPCODE1")+"-"+request.getParameter("ZIPCODE2"));
		memberService.updateMember(memberVO);
		return "member/updateOK";
	}
	@RequestMapping(params="method=checkId")
	public String checkId(MemberVO memberVO, Model model) throws Exception{
		int check = memberService.checkId(memberVO.getId());
		model.addAttribute("check", check);
		model.addAttribute("id", memberVO.getId());
		return "member/checkId";
	}
	
	@RequestMapping(params="method=zipcode")
	public String zipcode() throws Exception{
		return "member/zipcode";
	}
	@RequestMapping(params="method=zipcodeAction")
	public String zipcodeAction(HttpServletRequest request, Model model) throws Exception{
		List zipcodeList = new ArrayList();
		
		String dong = request.getParameter("dong");
		
		zipcodeList = memberService.searchZipcode(dong);
		model.addAttribute("zipcodelist", zipcodeList);
		return "member/zipcode";
	}
	@RequestMapping(params="method=myPage")
	public String myPage(HttpSession session) throws Exception{
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}
		return "member/myPage";
	}
	@RequestMapping(params="method=getMemberList")
	public String getMemberList(Model model) throws Exception{
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "admin/getMemberList";
	}
}
