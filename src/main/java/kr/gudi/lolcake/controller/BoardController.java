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
	      HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	      System.out.println(param);
	      return HttpUtil.makeHashToJsonModelAndView(bsi.all(param));
	  }
	  
	  /*************************게시글쓰기************************************/
	     @RequestMapping("/writeData")
	      public ModelAndView bbswrite(ModelAndView mav, HttpServletRequest req){
	         HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	         
	         JSONObject jsonObject = new JSONObject();
	         jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.bbsWrite(param)));
	         mav.addObject("message", jsonObject.toString());
	         
	         mav.setViewName("json");
	         return mav;
	     }
	     /********************************게시글 수정***************************************/
	     @RequestMapping("/editData")
	      public ModelAndView editData(ModelAndView mav, HttpServletRequest req){
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
	     /***************************게시물 삭제 **************************/
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
	     /***************************게시물 추천 **************************/
		  @RequestMapping(value = "/like", method = RequestMethod.POST)
	      public ModelAndView like(ModelAndView mav, HttpServletRequest req, HttpServletResponse resp){
			 HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	         return HttpUtil.makeHashToJsonModelAndView(bsi.bbslike(param));
	     }
	     /***************************게시물 방문 **************************/
		  @RequestMapping(value = "/hit", method = RequestMethod.POST)
	      public ModelAndView hit(ModelAndView mav, HttpServletRequest req, HttpServletResponse resp){
			 HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	         return HttpUtil.makeHashToJsonModelAndView(bsi.bbshit(param));
	     }
		  
		  
		  /*댓글보기*/
			@RequestMapping("/replyD")
			public ModelAndView Reply(ModelAndView mav, HttpServletRequest req) {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("boardno", Integer.parseInt(req.getParameter("boardno")));
				
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.Reply(param)));
				mav.addObject("message", jsonObject.toString());
				
				mav.setViewName("json");
				return mav;
			}
			/*댓글쓰기*/
			@RequestMapping("/replyWrite")
			public ModelAndView reWrite(ModelAndView mav, HttpServletRequest req) {
				HashMap<String, Object> param = HttpUtil.getParameterMap(req);
				
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.reWrite(param)));
				mav.addObject("message", jsonObject.toString());

				mav.setViewName("json");
				return mav;
			}
			
			
			/*댓글수정*/
			@RequestMapping("/reEdit")
			public ModelAndView reEdit(ModelAndView mav, HttpServletRequest req) {
				HashMap<String, Object> param = HttpUtil.getParameterMap(req);
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.reEdit(param)));
				mav.addObject("message", jsonObject.toString());
				mav.setViewName("json");
				return mav;
			}
			
			/********************************
			 * 댓글 삭제
			 ***************************************/
			@RequestMapping("/reRemove")
			public ModelAndView reRemove(ModelAndView mav, HttpServletRequest req) {
				HashMap<String, Object> param = HttpUtil.getParameterMap(req);
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(bsi.reRemove(param)));
				mav.addObject("message", jsonObject.toString());
				mav.setViewName("json");
				return mav;
			}

		
}
