package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface BoardDaoInterface {
	
//	public List<HashMap<String, Object>> bbshot();
	
	
	public HashMap<String, Object> totCntall(HashMap<String, Object> param);
	public List<HashMap<String, Object>> all(HashMap<String, Object> param);
	//param값 추가 추가
	public HashMap<String, Object> bbsD(HashMap<String, Object> param);
	public List<HashMap<String, Object>> editdata(HashMap<String, Object> param);
	public int bbsEdit(HashMap<String, Object> param);
	public int bbsWrite(HashMap<String, Object> param);
	public int delete(HashMap<String, Object> param);
	
	
}
