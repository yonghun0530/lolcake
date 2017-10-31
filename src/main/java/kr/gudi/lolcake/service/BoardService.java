package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
      
      @Autowired
      BoardDaoInterface bdi;
      
      public HashMap<String, Object> map;
/*      
      @Override
      public HashMap<String, Object> bbshot() {
         map = new HashMap<String, Object>();
         map.put("list", bdi.bbshot());
         map.put("cnt", bdi.bbshotCnt());
         return map;
      }
      

      @Override
      public HashMap<String, Object> TotCnt() {
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("list", bdi.totCnt());
         return map;
      }*/
      
      @Override
      public HashMap<String, Object> all(HashMap<String, Object> param) {
         
         List<HashMap<String, Object>> list = bdi.all(param);
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("list", list);
         
         HashMap<String, Object> totCnt = bdi.totCntall(param);
         map.put("totCntall", totCnt);
         //param값 추가
         return map;
      }

//   @Override
//   public HashMap<String, Object> totCntall() {
//      // TODO Auto-generated method stub
//      return null;
//   }
      

}