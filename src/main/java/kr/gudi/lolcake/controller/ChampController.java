package kr.gudi.lolcake.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.lolcake.service.ChampServiceInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class ChampController {
	
	  @Autowired
	   ChampServiceInterface csi;
  
	  @RequestMapping(value = "/champ", method = RequestMethod.GET)
	  public ModelAndView champ(ModelAndView mav){
		  mav.setViewName("champ");
		  return mav;
	  }
	  @RequestMapping(value = "/champData", method = RequestMethod.POST)
      public void readData(HttpServletRequest req, HttpServletResponse resp){
         HttpUtil.sendResponceToJson(resp, csi.champ());
     }
	  @RequestMapping(value = "/champDetailData", method = RequestMethod.POST)
      public void readDetailData(HttpServletRequest req, HttpServletResponse resp){
		 HashMap<String, Object> param = HttpUtil.getParameterMap(req);
         HttpUtil.sendResponceToJson(resp, csi.champDetail(param));
     }
}
