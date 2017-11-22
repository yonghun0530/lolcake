package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.ChampDaoInterface;

@Service
public class ChampService implements ChampServiceInterface {

	@Autowired
	ChampDaoInterface cdi;

	public HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> champ() {
		List<HashMap<String, Object>> list = cdi.champ();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

	@Override
	public HashMap<String, Object> champDetail(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = cdi.champDetail(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(list.size() == 0) {
			return map;
		}
		map.put("data", list);
		return map;
	}
}