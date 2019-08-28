package com.spring.shopping.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna.qa")
public class QNAController {

	@Autowired
	private QNAService qnaService;
	
	@RequestMapping(params="method=qna")
	public String qna(HttpServletRequest request, HttpSession session, QNAVO qnaVO, Model model) throws Exception{
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}
		qnaService.writeQNA(id, qnaVO);
		model.addAttribute("preURL", preURL);
		return "QNA/qnaOK";
	}
	@RequestMapping(params="method=qnaRe")
	public String qnaRe(HttpServletRequest request, QNAVO qnaVO, Model model) throws Exception{
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		System.out.println(qnaVO.getQNAnum());
		System.out.println(qnaVO.getQnaRe());
		qnaService.writeQNAReview(qnaVO);
		model.addAttribute("preURL", preURL);
		return "QNA/qnaOK";
	}
}
