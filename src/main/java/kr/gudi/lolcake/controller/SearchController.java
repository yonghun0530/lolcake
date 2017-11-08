package kr.gudi.lolcake.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.lolcake.service.RankingServiceInterface;
import kr.gudi.lolcake.service.SearchServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class SearchController {
	
	@Autowired
	SearchServiceInterface ssi;
	
//	@RequestMapping(value = "/userD", method = RequestMethod.GET)
//	   public ModelAndView userD(ModelAndView mav){
//	      mav.setViewName("userD2");
//	      return mav;
//	   }
	   
	   @RequestMapping(value = "/searchData", method = RequestMethod.POST)
	   public void readData(HttpServletRequest req, HttpServletResponse resp){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("nickname", req.getParameter("nickname"));
	      System.out.println(param);
	      HttpUtil.sendResponceToJson(resp, ssi.search(param));
	   }
	   
	   @RequestMapping(value = "/searchView", method = RequestMethod.POST)
	   public String searchView(HttpServletRequest req, ModelAndView mav){
	      HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	      String viewName = "redirect:ranking";
	      HashMap<String, Object> map = ssi.search(param);
	      
	      if(Integer.parseInt(map.get("status").toString()) == 1){
	    	  viewName += "#R-" + map.get("id");
	      }
	      
	      return viewName;
	   }
}
