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
	   public List<HashMap<String, Object>> selectbbsif() {
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tdi.selectbbsif();

	      return list;
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbsmd() {
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tdi.selectbbsmd();

	      return list;
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbsfr() {
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tdi.selectbbsfr();

	      return list;
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbshot() {
	      List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) tdi.selectbbshot();

	      return list;
	   }
}
