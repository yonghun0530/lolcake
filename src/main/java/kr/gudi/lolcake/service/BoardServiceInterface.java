package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;


public interface BoardServiceInterface {
	   public HashMap<String, Object> selectbbsif();
	   
	   public HashMap<String, Object> selectbbsmd();
	   
	   public HashMap<String, Object> selectbbsfr();
	   
	   public HashMap<String, Object> selectbbshot();
	   
	   public HashMap<String, Object> selectTotCnt();
	   
	   public HashMap<String, Object> select(HashMap<String, Object> param);
}
