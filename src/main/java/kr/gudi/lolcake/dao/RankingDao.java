package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDao implements RankingDaoInterface {

		@Resource(name="sqlSession")
		SqlSession session;
		
		@Override
		public List<HashMap<String, Object>> ranking(HashMap<String, Object> param) {
			return session.selectList("sql.ranking",param);
		}
		
}
