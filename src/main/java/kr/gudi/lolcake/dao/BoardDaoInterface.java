package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface BoardDaoInterface {
	public List<HashMap<String, Object>> selectbbsif();
	
	public List<HashMap<String, Object>> selectbbsmd();
	
	public List<HashMap<String, Object>> selectbbsfr();
	
	public List<HashMap<String, Object>> selectbbshot();
	public HashMap<String, Object> selectbbshotCnt();
	
	public List<HashMap<String, Object>> select(HashMap<String, Object> param);
	
	public List<HashMap<String, Object>> totCnt();
	
	public HashMap<String, Object> totCntif();
	public HashMap<String, Object> totCntfr();
	public HashMap<String, Object> totCntmd();
	
	public List<HashMap<String, Object>> selectfr(HashMap<String, Object> param);
	public List<HashMap<String, Object>> selectmd(HashMap<String, Object> param);
}
