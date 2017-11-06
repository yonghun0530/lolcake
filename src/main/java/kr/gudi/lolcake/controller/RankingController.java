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
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class RankingController {
	
	@Autowired
	RankingServiceInterface rsi;
	
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public ModelAndView ranking(ModelAndView mav){
		mav.setViewName("ranking");
		return mav;
	}
	
	@RequestMapping(value = "/rankingData", method = RequestMethod.POST)
	 public ModelAndView readData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		 HashMap<String, Object> param = new HashMap<String, Object>();
	     param.put("start", Integer.parseInt(req.getParameter("start")));
	     param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
         
         JSONObject jsonObject = new JSONObject();
         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(rsi.ranking(param)));
         mav.addObject("message", jsonObject.toString());
         
         mav.setViewName("json");
         return mav;
     }
}
