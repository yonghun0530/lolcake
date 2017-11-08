package kr.gudi.lolcake.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.lolcake.service.RankingServiceInterface;
import kr.gudi.util.HttpUtil;

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
      public void readData(HttpServletRequest req, HttpServletResponse resp){
         HttpUtil.sendResponceToJson(resp, rsi.ranking());
     }
}
