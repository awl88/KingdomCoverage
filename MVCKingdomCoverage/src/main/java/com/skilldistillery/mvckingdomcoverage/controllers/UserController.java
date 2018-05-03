package com.skilldistillery.mvckingdomcoverage.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.kingdomcoverage.entities.Address;
import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.CoverageType;
import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.InsuredAddressDTO;
import com.skilldistillery.kingdomcoverage.entities.Message;
import com.skilldistillery.kingdomcoverage.entities.Occupation;
import com.skilldistillery.kingdomcoverage.entities.Species;
import com.skilldistillery.kingdomcoverage.entities.UserInsuredAddressDTO;
import com.skilldistillery.mvckingdomcoverage.data.AgentDAO;
import com.skilldistillery.mvckingdomcoverage.data.CoverageTypeDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsurancePlanDAO;
import com.skilldistillery.mvckingdomcoverage.data.InsuredDAO;
import com.skilldistillery.mvckingdomcoverage.data.MessageDAO;
import com.skilldistillery.mvckingdomcoverage.data.OccupationDAO;
import com.skilldistillery.mvckingdomcoverage.data.QuoteDAO;
import com.skilldistillery.mvckingdomcoverage.data.SpeciesDAO;
import com.skilldistillery.mvckingdomcoverage.data.UserDAO;

@Transactional
@Controller
public class UserController {

	@Autowired
	AgentDAO adao;

	@Autowired
	InsuredDAO idao;

	@Autowired
	UserDAO udao;

	@Autowired
	OccupationDAO odao;

	@Autowired
	SpeciesDAO sdao;

	@Autowired
	CoverageTypeDAO ctdao;

	@Autowired
	MessageDAO mdao;

	@Autowired
	InsurancePlanDAO ipdao;
	
