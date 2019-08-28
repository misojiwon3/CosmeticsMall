package com.spring.shopping.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review.re")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(params="method=review")
	public String review(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		String id = (String)session.getAttribute("loginID");
		if(id == null){
			return "member/requestLogin";
		}		
		int num = Integer.parseInt(request.getParameter("num"));
		int pref = Integer.parseInt(request.getParameter("pref"));
		String content = request.getParameter("content");
		reviewService.writeReview(num, id, pref, content);
		model.addAttribute("preURL", preURL);
		return "review/reviewOK";
	}
	@RequestMapping(params="method=deleteReview")
	public String deleteReview(HttpServletRequest request, HttpSession session, ReviewVO reviewVO, Model model) throws Exception {
		String preURL = request.getHeader("referer");
		System.out.println("preURL : " + preURL);
		int num = reviewVO.getNum();
		int pref = reviewVO.getPref();
		int reviewNum = reviewVO.getReviewNum();
		System.out.println(num + " " + pref);
		reviewService.deleteReview(num, reviewNum, pref);
		model.addAttribute("preURL", preURL);
		return "review/reviewDelOK";
	}
}
