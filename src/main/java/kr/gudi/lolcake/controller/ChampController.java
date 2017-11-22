package kr.gudi.lolcake.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.lolcake.service.ChampServiceInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class ChampController {
   
   @Autowired
    ChampServiceInterface csi;
 
    @RequestMapping(value = "/champ", method = RequestMethod.GET)
    public ModelAndView champ(ModelAndView mav){
       mav.setViewName("champ");
       return mav;
    }
    @RequestMapping(value = "/champData", method = RequestMethod.POST)
     public ModelAndView readData(ModelAndView mav, HttpServletResponse resp){
      return HttpUtil.makeHashToJsonModelAndView(csi.champ());
    }
    @RequestMapping("/champDetailData")
    public ModelAndView readDetailData(ModelAndView mav, HttpServletRequest req, HttpServletResponse resp){
		HashMap<String, Object> param = new HashMap<String, Object>();
		//int 로 변환 가능할 경우.
		if(isInteger(req.getParameter("no"))) {
        	param.put("no", Integer.parseInt(req.getParameter("no")));
        }
       return HttpUtil.makeHashToJsonModelAndView(csi.champDetail(param));
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