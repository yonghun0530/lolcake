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
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class BoardController {
	
	  @Autowired
	   BoardServiceInterface bsi;
	  
	  @RequestMapping(value = "/comm", method = RequestMethod.GET)
	  public ModelAndView bbsall(ModelAndView mav){
		  mav.setViewName("comm");
		  return mav;
	  }
	  @RequestMapping("/allData")
	   public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
	      HashMap<String, Object> param = new HashMap<String, Object>();
	      param.put("s"
	      		+ "tart", Integer.parseInt(req.getParameter("start")));
	      param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
	      param.put("type", req.getParameter("type"));
	      //type 추가 추가
	      
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.all(param)));
	      mav.addObject("message", jsonObject.toString());
			
	      mav.setViewName("json");
	      return mav;
	  }
	  
	  /*************************게시글쓰기************************************/
	     @RequestMapping("/writeData")
	      public ModelAndView bbsData(ModelAndView mav, HttpServletRequest req, HttpSession session){
	         HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	         
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.bbsWrite(param)));
	         mav.addObject("message", jsonObject.toString());
	         
	         mav.setViewName("json");
	         return mav;
	     }
	     /********************************게시글 수정***************************************/
	     @RequestMapping("/editData")
	      public ModelAndView editData(ModelAndView mav, HttpServletRequest req, HttpSession session){
	         HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.bbsEdit(param)));
	         mav.addObject("message", jsonObject.toString());
	         mav.setViewName("json");
	         return mav;
	     }
	     /***************************게시판상세보기 ******************************/
	     @RequestMapping("/bbsData")
	      public ModelAndView bbsData(ModelAndView mav, HttpServletRequest req){
	         HashMap<String, Object> param = new HashMap<String, Object>();
	         param.put("no", Integer.parseInt(req.getParameter("no")));
	         
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.bbsD(param)));
	         mav.addObject("message", jsonObject.toString());
	         
	         mav.setViewName("json");
	         return mav;
	     }
	     /***************************채영이 삭제인듯 **************************/
	     @RequestMapping("/Delete")
		   public ModelAndView delete(ModelAndView mav, HttpServletRequest req){
		      HashMap<String, Object> param = new HashMap<String, Object>();
		      param.put("no", Integer.parseInt(req.getParameter("no")));
		      
		      JSONObject jsonObject = new JSONObject();
		      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.delete(param)));
		      mav.addObject("message", jsonObject.toString());
				
		      mav.setViewName("json");
		      return mav;
		  }
}
