package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

public interface HomeDaoInterface {

	public List<HashMap<String, Object>> homemv(HashMap<String, Object> param);
	
	public List<HashMap<String, Object>> homeif(HashMap<String, Object> param);
}
