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

import kr.gudi.lolcake.service.UserDServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class UserDController {

   @Autowired
   UserDServiceInterface usi;
   
   @RequestMapping(value = "/userD", method = RequestMethod.GET)
   public ModelAndView userD(ModelAndView mav){
      mav.setViewName("userD");
      return mav;
   }
   
   @RequestMapping(value = "/userDData", method = RequestMethod.POST)
   public void readData(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> param = new HashMap<String, Object>();
      param.put("id", Integer.parseInt(req.getParameter("id")));
      HttpUtil.sendResponceToJson(resp, usi.userD(param));
   }
}