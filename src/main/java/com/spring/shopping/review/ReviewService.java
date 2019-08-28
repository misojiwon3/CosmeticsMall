package com.spring.shopping.review;

public interface ReviewService {
	public void writeReview(int num, String id, int pref, String content) throws Exception;
	public void deleteReview(int num, int reviewNum, int pref) throws Exception;
}
