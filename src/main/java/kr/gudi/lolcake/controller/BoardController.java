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
	  
	  @RequestMapping("/bbsif")
	    public ModelAndView bbsif(ModelAndView mav){
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tsi.selectbbsif();
	      mav.addObject("list", list);
	      mav.setViewName("commif");
	      return mav;
	    }
	  
	  @RequestMapping("/bbsmd")
	    public ModelAndView bbsmd(ModelAndView mav){
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tsi.selectbbsmd();
	      mav.addObject("list", list);
	      mav.setViewName("commmd");
	      return mav;
	    }
	  
	  @RequestMapping("/bbsfr")
	    public ModelAndView bbsfr(ModelAndView mav){
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tsi.selectbbsfr();
	      mav.addObject("list", list);
	      mav.setViewName("commfr");
	      return mav;
	    }
	  
	  @RequestMapping("/bbshot")
	    public ModelAndView bbshot(ModelAndView mav){
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tsi.selectbbshot();
	      mav.addObject("list", list);
	      mav.setViewName("commhot");
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
