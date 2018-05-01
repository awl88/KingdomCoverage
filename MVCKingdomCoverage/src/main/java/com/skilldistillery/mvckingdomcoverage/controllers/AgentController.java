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
import com.skilldistillery.kingdomcoverage.entities.CoverageType;
import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;
import com.skilldistillery.mvckingdomcoverage.data.CoverageTypeDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsuredDAO;

@Transactional
@Controller
public class AgentController {
	
	@Autowired
	AgentDAO adao;

	@Autowired
	InsuredDAO idao;
	
	@Autowired
	InsurancePlanDAO ipdao;
	
	@Autowired
	CoverageTypeDAO ctdao;
	
	@RequestMapping(path= "loginAgent.do", method = RequestMethod.POST)
	public ModelAndView loginAgent(HttpSession session, @RequestParam("name") String name, @RequestParam("password") String password){
		ModelAndView mv = new ModelAndView();
		
		Agent agent = adao.show(adao.getUserIdByNameAndPass(name, password));
		agent.setClients(adao.getClients(agent.getId()));
		agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		
		Insured insured = idao.show(agent.getClients().get(0).getId());
		insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
		
		mv.addObject("agent", agent);
		mv.setViewName("views/agent.jsp");
		
		session.setAttribute("agentSession", agent);
		
		return mv;
	}

	@RequestMapping(path = "getClient.do", method = RequestMethod.GET)
	public ModelAndView getClient(HttpSession session, @RequestParam("id") int id) {
		session.getAttribute("agentSession");
		ModelAndView mv = new ModelAndView();
		Insured insured = adao.getClientById(id);
		
		insured.setAgents(idao.getAgentsByInsuredId(id));
		insured.setPlans(idao.listPlans(id));
		List<InsurancePlan> plans = insured.getPlans();
		insured.setMessages(idao.getMessagesByInsuredId(id));
		for (InsurancePlan plan : plans) {
			plan.setCoverages(idao.getCoveragesByInsuredId(id));
		}
		
		
		mv.addObject("insured", insured);
		mv.addObject("coverages", insured.getPlans().get(0).getCoverages());
		
		mv.setViewName("views/insuredInfo.jsp");
		return mv;
	}
	
	@RequestMapping(path= "clientChanges.do", method = RequestMethod.POST)
	public ModelAndView postClientChanges(HttpSession session, 
				@RequestParam("plan") List<Integer> coverageIds,
				@RequestParam("iid") int id) {
		
		Agent agent= (Agent) session.getAttribute("agentSession");
		ModelAndView mv = new ModelAndView();
		Insured insured = idao.show(id);
		
		for (Integer coverageId : coverageIds) {
			ipdao.deleteCoverageTypeBytId(insured.getPlans().get(0).getId(), coverageId);
		}
		
		mv.setViewName("views/agent.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "The insured has been updated!");
		
		return mv;
	}

	@RequestMapping(path = "approved.do", method = RequestMethod.POST)
	public ModelAndView approved(HttpSession session) {
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
