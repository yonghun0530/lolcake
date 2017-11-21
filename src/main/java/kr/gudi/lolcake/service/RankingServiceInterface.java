package kr.gudi.lolcake.service;

import java.util.HashMap;

public interface RankingServiceInterface {

	public HashMap<String, Object> ranking();
	public HashMap<String, Object> userD(HashMap<String, Object> param);
}
