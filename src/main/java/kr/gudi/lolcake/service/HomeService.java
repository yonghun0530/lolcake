package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.HomeDaoInterface;

@Service
public class HomeService implements HomeServiceInterface {

	@Autowired
	HomeDaoInterface hdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> homemv(HashMap<String, Object> param){
		List<HashMap<String, Object>> list = hdi.homemv(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@Override
	public HashMap<String, Object> homeif(HashMap<String, Object> param){
		List<HashMap<String, Object>> list = hdi.homeif(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
}
