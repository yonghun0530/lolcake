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

import kr.gudi.lolcake.service.BoardServiceInterface;
import kr.gudi.lolcake.service.ChampServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class ChampController {
	
	  @Autowired
	   ChampServiceInterface csi;
  
	  @RequestMapping(value = "/champ", method = RequestMethod.GET)
	  public ModelAndView champ(ModelAndView mav){
		  mav.setViewName("champ");
		  return mav;
	  }
	  @RequestMapping(value = "/champD", method = RequestMethod.GET)
	  public ModelAndView champD(ModelAndView mav){
		  mav.setViewName("champD");
		  return mav;
	  }
	  /*@RequestMapping("/champData")
	   public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("no", Integer.parseInt(req.getParameter("no")));
	      map.put("champname", req.getParameter("champname"));
	      map.put("path", req.getParameter("path"));
	      map.put("img", req.getParameter("img"));
	      System.out.println(req.getParameter("champname"));
	      //type 추가 추가
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(csi.champ()));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
//	      return HttpUtil.makeHashToJsonModelAndView(bsi.totCntif(param));
	  }*/
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
