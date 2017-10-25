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
	      return session.selectList("sql.selectHot");
	   }
	   
	   @Override
	   public HashMap<String, Object> selectbbshotCnt() {
	      return session.selectOne("sql.selectHotCnt");
	   }
	   
	   @Override
	   public List<HashMap<String, Object>> select(HashMap<String, Object> param) {
	      return session.selectList("sql.select", param);
	   }

	   @Override
	   public List<HashMap<String, Object>> totCnt() {
	      return session.selectList("sql.totCnt");
	   }

	@Override
	public HashMap<String, Object> totCntif() {
		return session.selectOne("sql.totCntif");
	}
	
	@Override
	public HashMap<String, Object> totCntfr() {
		return session.selectOne("sql.totCntfr");
	}
	@Override
	public HashMap<String, Object> totCntmd() {
		return session.selectOne("sql.totCntmd");
	}
	@Override
	   public List<HashMap<String, Object>> selectfr(HashMap<String, Object> param) {
	      return session.selectList("sql.selectfr", param);
	   }
	@Override
	   public List<HashMap<String, Object>> selectmd(HashMap<String, Object> param) {
	      return session.selectList("sql.selectmd", param);
	   }
	
}
