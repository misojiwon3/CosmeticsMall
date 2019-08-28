package com.spring.shopping.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QNAServiceImpl implements QNAService{
	
	@Autowired(required=false)
	private QNADAO qnaDAO = null;

	@Override
	public void writeQNA(String id, QNAVO qnaVO) throws Exception {
		try{
			qnaDAO.writeQNA(id, qnaVO);
		}catch(Exception e){
			throw new Exception("QNA 등록 실패", e);	
		}
	}

	@Override
	public void writeQNAReview(QNAVO qnaVO) throws Exception {
		try{
			qnaDAO.writeQNAReview(qnaVO);
		}catch(Exception e){
			throw new Exception("QNA 댓글 등록 실패", e);	
		}
		
	}
}
