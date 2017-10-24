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
        	$("button").click(function(){
        		console.log($("button").index(this));
        	});
        });

    </script>
</head>

<body>
    <div id="sections">
        <section id="bbsshow">
            <div class="commenu">
                <ul>
                    <li class="off">
                    <a href="#">HOT</a>
                    </li>
                    <li class="off">
                        <a href="#">FREE</a>
                    </li>
                    <li class="off">
                        <a href="#">INFO</a>
                    </li>
                    <li class="on">
                        <a href="#">VIDEO</a>
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
            <ul class="board">
                <div class="th">
                    <li>번호</li>
                    <li>썸네일</li>
                    <li>제목</li>
                    <li>작성자</li>
                    <li>작성시간</li>
                    <li>추천수</li>
                </div>
                <%
   List<HashMap<String, HashMap<String, Object>>> map = (List<HashMap<String, HashMap<String, Object>>>) request.getAttribute("list");
	if(map != null){
		for(int i = 0; i < map.size(); i++){
%>
                <ul class="no">
                    <li><%=map.get(i).get("divide")%></li>
                </ul>
                <ul class="somenail">
                    <li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>
                </ul>
                <ul class="title">
                    <li><%=map.get(i).get("title")%></li>
                </ul>
                <ul class="writer">
                    <li><%=map.get(i).get("nickname")%></li>
                </ul>
                <ul class="time">
                	<li><%=map.get(i).get("time")%></li>
                </ul>
                <ul class="hit">
                    <li><%=map.get(i).get("hit")%></li>
                </ul>
                <%}
}%>
            </ul>
            <div class="search">
                <input type="button" value="글쓰기" id="insert" style="float: right">
            </div>
        </div>
    </section>
    
</body>

</html>
