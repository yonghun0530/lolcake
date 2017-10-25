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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/jquery-2.2.1.js"></script>
<style>
#paging {
	text-align: center;
}
</style>
<script>
	var data = []; // 데이터 담을 배열 변수 선언
	var page = 1; // 현재 페이지 값
	var viewRow = 10; // 화면에 보여질 행 갯수
	var totCnt = 0; // 데이터 전체 객수
	$(document)
			.ready(
					function() {
						$('#menu > ul > li').mouseup(
								function() {
									var idx = $('#menu > ul > li').index(this);
									$('#menu > ul > li').removeClass('on')
											.addClass('off');
									$('#menu > ul > li').eq(idx).addClass('on')
											.removeClass('off');
									$('#menu > ul > li').eq(4).removeClass(
											'off').removeClass('on');
								});

						 function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
							//             	console.log(data);
							$("#videoDetail #sections .board-body").empty();

							for (var i = 0; i < data.length; i++) {
								var tag = "";
								tag += '<ul class="board-body">';
								tag += '<li>' + data[i].divide + '</li>';
								tag += '<li>정보</li>';
								tag += '<li>' + data[i].title + '</li>';
								tag += '<li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>';
								tag += '<li>' + data[i].nickname + '</li>';
								tag += '<li>' + data[i].time + '</li>';
								tag += '<li>' + data[i].hit + '</li>';
								tag += '</ul>';
								$("#videoDetail #sections").append(tag);
							}
						} 

						function createPaging() {
							var paging = totCnt / viewRow;
							// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
							$("#paging").empty(); // 초기화
							for (var i = 0; i < paging; i++) {
								$("#paging").append(
										"<a href='#" + (i + 1) + "'>" + (i + 1)
												+ "</a>")
							}

							$("#paging a").off().on("click", function() {
								
								page = $(this).text();
								console.log(page);
								setTimeout(function() {
									initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
								}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
							});

						}

						function initData() { // 디비에서 데이터 가져오기 위한 함수
							var hash = location.hash;

							if (hash != "") {
								page = hash.substr(1, hash.length);
							}

							var end = (viewRow * page);
							var start = (end - viewRow);

							$.ajax({
								type : "post", // post 방식으로 통신 요청
								url : "listData", // Spring에서 만든 URL 호출
								typedata : "json",
								data : {
									"start" : start,
									"viewRow" : viewRow,
									"type" : hash
								}
							}).done(function(result) { // 비동기식 데이터 가져오기
								console.log(JSON.parse(result));
								dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
								data = dataJson.list;
								console.log(data);
								totCnt = dataJson.totCntif.tot;
								console.log(totCnt);
								createHtml(); // 화면에 표현하기 위하여 함수 호출
								createPaging();
							}).fail(function() {
								alert("안돼");
							});
						}

						// 						$("#paging a").off().on("click", function() {
						// // 							hash = $(this).attr("href");
						// // 							page = hash.substr(1, hash.length);
						// // 							console.log(page);

						// 						});

						initData();
					});
</script>
</head>

<body>
	<div id="sections">
		<section id="bbsshow">
			<div class="commenu">
				<ul>
					<li class="off"><a href="#HOT">HOT</a></li>
					<li class="off"><a href="#FR">FREE</a></li>
					<li class="off"><a href="#IF">INFO</a></li>
					<li class="on"><a href="#MD">VIDEO</a></li>
				</ul>
			</div>

			<div class="bbsright">
				<div>
					<div class="search">
						<select name="drop" id="ddown">
							<option value="title">제목</option>
							<option value="author">작성자</option>
						</select> <input type="text" placeholder="검색해주세요."> <input
							type="button" value="검색">
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
			<li>번호</li>
				<li>종류</li>
				<li>썸네일</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성시간</li>
				<li>추천수</li>
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
