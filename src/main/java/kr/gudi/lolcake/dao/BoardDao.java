package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInterface {
	   
	   @Resource(name="sqlSession")
	   SqlSession session;
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbsif() {
	      return session.selectList("sql.bbsif");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbsmd() {
	      return session.selectList("sql.bbsmd");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbsfr() {
	      return session.selectList("sql.bbsfr");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> selectbbshot() {
	      return session.selectList("sql.bbshot");
	   }

	}
