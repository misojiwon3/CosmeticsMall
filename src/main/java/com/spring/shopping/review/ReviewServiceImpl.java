package com.spring.shopping.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired(required=false)
	private ReviewDAO reviewDAO = null;
	
	@Override
	public void writeReview(int num, String id, int pref, String content) throws Exception {
		try{
			reviewDAO.writeReview(num, id, pref, content);
		}catch(Exception e){
			throw new Exception("리뷰 등록 실패", e);
		}
	}
	@Override
	public void deleteReview(int num, int reviewNum, int pref) throws Exception {
		try{
			reviewDAO.deleteReview(num, reviewNum, pref);
		}catch(Exception e){
			throw new Exception("리뷰 삭제 실패", e);
		}
	}
}
