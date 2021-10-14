package com.springapp.uglys.review.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springapp.uglys.review.dao.ReviewDAO;
import com.springapp.uglys.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public void insert(ReviewVO vo) {
		reviewDAO.insert(vo);
	}

	@Override
	public void update(ReviewVO vo) {
		reviewDAO.update(vo);
	}

	@Override
	public void delete(ReviewVO vo) {
		reviewDAO.delete(vo);
	}

	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	// 조회수 증가
	public int view_cnt(ReviewVO vo) {
		return reviewDAO.view_cnt(vo);
	}
}
