package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface BoardDaoInterface {
	
//	public List<HashMap<String, Object>> bbshot();
	
	
	public HashMap<String, Object> totCntall();
	public List<HashMap<String, Object>> all(HashMap<String, Object> param);
	
}
