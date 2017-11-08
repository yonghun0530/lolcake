package kr.gudi.lolcake.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.lolcake.service.SearchBoardServiceInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class SearchBoardController {

	@Autowired
	SearchBoardServiceInterface sbi;
	
	@RequestMapping(value = "/searchboardData", method = RequestMethod.POST)
	public void readData(HttpServletRequest req, HttpServletResponse resp){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("title", req.getParameter("title"));
		HttpUtil.sendResponceToJson(resp, sbi.searchboard(param));
	}
	
	@RequestMapping(value = "/searchboardView", method = RequestMethod.POST)
	public String searchboardView(HttpServletRequest req, ModelAndView mav){
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		String viewName = "redirect:comm";
		HashMap<String, Object> map = sbi.searchboard(param);
		
		if(Integer.parseInt(map.get("status").toString()) == 1){
			viewName += "#" + map.get("type") + "-" + map.get("divide");
		}
		
		return viewName;
	}
}
