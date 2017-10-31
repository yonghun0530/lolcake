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
	   BoardServiceInterface bsi;

	 /* @RequestMapping(value = "/bbshot", method = RequestMethod.GET)
	  public ModelAndView bbshot(ModelAndView mav){
		  mav.setViewName("comm");
		  return mav;
	  }
	  
	  @RequestMapping(value = "/bbshotData", method = RequestMethod.POST)
	  public void bbshot(HttpServletResponse response){
		  HttpUtil.sendResponceToJson(response, bsi.bbshot());
	  }
	   
	  @RequestMapping("/totCntData")
	  public void totCntData(HttpServletResponse response){
	      HttpUtil.sendResponceToJson(response, bsi.TotCnt());
	  }
	   */
	  
	  @RequestMapping(value = "/bbsall", method = RequestMethod.GET)
	  public ModelAndView bbsall(ModelAndView mav){
		  mav.setViewName("comm");
		  return mav;
	  }
	  @RequestMapping("/allData")
	   public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("start", Integer.parseInt(req.getParameter("start")));
	      param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
	      param.put("type", req.getParameter("type"));
	      //type 추가 추가 추가
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.all(param)));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
//	      return HttpUtil.makeHashToJsonModelAndView(bsi.totCntif(param));
	  }
}
