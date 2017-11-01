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
        <script src="resources/js/commhot.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="resources/js/jquery-2.2.1.js"></script>
    <script>
        
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
