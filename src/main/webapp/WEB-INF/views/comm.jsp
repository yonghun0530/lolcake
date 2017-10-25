<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
    <script src="resources/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            var hash = location.hash;
            if (hash == "") {
                hash = "#HOT";
            }

            $('.commenu ul li a').off().on("click", function() {
                var index = $('.commenu ul li a').index(this);
                menubar(index);
            });
            
            $('#insert').off().on("click", function() {
                location.hash = "#FR-W";
                $("#container").load("../html/write.html");
            });
            
            if(location.hash == "#FR-W" | location.hash == "#IF-W" | location.hash == "#MD-W"){
                location.hash = "#HOT";
                pageload();
            }else{
                pageload();
            }
            

            function popstateEvent(event) {
                hash = location.hash;
                if (hash == "") {
                    hash = "#HOT";
                }
                pageload();
            }

            $(window).on('popstate', popstateEvent);

            function pageload() {
                var index;
                switch (hash.substr(1, hash.length)) {
                    case "HOT":
                        index = 0;
                        break;
                    case "FR":
                        index = 1;
                        break;
                    case "IF":
                        index = 2;
                        break;
                    case "MD":
                        index = 3;
                        break;
                    case "FR-W":
                        index = 0;
                        $(".moviewrite").hide();
                        $(".bbswrite").show();
                        break;
                    case "IF-W":
                        index = 1;
                        $(".moviewrite").hide();
                        $(".bbswrite").show();
                        break;
                    case "MD-W":
                        index = 2;
                        $(".moviewrite").show();
                        $(".bbswrite").hide();
                        break;
                }
                menubar(index);
            }

            function menubar(index) {
                $('.commenu ul li a').removeClass("on");
                $('.commenu ul li a').eq(index).addClass("on");
                $('.commenu ul li').css("background-color", "white");
                $('.commenu ul li').eq(index).css("background-color", "#36161c");
            }
        });

    </script>
</head>

<body>
    <div id="main">
        <div id="menu">
            <ul>
                <li>
                    <a href="resources/html/home.html">
                        <h4>HOME</h4>
                    </a>
                </li>
                <li>
                    <a href="resources/html/ranking.html">
                        <h4>랭킹</h4>
                    </a>
                </li>
                <li>
                    <a href="resources/html/comm.html" class="on">
                        <h4>커뮤니티</h4>
                    </a>
                </li>
                <li>
                    <a href="resources/html/champ.html">
                        <h4>챔피언</h4>
                    </a>
                </li>
            </ul>
        </div>
        <div id="container">
            <div id="sections">
                <section id="bbsshow">
                    <div class="commenu">
                        <ul>
                            <li>
                                <a href="#HOT" class="on">BEST</a>
                            </li>
                            <li>
                                <a href="#FR">FREE</a>
                            </li>
                            <li>
                                <a href="#IF">INFO</a>
                            </li>
                            <li>
                                <a href="#MD">VIDEO</a>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
            <div id="sections">
		<section id="bbsshow">

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
			</div>
		</div>
		<div class="search">
			<input type="button" value="글쓰기" id="insert" style="float: right">
		</div>
		<br>
		<div id="paging"></div>
	</section>
        <footer id="footer">
            <div class="basic">
                <p>서울시 금천구 가산디지털2로 115 대륭테크노타운3차 <span>|</span>Goodee<span>|</span>김성진 임채영 주용훈 최혁<span>|</span>사업자 등록번호 119-86-83838</p>
            </div>
            <div class="sub">
                <ul>
                    <li>
                        <a class="fb" href="http://www.facebook.com/1lolcake2/"><img src="resources/img/002-facebook-logo-button.png"></a>
                    </li>
                    <li>
                        <a class="gram" href="https://www.instagram.com/lolcake.yum/"><img src="resources/img/001-instagram-logo.png"></a>
                    </li>
                    <li>
                        <a href="https://kr.leagueoflegends.com/"><img class="lol" src="resources/img/lol.png"></a>
                    </li>
                </ul>
            </div>
            <div>
                <h6>Copyright(c) LoLcake^^Yum</h6>
            </div>
        </footer>
    </div>
</body>

</html>
