package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChampDao implements ChampDaoInterface {
	   
	   @Resource(name="sqlSession")
	   SqlSession session;
	   
	   @Override
	   public List<HashMap<String, Object>> champ() {
	      return session.selectList("sql.champ");
	   }

	   @Override
	   public List<HashMap<String, Object>> champDetail(HashMap<String, Object> param) {
		  return session.selectList("sql.champDetail", param);
	   }
}
