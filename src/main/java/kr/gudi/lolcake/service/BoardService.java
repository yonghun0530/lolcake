package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
	   
	   @Autowired
	   BoardDaoInterface tdi;
	   
	   public HashMap<String, Object> map;
	   
	   @Override
	   public HashMap<String, Object> selectbbsif() {
		  map = new HashMap<String, Object>();
		  map.put("list", tdi.selectbbsif());
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectbbsmd() {
		   map = new HashMap<String, Object>();
		   map.put("list", tdi.selectbbsmd());
		   return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectbbsfr() {
		   map = new HashMap<String, Object>();
		   map.put("list", tdi.selectbbsfr());
		   return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectbbshot() {
	      map = new HashMap<String, Object>();
	      map.put("list", tdi.selectbbshot());
	      map.put("cnt", tdi.selectbbshotCnt());
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectTotCnt() {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", tdi.totCnt());
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> select(HashMap<String, Object> param) {
	      
	      List<HashMap<String, Object>> list = tdi.select(param);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", list);
	      
	      HashMap<String, Object> totCnt = tdi.totCntif();
	      map.put("totCntif", totCnt);
	      
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectTotCntfr() {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", tdi.totCnt());
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectfr(HashMap<String, Object> param) {
	      
	      List<HashMap<String, Object>> list = tdi.selectfr(param);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", list);
	      
	      HashMap<String, Object> totCnt = tdi.totCntfr();
	      map.put("totCntfr", totCnt);
	      
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectTotCntmd() {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", tdi.totCnt());
	      return map;
	   }
	   
	   @Override
	   public HashMap<String, Object> selectmd(HashMap<String, Object> param) {
	      
	      List<HashMap<String, Object>> list = tdi.selectmd(param);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", list);
	      
	      HashMap<String, Object> totCnt = tdi.totCntmd();
	      map.put("totCntmd", totCnt);
	      
	      return map;
	   }
}
