package kr.gudi.lolcake.service;

import java.util.HashMap;


public interface BoardServiceInterface {
	   
/*	   public HashMap<String, Object> bbshot();*/
	   
/*	   public HashMap<String, Object> TotCnt();
	   public HashMap<String, Object> TotCntfr();*/
	   
//	   public HashMap<String, Object> totCntall();
	   public HashMap<String, Object> all(HashMap<String, Object> param);
	   // 서비스 인터페이스

	   public HashMap<String, Object> bbsWrite(HashMap<String, Object> param);

	   public HashMap<String, Object> bbsEdit(HashMap<String, Object> param);

	   public HashMap<String, Object> bbsD(HashMap<String, Object> param);

	   public HashMap<String, Object> delete(HashMap<String, Object> param);
}
