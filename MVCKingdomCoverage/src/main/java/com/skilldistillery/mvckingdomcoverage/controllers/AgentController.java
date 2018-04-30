package com.skilldistillery.mvckingdomcoverage.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;

@Transactional
@Controller
public class AgentController {
	@Autowired
	AgentDAO adao;

	@RequestMapping(path= "loginAgent.do", method = RequestMethod.GET)
	public ModelAndView loginAgent(HttpSession session, @RequestParam("name") String name, @RequestParam("password") String password){
		ModelAndView mv = new ModelAndView();
		
		Agent agent = adao.show(adao.getUserIdByNameAndPass(name, password));
		agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		
		mv.addObject("agent", agent);
		mv.setViewName("views/agent.jsp");
		
		session.setAttribute("agentSession", agent);
		
		return mv;
	}

	@RequestMapping(path = "getClient.do", method = RequestMethod.GET)
	public ModelAndView getClient(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		List<Insured> clients = adao.getClients(id);
		mv.addObject("listOfInsured", clients);

		mv.setViewName("views/insuredInfo.jsp");
		return mv;
	}

	@RequestMapping(path = "approved.do", method = RequestMethod.POST)
	public ModelAndView approbed(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/agent.jsp");

		return mv;
	}

	@RequestMapping(path = "declined.do", method = RequestMethod.POST)
	public ModelAndView declined() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/agent.jsp");

		return mv;
	}

}
