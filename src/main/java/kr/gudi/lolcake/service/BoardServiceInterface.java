package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;


public interface BoardServiceInterface {
	   public List<HashMap<String, Object>> selectbbsif();
	   
	   public List<HashMap<String, Object>> selectbbsmd();
	   
	   public List<HashMap<String, Object>> selectbbsfr();
	   
	   public List<HashMap<String, Object>> selectbbshot();

}
