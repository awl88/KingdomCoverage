package com.skilldistillery.mvckingdomdcoverage.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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