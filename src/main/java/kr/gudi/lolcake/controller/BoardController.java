package kr.gudi.lolcake.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.lolcake.service.BoardServiceInterface;

@Controller
public class BoardController {
	
	  @Autowired
	   BoardServiceInterface tsi;
	  
	  @RequestMapping("/boardlist")
	    public ModelAndView boardlist(ModelAndView mav){
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tsi.select();
	      mav.addObject("list", list);
	      mav.setViewName("comm");
	      return mav;
	    }
	   
	   @RequestMapping("/myqnaData")
	   public ModelAndView myqnaData(ModelAndView mav){
	      mav.setViewName("myqna");
	      return mav;
	   }
	/*@RequestMapping("/boardlist")
	public String board(){
		return "communityList";*/
	}
