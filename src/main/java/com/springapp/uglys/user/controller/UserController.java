package com.springapp.uglys.user.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springapp.uglys.user.service.UserService;
import com.springapp.uglys.user.vo.UserVO;
import com.springapp.uglys.utils.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	// 파일 업로드
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() throws Exception{
		return "login";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		System.out.println("UserController.login");
		logger.info("login");
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("fail", false);
		}else {
			session.setAttribute("user", login);
		}
		return "redirect:/";
		
	
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("logout");

		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원가입 get
	@RequestMapping(value = "/insertUser", method = RequestMethod.GET)
	public void getInsertUser() throws Exception {
		logger.info("get insert");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/userInsert", method = RequestMethod.POST)
	public String postInsertUser(UserVO vo,HttpServletRequest req, MultipartFile file) throws Exception {
		logger.info("post insert");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		vo.setUser_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		System.out.println("setUser_img :"+vo.getUser_img());
		service.insertUser(vo);
<<<<<<< HEAD
		return "redirect:/loginForm";
=======
		return "userC";
>>>>>>> a60420db23907fbe7b63f83eac1d18052e040a0f
	}
	// 회원 정보 수정
	@RequestMapping(value="/userUpdateView", method = RequestMethod.GET)
	public String userUpdateView() throws Exception{
		
		return "userRUD";
	}

	// 수정 완료
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, HttpSession session) throws Exception{
		
		service.updateUser(vo);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/userDeleteView", method = RequestMethod.GET)
	public String userDeleteView() throws Exception{
		
		return "userDeleteView";
	}

	// 탈퇴 완료
	@RequestMapping(value="/userDelete", method = RequestMethod.POST)
	public String userDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		UserVO user = (UserVO) session.getAttribute("user");
		String sessionPassword = user.getUser_password();
		String voPassword = vo.getUser_password();
		
		if (!(sessionPassword.equals(voPassword))) {
			rttr.addFlashAttribute("fail", false);
			return "redirect:/user/userDeleteView";
		}

		service.deleteUser(vo);
		
		session.invalidate();
		
		return "redirect:/";
	}
	 
}
