package com.skilldistillery.mvckingdomdcoverage.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Transactional
@Controller
public class TestController {
     @RequestMapping(path = "index.do", method = RequestMethod.GET)
     public ModelAndView index() {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("index.jsp");

       return mv;
     }

}