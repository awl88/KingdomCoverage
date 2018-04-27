package com.skilldistillery.mvckingdomdcoverage.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpakingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.jpakingdomcoverage.data.InsuredDAO;
import com.skilldistillery.kingdomcoverage.entities.Insured;

@Transactional
@Controller
public class UserController {
	@Autowired
	InsuredDAO idao;
	@Autowired
	InsurancePlanDAO ipdao;

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
	public ModelAndView createdUser(Insured insured) {
		ModelAndView mv = new ModelAndView();
		idao.create(insured);
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		Insured insured = idao.show(id);
		mv.addObject("insured", insured);
		
		session.setAttribute("insuredSession", insured);
		mv.setViewName("insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public ModelAndView update(HttpSession session) {
		session.getAttribute("insuredSession");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateInsured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "submitRequest.do", method = RequestMethod.POST)
	public ModelAndView submitRequest(HttpSession session, int id, Insured insured) {
		ModelAndView mv = new ModelAndView();
		session.getAttribute("insuredSession");
		Insured updated = idao.update(id, insured);
		
		session.setAttribute("insuredSession", updated);
		
		String updateMessage = "Request successfully submitted";
		mv.addObject("updateMessage", updateMessage);
		mv.setViewName("insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "deactivate.do", method = RequestMethod.POST)
	public ModelAndView deactivate(HttpSession session, Insured insured, int id) {
		session.getAttribute("insuredSession");
		ipdao.deactivate(id);

		insured = idao.update(insured.getId(), insured);
		
		session.setAttribute("insuredSession", insured);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		
		return mv;
	}
}
