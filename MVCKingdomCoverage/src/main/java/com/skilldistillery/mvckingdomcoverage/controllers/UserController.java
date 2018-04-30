package com.skilldistillery.mvckingdomcoverage.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.User;
import com.skilldistillery.mvckingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsuredDAO;
import com.skilldistillery.mvckingdomcoverage.data.UserDAO;

@Transactional
@Controller
public class UserController {
	
	@Autowired
	InsuredDAO idao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	InsurancePlanDAO ipdao;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/index.jsp");

		return mv;
	}
	
	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public ModelAndView createUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/createUser.jsp");
		return mv;
	}
	
	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUser(User user) {
		ModelAndView mv = new ModelAndView();
		udao.create(user);
		mv.addObject("user", user);
		mv.setViewName("views/createInsured.jsp");
		return mv;
	}
	
	@RequestMapping(path = "created.do", method = RequestMethod.POST)
	public ModelAndView createdInsured(Insured insured) {
		ModelAndView mv = new ModelAndView();
		idao.create(insured);
		mv.setViewName("views/index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session, @RequestParam("name") String name, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		
		Insured insured = idao.show(idao.getInsuredIdByUserId(udao.getUserIdByNameAndPass(name, password)));
		
		mv.addObject("insured", insured);
		mv.setViewName("views/insured.jsp");
		
		session.setAttribute("insuredSession", insured);
		
		return mv;
	}
	
	@RequestMapping(path = "updateInsured.do", method = RequestMethod.GET)
	public ModelAndView update(HttpSession session) {
		session.getAttribute("insuredSession");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/updateInsured.jsp");
		
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
		mv.setViewName("views/insured.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "deactivate.do", method = RequestMethod.POST)
	public ModelAndView deactivate(HttpSession session, Insured insured, int id) {
		session.getAttribute("insuredSession");
		ipdao.deactivate(id);

		insured = idao.update(insured.getId(), insured);
		
		session.setAttribute("insuredSession", insured);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/index.jsp");
		
		return mv;
	}
}
