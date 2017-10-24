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
		  map.put("cnt", tdi.selectbbsif());
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
	   
	   @Autowired
	   BoardDaoInterface pdi;
	   
	   @Override
	   public HashMap<String, Object> selectTotCnt() {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", pdi.totCnt());
	      return map;
	   }
	   
	   
	   @Override
	   public HashMap<String, Object> select(HashMap<String, Object> param) {
	      
	      List<HashMap<String, Object>> list = pdi.select(param);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("list", list);
	      
	      return map;
	   }
}
