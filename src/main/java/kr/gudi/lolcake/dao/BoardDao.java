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
	   
	   @Override
		public HashMap<String, Object> bbsD(HashMap<String, Object> param) {
			return session.selectOne("sql.bbsD", param);
		}
	   /****삭제***/
		@Override
		public int delete(HashMap<String, Object> param) {
			return session.update("sql.bbsremove", param);
		}
		
		/****방문수 ***/
		@Override
		public int bbshit(HashMap<String, Object> param) {
			return session.update("sql.bbshit", param);
		}
		/****추천수 ***/
		@Override
		public int bbslike(HashMap<String, Object> param) {
			return session.update("sql.bbslike", param);
		}
	   
	   
	   /*************************게시판 글쓰기************************************/
	      @Override
	      public int bbsWrite(HashMap<String, Object> param) {
	         return session.insert("sql.bbswrite", param);
	      }
	      
	      /*************************게시글 수정***************************************/
	      @Override
	      public int bbsEdit(HashMap<String, Object> param) {
	         return session.update("sql.bbsedit", param);
	      }
	
}
