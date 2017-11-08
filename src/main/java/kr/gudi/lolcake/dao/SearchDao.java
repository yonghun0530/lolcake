package kr.gudi.lolcake.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao implements SearchDaoInterface{
   
   @Resource(name="sqlSession")
   SqlSession session;
   
   @Override
   public HashMap<String, Object> search(HashMap<String, Object> param) {
      return session.selectOne("sql.search", param);
   }
}