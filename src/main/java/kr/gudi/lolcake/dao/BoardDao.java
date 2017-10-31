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
	   public List<HashMap<String, Object>> all(HashMap<String, Object> param) {
	      return session.selectList("sql.bbsall", param);
	   }
	   
	   @Override
	   public HashMap<String, Object> totCntall(HashMap<String, Object> param) {
	      return session.selectOne("sql.totCntall", param);
	   }
	   //param값

/*	   @Override
	   public List<HashMap<String, Object>> totCnt() { // 그룹바이
	      return session.selectList("sql.totCnt");
	   }*/

	
}
