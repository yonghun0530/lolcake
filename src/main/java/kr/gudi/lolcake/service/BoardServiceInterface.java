package kr.gudi.lolcake.service;

import java.util.HashMap;


public interface BoardServiceInterface {
	   
	   public HashMap<String, Object> all(HashMap<String, Object> param);

	   public HashMap<String, Object> bbsWrite(HashMap<String, Object> param);

	   public HashMap<String, Object> bbsEdit(HashMap<String, Object> param);

	   public HashMap<String, Object> bbsD(HashMap<String, Object> param);

	   public HashMap<String, Object> delete(HashMap<String, Object> param);
	   public HashMap<String, Object> bbshit(HashMap<String, Object> param);
	   public HashMap<String, Object> bbslike(HashMap<String, Object> param);
	   public HashMap<String, Object> Reply(HashMap<String, Object> param);

	   public HashMap<String, Object> reWrite(HashMap<String, Object> param);

	   public HashMap<String, Object> reEdit(HashMap<String, Object> param);

	   public HashMap<String, Object> reRemove(HashMap<String, Object> param);
}
