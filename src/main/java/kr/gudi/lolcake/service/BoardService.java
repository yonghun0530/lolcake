package kr.gudi.lolcake.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.lolcake.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {

	@Autowired
	BoardDaoInterface bdi;

	public HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> all(HashMap<String, Object> param) {

		List<HashMap<String, Object>> list = bdi.all(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		HashMap<String, Object> totCnt = bdi.totCntall(param);
		map.put("totCntall", totCnt);
		return map;
	}

	/************************* 게시판글쓰기 ************************************/
	@Override
	public HashMap<String, Object> bbsWrite(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean check = true;
		String passwd = param.get("passwd").toString();
		String title = param.get("title").toString();
		String contents = param.get("contents").toString();
		String nickname = param.get("nickname").toString();
		System.out.println("==========Param Value==============");
		System.out.println("title : " + title.length());
		System.out.println("contents : " + contents.length());
		System.out.println("nickname : " + nickname.length());
		System.out.println("==========Param Value==============");
		
		if(title.length() > 100){
			check = false;
			System.out.println("제목은 최대 100글자 입니다.");
		}else if(("").equals(title)){
			check = false;
			System.out.println("제목을 입력해주세요");
		}
		if(passwd.length() > 10){
			check = false;
			System.out.println("비밀번호는 최대 10글자 입니다.");
		}else if(("").equals(passwd)){
			check = false;
			System.out.println("비밀번호를 입력해주세요");
		}
		if(contents.length() > 10000){
			check = false;
			System.out.println("내용은 최대 10000글자 입니다.");
		}else if(("").equals(contents)){
			check = false;
			System.out.println("내용을 입력해주세요");
		}
		if(nickname.length() > 50){
			check = false;
			System.out.println("닉네임은 최대 50글자 입니다.");
		}else if(("").equals(nickname)){
			check = false;
			System.out.println("닉네임을 입력해주세요");
		}
		
		if(check){
			map.put("list", bdi.bbsWrite(param));
			map.put("status", 1);
		}else{
			map.put("status", 0);
		}
		return map;
	}

	/************************* 게시글수정 ************************************/
	@Override
	public HashMap<String, Object> bbsEdit(HashMap<String, Object> param) {
		int list = bdi.bbsEdit(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

	/*********************** 게시판상세보기 ****************************/

	@Override
	public HashMap<String, Object> bbsD(HashMap<String, Object> param) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> bbsD = bdi.bbsD(param);
		map.put("bbsD", bbsD);

		return map;
	}

	/*********************** 게시물지우기 ****************************/
	@Override
	public HashMap<String, Object> delete(HashMap<String, Object> param) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int delete = bdi.delete(param);
		map.put("delete", delete);

		return map;
	}

	@Override
	public HashMap<String, Object> bbshit(HashMap<String, Object> param) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int bbshit = bdi.bbshit(param);
		map.put("bbshit", bbshit);

		return map;
	}

	@Override
	public HashMap<String, Object> bbslike(HashMap<String, Object> param) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int bbslike = bdi.bbslike(param);
		map.put("bbslike", bbslike);

		return map;
	}

	/****** 댓글보기 *****/
	@Override
	public HashMap<String, Object> Reply(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> replyD = bdi.Reply(param);
		map.put("replyD", replyD);

		return map;
	}

	/****** 댓글쓰기 *****/
	@Override
	public HashMap<String, Object> reWrite(HashMap<String, Object> param) {
		int list = bdi.reWrite(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

	/********** 댓글수정 ********/
	@Override
	public HashMap<String, Object> reEdit(HashMap<String, Object> param) {
		int list = bdi.reEdit(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

	/********** 댓글삭제 ********/

	@Override
	public HashMap<String, Object> reRemove(HashMap<String, Object> param) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int delete = bdi.reRemove(param);
		map.put("delete", delete);
		return map;

	}

}