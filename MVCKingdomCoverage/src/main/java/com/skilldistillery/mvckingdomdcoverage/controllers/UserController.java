package com.skilldistillery.mvckingdomdcoverage.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Transactional
@Controller
public class UserController {

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");

		return mv;
	}
	
	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public ModelAndView createUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser.jsp");

		return mv;
	}
	
	@RequestMapping(path = "created.do", method = RequestMethod.POST)
	public ModelAndView createdUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public ModelAndView update() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateInsured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "submitRequest.do", method = RequestMethod.POST)
	public ModelAndView submitRequest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "deactivate.do", method = RequestMethod.POST)
	public ModelAndView deactivate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		
		return mv;
	}
	
	
}
