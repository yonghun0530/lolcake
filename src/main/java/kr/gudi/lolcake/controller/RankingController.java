package kr.gudi.lolcake.controller;

import java.util.HashMap;

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
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("ranking");
		return mav;
	}

	@RequestMapping(value = "/rankingData", method = RequestMethod.POST)
	public ModelAndView readData(ModelAndView mav, HttpServletResponse resp) {
		return HttpUtil.makeHashToJsonModelAndView(rsi.ranking());
	}

	@RequestMapping(value = "/userDData", method = RequestMethod.POST)
	public ModelAndView readData2(ModelAndView mav, HttpServletRequest req, HttpServletResponse resp) 
			throws Exception{
		HashMap<String, Object> param = new HashMap<String, Object>();
		//int 로 변환 가능할 경우.
		if(isInteger(req.getParameter("id"))) {
        	param.put("id", Integer.parseInt(req.getParameter("id")));
        }
		return HttpUtil.makeHashToJsonModelAndView(rsi.userD(param));
		
	}
	
	public static boolean isInteger(String s) {
		try {
			Integer.parseInt(s);
		} catch (NumberFormatException e) {
			return false;
		} catch (NullPointerException e) {
			return false;
		}
		return true;
	}

}
