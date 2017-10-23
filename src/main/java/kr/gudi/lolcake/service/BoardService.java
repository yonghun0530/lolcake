package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
	   
	   @Autowired
	   BoardDaoInterface tdi;
	   
	   @Override
	   public List<HashMap<String, Object>> select() {
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tdi.select();

	      return list;
	   }
}
