package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.SearchDaoInterface;

@Service
public class SearchService implements SearchServiceInterface{

   @Autowired
   SearchDaoInterface sdi;
   
   public HashMap<String, Object> map;
   
   @Override
   public HashMap<String, Object> search(HashMap<String, Object> param) {
      HashMap<String, Object> map = sdi.search(param);
      if(map == null || map==param){
    	  map = new HashMap<String, Object>();
    	  map.put("status", 0);
      }else {
    	  map.put("status", 1);
      }
      
      return map;
   }
}