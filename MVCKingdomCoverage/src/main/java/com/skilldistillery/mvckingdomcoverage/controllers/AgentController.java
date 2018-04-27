package com.skilldistillery.mvckingdomcoverage.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;

public class AgentController {
	@Autowired
	AgentDAO adao;
	
	@RequestMapping(path = "getClient.do", method = RequestMethod.GET)
	public ModelAndView getClient(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		List<Insured> clients = adao.getClients(id);
		mv.addObject("listOfInsured", clients);

		mv.setViewName("getClient.jsp");
		return mv;
	}
	
	@RequestMapping(path = "approved.do", method = RequestMethod.POST)
	public ModelAndView approbed(HttpSession session) {
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
