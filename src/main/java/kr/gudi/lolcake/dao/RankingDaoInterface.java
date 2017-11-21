package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

public interface RankingDaoInterface {
	public List<HashMap<String, Object>> ranking();
	public List<HashMap<String, Object>> userD(HashMap<String, Object> param);
}