	@Autowired
	QuoteDAO qdao;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("insuredSession");
		session.removeAttribute("agentSession");
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		List<CoverageType> coverages = ctdao.getAllTypes();
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		mv.addObject("coveragesList", coverages);
		mv.setViewName("views/index.jsp");
		return mv;
	}
	
	@RequestMapping(path="getQuote.do", method=RequestMethod.POST)
	public ModelAndView getQuote(@RequestParam("coverageIdForQuote") Integer coverageIdForQuote, @RequestParam("speciesIdForQuote") Integer speciesIdForQuote, @RequestParam("occupationIdForQuote") Integer occupationIdForQuote) {
		ModelAndView mv = new ModelAndView();
		Integer userQuote = qdao.getQuote(coverageIdForQuote, speciesIdForQuote, occupationIdForQuote);
		mv.addObject("userQuote", userQuote);
		mv.setViewName("views/quote.jsp");
		return mv;
	}

	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public ModelAndView createUser() {
		ModelAndView mv = new ModelAndView();
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		mv.setViewName("views/createUser.jsp");
		return mv;
	}

	@RequestMapping(path = "createPlan.do", method = RequestMethod.GET)
	public ModelAndView createPlan(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.getAttribute("insuredSession");
		List<CoverageType> allPlans = ctdao.getAllTypes();
		mv.addObject("allPlans", allPlans);
		mv.setViewName("views/createPlan.jsp");
		return mv;
	}

	@RequestMapping(path = "created.do", method = RequestMethod.POST)
	public ModelAndView createdInsured(UserInsuredAddressDTO dto) {
		ModelAndView mv = new ModelAndView();
		if (udao.getUserByName(dto.getUserName()) == null) {
			idao.createUserAndInsuredAndAddress(dto);
			List<Occupation> jobs = odao.getAllOccupations();
			List<Species> allSpecies = sdao.getAllSpecies();
			List<CoverageType> coverages = ctdao.getAllTypes();
			mv.addObject("jobs", jobs);
			mv.addObject("allSpecies", allSpecies);
			mv.addObject("coveragesList", coverages);
			mv.setViewName("views/index.jsp");
		} else {
			// put in a method to pass the dto object back to the form later, take this out
			// when that is done
			mv.setViewName("views/createUser.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, @RequestParam("name") String name,
			@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		List<CoverageType> coveragesList = ctdao.getAllTypes();
		mv.addObject("coveragesList", coveragesList);
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		Insured insured = new Insured();
		List<String> unsuccessfulLogin = new ArrayList<>();
		int premium = 0;
		if (udao.getUserIdByNameAndPass(name, password) > 5) {
			insured = idao.show(idao.getInsuredIdByUserId(udao.getUserIdByNameAndPass(name, password)));			
		}
		else {
			unsuccessfulLogin.add("Invalid username/password combination. Please try again.");
			mv.addObject("unsuccessfulLogin", unsuccessfulLogin);
			mv.setViewName("views/index.jsp");
			return mv;
		}
		session.setAttribute("insuredSession", insured);
		List<InsurancePlan> plans = idao.listPlans(insured.getId());
		List<CoverageType> coverages = idao.getCoveragesByInsuredId(insured.getId());
		if (plans.size() > 0) {
			for (InsurancePlan insurancePlan : plans) {
				insured.setPlans(idao.listPlans(insured.getId()));
				coverages = idao.getCoveragesByInsuredId(insured.getId());
				insurancePlan.setCoverages(idao.getCoveragesByInsuredId(insured.getId()));
				premium = ipdao.getTotalCostOfPlanAndMultiplier(insured);
			}
		}
		List<Agent> agents = idao.getAgentsByInsuredId(insured.getId());
		if (agents.size() > 0) {
			Agent agent = adao.show(agents.get(0).getId());
			insured.setAgents(idao.getAgentsByInsuredId(insured.getId()));
			insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
			agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		}
		Message inbox = idao.getNewestInboxMessagesByInsuredId(insured.getId());
		Message sent = idao.getNewestSentMessagesByInsuredId(insured.getId()); 
		mv.addObject("inbox", inbox);
		mv.addObject("sent", sent);
		mv.addObject("premium", premium);
		mv.addObject("unsuccessfulLogin", unsuccessfulLogin);
		mv.addObject("agents", agents);
		mv.addObject("plans", plans);
		mv.addObject("insured", insured);
		mv.addObject("coverages", coverages);
		mv.setViewName("views/insured.jsp");
		return mv;
	}
	
	@RequestMapping(path = "logoutInsured.do", method = RequestMethod.GET)
	public ModelAndView logoutAgent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		List<CoverageType> coveragesList = ctdao.getAllTypes();
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		mv.addObject("coveragesList", coveragesList);
		session.removeAttribute("insuredSession");
		mv.setViewName("views/index.jsp");
		return mv;
	}

	@RequestMapping(path = "insuredWithMessage.do", method = RequestMethod.POST)
	public ModelAndView requestNewCoverage(HttpSession session, @RequestParam("message") String messageBody) {
		Insured insured = (Insured) session.getAttribute("insuredSession");
		ipdao.getTotalCostOfPlanAndMultiplier(insured);
		ModelAndView mv = new ModelAndView();
		int premium = 0;
		String fullMessage = "Hey, " + insured.getAgents().get(0).getfName() + "! " + insured.getfName() + " "
				+ insured.getlName() + " would like a new " + messageBody + " plan.";
		Message message = new Message();
		message.setMessageBody(fullMessage);
		message.setSenderString("y");
		message.setSenderChar('y');
		message.setInsured(insured);
		message.setAgent(((Insured) session.getAttribute("insuredSession")).getAgents().get(0));
		mdao.create(message);
		mdao.persistSender(message);
		((Insured) session.getAttribute("insuredSession")).getAgents().get(0).addMessageToMessages(message);
		mdao.create(message);
		List<InsurancePlan> plans = idao.listPlans(insured.getId());
		List<CoverageType> coverages = idao.getCoveragesByInsuredId(insured.getId());
		if (plans.size() > 0) {
			for (InsurancePlan insurancePlan : plans) {
				insured.setPlans(idao.listPlans(insured.getId()));
				coverages = idao.getCoveragesByInsuredId(insured.getId());
				insurancePlan.setCoverages(idao.getCoveragesByInsuredId(insured.getId()));
				premium = ipdao.getTotalCostOfPlanAndMultiplier(insured);
			}
		}
		List<Agent> agents = idao.getAgentsByInsuredId(insured.getId());
		if (agents.size() > 0) {
			Agent agent = adao.show(agents.get(0).getId());
			insured.setAgents(idao.getAgentsByInsuredId(insured.getId()));
			insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
			agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		}
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		mv.addObject("messages", messages);
		mv.addObject("premium", premium);
		mv.addObject("agents", agents);
		mv.addObject("plans", plans);
		mv.addObject("insured", insured);
		mv.addObject("coverages", coverages);
		mv.setViewName("views/insured.jsp");
		mv.addObject("insured", session.getAttribute("insuredSession"));
		mv.addObject("updateMessage", "Your request has been submitted!");
		return mv;
	}
	
	@RequestMapping(path = "composedMessageFromInsured.do", method = RequestMethod.POST)
	public ModelAndView sendComposedMessage(HttpSession session, @RequestParam("messageBody") String messageBody) {
		ModelAndView mv = new ModelAndView();
		
		Insured insured = (Insured) session.getAttribute("insuredSession");
		Message message = new Message();
		
		message.setSenderString("y");
		message.setSenderChar('y');
		message.setMessageBody(messageBody);
		message.setInsured(insured);
		message.setAgent(insured.getAgents().get(0));
		insured.addMessageToMessages(message);
		mdao.create(message);
		mdao.persistSender(message);
		
		int premium = ipdao.getTotalCostOfPlanAndMultiplier(insured);
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		List<InsurancePlan> plans = idao.listPlans(insured.getId());
		List<CoverageType> coverages = idao.getCoveragesByInsuredId(insured.getId());
		
		mv.addObject("messages", messages);
		mv.addObject("premium", premium);
		mv.addObject("plans", plans);
		mv.addObject("insured", insured);
		mv.addObject("coverages", coverages);
		mv.setViewName("views/insured.jsp");
		mv.addObject("agent", session.getAttribute("agentSession"));
		mv.addObject("updateMessage", "Your message has been sent!");
		
		return mv;
	}


	@RequestMapping(path = "updateInsured.do", method = RequestMethod.GET)
	public ModelAndView updateInsured(HttpSession session) {
		Insured insured = (Insured) session.getAttribute("insuredSession");
		ModelAndView mv = new ModelAndView();
		Address address = insured.getAddress();
		List<Species> allSpecies = sdao.getAllSpecies();
		mv.addObject("allSpecies", allSpecies);
		List<Occupation> jobs = odao.getAllOccupations();
		mv.addObject("address", address);
		mv.addObject("jobs", jobs);
		mv.addObject("insured", insured);
		mv.setViewName("views/updateInsured.jsp");		
		return mv;
	}

	@RequestMapping(path = "insuredUpdated.do", method = RequestMethod.POST)
	public ModelAndView submitRequest(HttpSession session, InsuredAddressDTO dto) {
		ModelAndView mv = new ModelAndView();
		int premium = 0;
		Insured insured = (Insured) session.getAttribute("insuredSession");
		session.setAttribute("insuredSession", insured);		
		Address address = idao.getAddressByInsuredId(insured.getId());
		insured.setAddress(address);
		List<InsurancePlan> plans = idao.listPlans(insured.getId());
		List<CoverageType> coverages = idao.getCoveragesByInsuredId(insured.getId());
		if (plans.size() > 0) {
			for (InsurancePlan insurancePlan : plans) {
				Integer costOfPlan = ipdao.getTotalCostOfPlanAndMultiplier(insured);
				insurancePlan.setTotalCostOfPlan(costOfPlan);
				insured.setPlans(idao.listPlans(insured.getId()));
				premium = ipdao.getTotalCostOfPlanAndMultiplier(insured);
			}
		}
		List<Agent> agents = idao.getAgentsByInsuredId(insured.getId());
		if (agents.size() > 0) {
			Agent agent = adao.show(agents.get(0).getId());
			insured.setAgents(idao.getAgentsByInsuredId(insured.getId()));
			insured.setMessages(idao.getMessagesByInsuredId(insured.getId()));
			agent.setMessages(adao.getMessagesByAgentId(agent.getId()));
		}
		insured = idao.updateInsured(dto, address, insured);
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		String updateMessage = "Profile successfully updated";
		mv.addObject("updateMessage", updateMessage);
		mv.addObject("messages", messages);
		mv.addObject("premium", premium);
		mv.addObject("agents", agents);
		mv.addObject("plans", plans);
		mv.addObject("insured", insured);
		mv.addObject("coverages", coverages);
		mv.setViewName("views/insured.jsp");
		return mv;
	}

	@RequestMapping(path = "deactivate.do", method = RequestMethod.POST)
	public ModelAndView deactivate(HttpSession session, Insured insured, int id) {
		ModelAndView mv = new ModelAndView();
		List<Occupation> jobs = odao.getAllOccupations();
		List<Species> allSpecies = sdao.getAllSpecies();
		List<CoverageType> coveragesList = ctdao.getAllTypes();
		mv.addObject("jobs", jobs);
		mv.addObject("allSpecies", allSpecies);
		mv.addObject("coveragesList", coveragesList);
		session.getAttribute("insuredSession");
		ipdao.deactivate(id);
		insured = idao.update(insured.getId(), insured);
		session.setAttribute("insuredSession", insured);
		mv.setViewName("views/index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "messages.do", method = RequestMethod.GET)
	public ModelAndView getMessages(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Insured insured = (Insured)session.getAttribute("insuredSession");
		List<Message> messages = idao.getMessagesByInsuredId(insured.getId());
		
		mv.addObject("messages", messages);
		mv.setViewName("views/messages.jsp");
		
		return mv;
	}
}
