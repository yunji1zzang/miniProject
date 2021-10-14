package com.springapp.uglys;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
<<<<<<< HEAD
		return "loginForm";
=======
<<<<<<< HEAD
		return "index";
=======
		return "reviewList";
>>>>>>> branch 'develop' of https://github.com/strawberrylounge/projects_academy.git
>>>>>>> a60420db23907fbe7b63f83eac1d18052e040a0f
	}	
}
