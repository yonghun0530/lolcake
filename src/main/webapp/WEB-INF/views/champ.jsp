<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>LOLCAKE</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/bootjsp/css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
			var data = [];
            $('.champ img').on('click', function() {
                var index = $('.champ img').index(this);
                location.hash = $('.portfolio-item').eq(index).find('p').text();
                $('.panel-body').load('resources/bootjsp/champD.html');
            });
            $.ajax({
				type : "post", // post 방식으로 통신 요청
				url : "champData", // Spring에서 만든 URL 호출
				typedata : "json"
			}).done(function(result) { // 비동기식 데이터 가져오기
// 				console.log(result)
				data = result.list;
				createHtml();
			});
            
            function createHtml() { 
				$(".champ").empty();
				for (var i = 0; i < data.length; i++) {
					var tag = "";
					tag += '<div class="col-md-2 col-sm-2 portfolio-item">';
					tag += '<img src="'+data[i].path+''+data[i].img+'"alt="">';
					tag += '<p>' + data[i].champname + '</p>';
					tag += '</div>';
					$(".champ").append(tag);
				}
				
				$(".champ div.portfolio-item").on("click", function(){
					var index = $(".champ div.portfolio-item").index($(this));
					console.log(index, $(this), data[index].no);
					location.href = "champD?no=" + data[index].no;
				});
            }
        });
    </script>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-center">
                    <li>
                        <a href="resources/bootjsp/home.html">
                            <h4>HOME</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resources/bootjsp/ranking.html">
                            <h4>랭킹</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resources/bootjsp/comm.html">
                            <h4>커뮤니티</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resources/bootjsp/champ.html" class="active">
                            <h4>챔피언</h4>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:90px">
        <section class="content">
            <div class="col-md-12">
                <form action="" class="search-form">
                    <div class="form-group has-feedback">
                        <label for="search" class="sr-only">Search</label>
                        <input type="text" class="form-control" name="search" id="search" placeholder="search">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </form>
                <div class="panel panel-default">
                    <div class="panel-body panel-champ">
                        <h1>CHAMPION</h1>
                        <div class="champ">
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="resources/character/Garen.png" alt="">
                                <p>가렌</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>
                            <div class="col-md-2 col-sm-2 portfolio-item">
                                <img src="http://placehold.it/400x400" alt="">
                                <p>ChampName</p>
                            </div>




                        </div>


                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <div class="row footer">
            <div class="col-sm-12 text-center ftPro">서울시 금천구 가산디지털2로 115 대륭테크노타운3차<span>|</span>Goodee<span>|</span>김성진 임채영 주용훈 최혁<span>|</span>사업자 등록번호 119-86-83838</div>
            <div class="col-sm-12 text-center ftImg">
                <a href="http://www.facebook.com/1lolcake2/"><img src="resources/bootjsp/img/002-facebook-logo-button.png"></a>
                <a href="https://www.instagram.com/lolcake.yum/">
                         <img class="img-circle" src="resources/bootjsp/img/lol.png">
                    </a>
                <a href="https://kr.leagueoflegends.com/">
                        <img src="resources/bootjsp/img/001-instagram-logo.png">
                    </a>
            </div>
            <div class="col-sm-12 text-center ftCopy">
                Copyright &copy;LoLcake^^Yum
            </div>
        </div>
    </footer>
</body>

</html>
