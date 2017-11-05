package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface ChampDaoInterface {
	
	
	public List<HashMap<String, Object>> champ();
	public List<HashMap<String, Object>> champDetail(HashMap<String, Object> param);	
	
}
