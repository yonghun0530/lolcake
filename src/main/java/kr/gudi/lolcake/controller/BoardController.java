package kr.gudi.lolcake.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

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
	  
	  @RequestMapping(value = "/bbshot", method = RequestMethod.GET)
	  public ModelAndView bbshot(ModelAndView mav){
		  mav.setViewName("commhot");
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
	      return HttpUtil.makeHashToJsonModelAndView(tsi.select(param));
	  }
}
