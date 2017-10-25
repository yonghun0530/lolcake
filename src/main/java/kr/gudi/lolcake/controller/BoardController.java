package kr.gudi.lolcake.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.lolcake.service.BoardServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class BoardController {
	
	  @Autowired
	   BoardServiceInterface tsi;
	  
	  @RequestMapping(value = "/bbsif", method = RequestMethod.GET)
	    public ModelAndView bbsif(ModelAndView mav){
		  mav.setViewName("commif");
		  return mav;
	    }
	  @RequestMapping(value = "/bbsfr", method = RequestMethod.GET)
	    public ModelAndView bbsfr(ModelAndView mav){
		  mav.setViewName("commfr");
		  return mav;
	    }
	  @RequestMapping(value = "/bbsmd", method = RequestMethod.GET)
	    public ModelAndView bbsmd(ModelAndView mav){
		  mav.setViewName("commmd");
		  return mav;
	    }
	  
	  @RequestMapping(value = "/bbsifData", method = RequestMethod.POST)
	  public void bbsif(HttpServletResponse response){
		  HttpUtil.sendResponceToJson(response, tsi.selectbbsif());
	  }
	  
	  @RequestMapping(value = "/bbsfrData", method = RequestMethod.POST)
	  public void bbsfr(HttpServletResponse response){
		  HttpUtil.sendResponceToJson(response, tsi.selectbbsfr());
	  }
	  @RequestMapping(value = "/bbsmdData", method = RequestMethod.POST)
	  public void bbsmd(HttpServletResponse response){
		  HttpUtil.sendResponceToJson(response, tsi.selectbbsmd());
	  }
	  
	  @RequestMapping(value = "/bbshot", method = RequestMethod.GET)
	  public ModelAndView bbshot(ModelAndView mav){
		  mav.setViewName("comm");
		  return mav;
	  }
	  
	  @RequestMapping(value = "/bbshotData", method = RequestMethod.POST)
	  public void bbshot(HttpServletResponse response){
		  HttpUtil.sendResponceToJson(response, tsi.selectbbshot());
	  }
	   
	  @RequestMapping("/totCntData")
	  public void totCntData(HttpServletResponse response){
	      HttpUtil.sendResponceToJson(response, tsi.selectTotCnt());
	  }
	   
	  @RequestMapping("/listData")
	   public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("start", Integer.parseInt(req.getParameter("start")));
	      param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.select(param)));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
//	      return HttpUtil.makeHashToJsonModelAndView(tsi.totCntif(param));
	  }
	  @RequestMapping("/listDatafr")
	   public ModelAndView listDatafr(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("start", Integer.parseInt(req.getParameter("start")));
	      param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectfr(param)));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
//	      return HttpUtil.makeHashToJsonModelAndView(tsi.totCntif(param));
	  }
	  @RequestMapping("/listDatamd")
	   public ModelAndView listDatamd(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("start", Integer.parseInt(req.getParameter("start")));
	      param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectmd(param)));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
//	      return HttpUtil.makeHashToJsonModelAndView(tsi.totCntif(param));
	  }
}
