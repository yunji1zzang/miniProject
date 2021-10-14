package com.springapp.uglys.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springapp.uglys.review.dao.ReviewDAO;
import com.springapp.uglys.review.service.ReviewService;
import com.springapp.uglys.review.vo.ReviewVO;


@Controller
@SessionAttributes("review")
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	// 후기 등록
	@RequestMapping("/insertReview.do")
	public String insert(ReviewVO vo, ReviewDAO reviewDAO) {
		System.out.println("/insertReview.do");
		reviewService.insert(vo);
		return "getReviewList.do";
	}
	
	
	// 후기 수정
	@RequestMapping("/updateReview.do")
	public String update(@ModelAttribute("review") ReviewVO vo, ReviewDAO reviewDAO) {
		reviewService.update(vo);
		return "getReviewList.do";
	}
	
	
	// 후기 삭제
	@RequestMapping("/deleteReview.do")
	public String delete(ReviewVO vo, ReviewDAO reviewDAO) {
		reviewService.delete(vo);
		return "getReviewList.do";
	}
	
	
	// 후기 조회
	@RequestMapping("/getReview.do")
	public String getReview(ReviewVO vo, Model model) {
		reviewService.view_cnt(vo);
		model.addAttribute("review", reviewService.getReview(vo));
		return "getReview";
	}
	
	
	// 후기 목록 & 검색
	@RequestMapping("/getReviewList.do")
	public String getReviewList(ReviewVO vo, Model model) {
		System.out.println("/getReviewList.do");
		
		if (vo.getSearchCondition() != null) {
			vo.setSearchCondition("TITLE");
		}

		if (vo.getSearchKeyword() != null) {
			vo.setSearchKeyword(""); 
		}
//		List<ReviewVO> reviewList = reviewService.getReviewList(vo);
//		for (ReviewVO reviewVO : reviewList) {
//			System.out.println(reviewVO.getWriter());
//		}
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "reviewList";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	
	
	
	
//	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/review", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "review";
//	}

}
