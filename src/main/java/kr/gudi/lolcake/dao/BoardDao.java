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
	   public List<HashMap<String, Object>> select() {
	      return session.selectList("sql.bbsif");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> select1() {
	      return session.selectList("sql.bbsmd");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> select2() {
	      return session.selectList("sql.bbsfr");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> select3() {
	      return session.selectList("sql.bbshot");
	   }

	}
