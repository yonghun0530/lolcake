package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.RankingDaoInterface;

@Service
public class RankingService implements RankingServiceInterface {
	
	@Autowired
	RankingDaoInterface rdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> ranking() {
		List<HashMap<String, Object>> list = rdi.ranking();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@Override
	public HashMap<String, Object> userD(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = rdi.userD(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(list.size() == 0) {
			return map;
		}
		//값을 보냄
		map.put("list", list);
		return map;
	}
}
