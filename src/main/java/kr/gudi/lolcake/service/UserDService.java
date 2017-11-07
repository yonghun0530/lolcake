package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.UserDDaoInterface;

@Service
public class UserDService implements UserDServiceInterface{

   @Autowired
   UserDDaoInterface udi;
   
   public HashMap<String, Object> map;
   
   @Override
   public HashMap<String, Object> userD(HashMap<String, Object> param) {
      List<HashMap<String, Object>> list = udi.userD(param);
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
      return map;
   }
}