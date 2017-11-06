package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao implements HomeDaoInterface {

	@Resource(name="sqlSession")
	   SqlSession session;
	
	@Override
	   public List<HashMap<String, Object>> homemv(HashMap<String, Object> param) {
	      return session.selectList("sql.bestMOVIE", param);
	   }
	@Override
		public List<HashMap<String, Object>> homeif(HashMap<String, Object> param) {
			return session.selectList("sql.bestINFO", param);
	}

}
