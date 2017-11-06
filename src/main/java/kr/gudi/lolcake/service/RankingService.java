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
	public HashMap<String, Object> ranking(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = rdi.ranking(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
}
