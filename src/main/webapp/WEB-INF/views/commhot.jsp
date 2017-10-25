<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOLCAKE</title>
<link rel="stylesheet" href="resources/css/main.css">
    <script src="resources/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="resources/js/jquery-2.2.1.js"></script>
    <script>
        $(document).ready(function() {
            $('#menu > ul > li').mouseup(function() {
                var idx = $('#menu > ul > li').index(this);
                $('#menu > ul > li').removeClass('on').addClass('off');
                $('#menu > ul > li').eq(idx)
                    .addClass('on').removeClass('off');
                $('#menu > ul > li').eq(4).removeClass('off').removeClass('on');

            });
            
            var data = []; // 데이터 담을 배열 변수 선언
            var page = 1; // 현재 페이지 값
            var viewRow = 10; // 화면에 보여질 행 갯수
            var totCnt = 0; // 데이터 전체 객수
            
            function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
            	console.log(data);
               for(var i = 0; i < data.length; i++){
            	   var tag = "";
            	   tag += '<ul class="board-body">';
            	   tag += '<li>'+data[i].no+'</li>';
            	   tag += '<li>'+data[i].viewType+'</li>';
            	   tag += '<li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>';
            	   tag += '<li>'+data[i].title+'</li>';
            	   tag += '<li>'+data[i].nickname+'</li>';
            	   tag += '<li>'+data[i].datetime+'</li>';
            	   tag += '<li>'+data[i].hit+'</li>';
            	   tag += '</ul>';
                  $("#videoDetail #sections").append(tag);
               }
            }
            
            function initData(){ // 디비에서 데이터 가져오기 위한 함수
               $.ajax({
                     type:"post", // post 방식으로 통신 요청
                     url:"bbshotData", // Spring에서 만든 URL 호출
                     typedata: "json"
               }).done(function(result){ // 비동기식 데이터 가져오기
                  data = result.list; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
                  totCnt = result.cnt.cnt;
                  createHtml(); // 화면에 표현하기 위하여 함수 호출
               });
            }
            
            $("a").on("click", function(){
            	hash = $(this).attr("href");
            	page = hash.substr(1, hash.length);
            	console.log(page);
            });
            
            initData();
         });
       

    </script>
</head>

<body>
    <div id="sections">
        <section id="bbsshow">
            <div class="commenu">
                <ul>
                    <li class="off">
                    <a href="#HOT">HOT</a>
                    </li>
                    <li class="off">
                        <a href="#FR">FREE</a>
                    </li>
                    <li class="off">
                        <a href="#IF">INFO</a>
                    </li>
                    <li class="on">
                        <a href="#MD">VIDEO</a>
                    </li>
                </ul>
            </div>

            <div class="bbsright">
                <div>
                    <div class="search">
                        <select name="drop" id="ddown">
                            <option value="title">제목</option>
                            <option value="author">작성자</option>
                        </select>
                        <input type="text" placeholder="검색해주세요.">
                        <input type="button" value="검색">
                    </div>

                </div>
            </div>
        </section>
    </div>
    <section id="videoDetail">
		<div id="sections">
			<ul class="boardhead">
				<li>번호</li>
				<li>종류</li>
				<li>썸네일</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성시간</li>
				<li>추천수</li>
			</ul>
			<div class="board-body">
			</div>
		</div>
		<div class="search">
			<input type="button" value="글쓰기" id="insert" style="float: right">
		</div>
		<br>
		<div id="paging"></div>
	</section>
    
</body>

</html>
