package kr.gudi.lolcake.dao;

import java.util.List;
import java.util.HashMap;

public interface BoardDaoInterface {
	public List<HashMap<String, Object>> selectbbsif();
	
	public List<HashMap<String, Object>> selectbbsmd();
	
	public List<HashMap<String, Object>> selectbbsfr();
	
	public List<HashMap<String, Object>> selectbbshot();
}
