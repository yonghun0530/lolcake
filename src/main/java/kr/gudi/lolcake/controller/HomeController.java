package kr.gudi.lolcake.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.lolcake.service.HomeServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/JSON", method = RequestMethod.GET)
	public void home(HttpServletRequest req, HttpServletResponse resp) {
		// 파라메터 값 받아서 map으로 변경하기.
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		// 결과값을 JSON으로 출력하기.
		HttpUtil.sendResponceToJson(resp, param);
	}
	@Autowired
	   HomeServiceInterface hsi;
	   
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	     public ModelAndView bbsall(ModelAndView mav){
	        mav.setViewName("home");
	        return mav;
	     }
	     @RequestMapping("/homeifdata")
	      public ModelAndView IFData(ModelAndView mav, HttpServletRequest req){
	         HashMap<String, Object> param = new HashMap<String, Object>();
	         param.put("no", Integer.parseInt(req.getParameter("no")));
	         
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(hsi.homeif(param)));
	         mav.addObject("message", jsonObject.toString());
	         
	         mav.setViewName("json");
	         return mav;
	     }
	     @RequestMapping("/homemvdata")
	      public ModelAndView MVData(ModelAndView mav, HttpServletRequest req){
	         HashMap<String, Object> param = new HashMap<String, Object>();
	         param.put("no", Integer.parseInt(req.getParameter("no")));
	         
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(hsi.homemv(param)));
	         mav.addObject("message", jsonObject.toString());
	         
	         mav.setViewName("json");
	         return mav;
	     }
}

