package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface BoardDaoInterface {
	
//	public List<HashMap<String, Object>> bbshot();
	
	
	public HashMap<String, Object> totCntall(HashMap<String, Object> param);
	public List<HashMap<String, Object>> all(HashMap<String, Object> param);
	//param값 
	
}
