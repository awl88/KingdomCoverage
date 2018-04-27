package com.skilldistillery.mvckingdomdcoverage.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class AgentController {
	
	@RequestMapping(path = "getClient.do", method = RequestMethod.GET)
	public ModelAndView getClient() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("getClient.jsp");

		return mv;
	}
	
	@RequestMapping(path = "approved.do", method = RequestMethod.POST)
	public ModelAndView approbed() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insuredAgent.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "declined.do", method = RequestMethod.POST)
	public ModelAndView declined() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insuredAgent.jsp");
		
		return mv;
	}

}
