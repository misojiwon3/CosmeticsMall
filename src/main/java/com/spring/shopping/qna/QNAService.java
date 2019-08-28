package com.spring.shopping.qna;

public interface QNAService {
	public void writeQNA(String id, QNAVO qnaVO) throws Exception;
	public void writeQNAReview(QNAVO qnaVO) throws Exception;
}
