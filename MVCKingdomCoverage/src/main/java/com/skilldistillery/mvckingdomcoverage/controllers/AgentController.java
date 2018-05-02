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
import com.skilldistillery.kingdomcoverage.entities.Message;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;
import com.skilldistillery.mvckingdomcoverage.data.CoverageTypeDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsuredDAO;
import com.skilldistillery.mvckingdomcoverage.data.MessageDAO;

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
	
	@Autowired
	MessageDAO mdao;
	
	@RequestMapping(path="loginAgentPage.do", method = RequestMethod.GET)
	public ModelAndView loginAgentPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("views/agentLogin.jsp");
		
		return mv;
	}
	
	@RequestMapping(path= "loginAgent.do", method = RequestMethod.POST)
	public ModelAndView loginAgent(HttpSession session, @RequestParam("name") String name, @RequestParam("password") String password){
		ModelAndView mv = new ModelAndView();
		
		Agent agent = adao.show(adao.getUserIdByNameAndPass(name, password));
		System.out.println("********" + agent);
		agent.setClients(adao.getClients(agent.getId()));
		agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		
		Insured insured = idao.show(agent.getClients().get(0).getId());
		insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));

		session.setAttribute("agentSession", agent);
		
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		mv.addObject("messages", messages);
		mv.addObject("agent", agent);
		mv.setViewName("views/agent.jsp");

		return mv;
	}
	
	@RequestMapping(path = "logoutAgent.do", method = RequestMethod.GET)
	public ModelAndView logoutAgent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		session.removeAttribute("agentSession");
		
		mv.setViewName("views/index.jsp");
		
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
		mv.addObject("agent", insured.getAgents().get(0));
		mv.addObject("coverages", insured.getPlans().get(0).getCoverages());
		mv.addObject("allCoverages", ctdao.getAllTypes());
		
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
			ipdao.deleteCoverageTypeById(insured.getPlans().get(0).getId(), coverageId);
		}
		
		mv.setViewName("views/agent.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "The coverage has been removed!");
		
		return mv;
	}
	
	@RequestMapping(path= "addPolicies.do", method = RequestMethod.POST)
	public ModelAndView postAddedPolicies(HttpSession session, 
			@RequestParam("coverage") String coverageString,
			@RequestParam("iid") int id) {
		
		CoverageType coverage = ctdao.getTypeByName(coverageString);
		Agent agent= (Agent) session.getAttribute("agentSession");
		ModelAndView mv = new ModelAndView();
		Insured insured = idao.show(id);
		
		String fullMessage = "Hey, " + insured.getfName() + "! Agent "+ agent.getfName() +
				" has approved your request for " + coverage.getName() + " coverage.";
		Message message = new Message();
		
		message.setSenderString("n");
		message.setSenderChar('n');
		message.setMessageBody(fullMessage);
		message.setInsured(insured);
		message.setAgent(agent);
		agent.addMessageToMessages(message);
		mdao.create(message);
		mdao.persistSender(message);
		
		
		ipdao.addCoverageTypeById(insured.getPlans().get(0).getId(), coverage.getId());
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		mv.addObject("messages", messages);
		mv.setViewName("views/agent.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "The coverage has been added!");
		
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
	
	@RequestMapping(path = "faq.do", method = RequestMethod.GET)
	public ModelAndView getFAQ(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/faq.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public ModelAndView getAbout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/about.jsp");
		
		return mv;
	}

}
