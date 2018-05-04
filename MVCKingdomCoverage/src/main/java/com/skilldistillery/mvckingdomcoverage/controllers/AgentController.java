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
import com.skilldistillery.kingdomcoverage.entities.Occupation;
import com.skilldistillery.kingdomcoverage.entities.Species;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;
import com.skilldistillery.mvckingdomcoverage.data.CoverageTypeDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsuredDAO;
import com.skilldistillery.mvckingdomcoverage.data.MessageDAO;
import com.skilldistillery.mvckingdomcoverage.data.OccupationDAO;
import com.skilldistillery.mvckingdomcoverage.data.SpeciesDAO;

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
	
	@Autowired
	OccupationDAO odao;

	@Autowired
	SpeciesDAO sdao;
	
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
		agent.setClients(adao.getClients(agent.getId()));
		agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		
		Insured insured = idao.show(agent.getClients().get(0).getId());
		insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
		List<Insured> clients = adao.getClients(agent.getId());

		session.setAttribute("agentSession", agent);
		
		Message inbox = adao.getNewestInboxMessagesByAgentId(agent.getId());
		Message sent = adao.getNewestSentMessagesByAgentId(agent.getId()); 
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.addObject("clients", clients);
		mv.addObject("agent", agent);
		mv.setViewName("views/agent.jsp");

		return mv;
	}
	
	@RequestMapping(path="agent.do", method=RequestMethod.GET)
	public ModelAndView agentHome(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Agent agent = (Agent)session.getAttribute("agentSession");
		
		agent.setClients(adao.getClients(agent.getId()));
		agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		
		Insured insured = idao.show(agent.getClients().get(0).getId());
		insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
		List<Insured> clients = adao.getClients(agent.getId());

		session.setAttribute("agentSession", agent);
		
		Message inbox = adao.getNewestInboxMessagesByAgentId(agent.getId());
		Message sent = adao.getNewestSentMessagesByAgentId(agent.getId()); 
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.addObject("clients", clients);
		mv.addObject("agent", agent);
		mv.setViewName("views/agent.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "logoutAgent.do", method = RequestMethod.GET)
	public ModelAndView logoutAgent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		List<CoverageType> coverages = ctdao.getAllTypes();
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		mv.addObject("coveragesList", coverages);
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
		

		Message inbox = adao.getNewestInboxMessagesByAgentId(agent.getId());
		Message sent = adao.getNewestSentMessagesByAgentId(agent.getId());  
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "The coverage has been removed!");
		mv.setViewName("views/agent.jsp");
		
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
		List<Insured> clients = adao.getClients(agent.getId());
		
		String fullMessage = "Hey, " + insured.getfName() + "! Agent "+ agent.getfName() +
				" has approved your request for " + coverage.getName() + " coverage.";
		Message message = new Message();
		
		message.setSenderString("n");
		message.setSenderChar('n');
		message.setMessageBody(fullMessage);
		message.setInsured(insured);
		message.setAgent(agent);
		agent.addMessageToMessages(message);
		agent.setClients(clients);
		mdao.create(message);
		mdao.persistSender(message);
		
		
		ipdao.addCoverageTypeById(insured.getPlans().get(0).getId(), coverage.getId());

		Message inbox = adao.getNewestInboxMessagesByAgentId(agent.getId());
		Message sent = adao.getNewestSentMessagesByAgentId(agent.getId()); 
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.setViewName("views/agent.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "The coverage has been added!");
		
		return mv;
	}
	
	@RequestMapping(path = "composedMessage.do", method = RequestMethod.POST)
	public ModelAndView sendComposedMessage(HttpSession session, @RequestParam("messageBody") String messageBody,
			@RequestParam("client") int insuredId) {
		ModelAndView mv = new ModelAndView();
		
		Insured insured = idao.show(insuredId);
		
		Agent agent = (Agent) session.getAttribute("agentSession");
		List<Insured> clients = adao.getClients(agent.getId());
		Message message = new Message();
		
		message.setSenderString("n");
		message.setSenderChar('n');
		message.setMessageBody(messageBody);
		message.setInsured(insured);
		message.setAgent(agent);
		agent.addMessageToMessages(message);
		agent.setClients(clients);
		mdao.create(message);
		mdao.persistSender(message);
		
		

		Message inbox = adao.getNewestInboxMessagesByAgentId(agent.getId());
		Message sent = adao.getNewestSentMessagesByAgentId(agent.getId()); 
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.addObject("clients", clients);
		mv.setViewName("views/agent.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "Your message has been sent!");
		
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
	
	@RequestMapping(path = "privacy.do", method = RequestMethod.GET)
	public ModelAndView getPrivacy(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/privacy.jsp");
		
		return mv;
	}
	
	@RequestMapping(path = "agentMessages.do", method = RequestMethod.GET)
	public ModelAndView getMessages(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Agent agent = (Agent)session.getAttribute("agentSession");
		List<Message> messages = idao.getMessagesByInsuredId(agent.getId());
		
		List<Insured> clients = adao.getClients(agent.getId());
		
		
		mv.addObject("messages", messages);
		mv.addObject("clients", clients);
		mv.setViewName("views/agentMessages.jsp");
		
		return mv;
	}

}
