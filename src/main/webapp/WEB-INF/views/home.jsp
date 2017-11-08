<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
        
    var data = [];
    
    function initDataif() { // 디비에서 데이터 가져오기 위한 함수
        $.ajax({
           type : "post", // post 방식으로 통신 요청
           url : "homeifdata", // Spring에서 만든 URL 호출
           typedata : "json",
        }).done(function(result) { // 비동기식 데이터 가져오기
           dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
           data = dataJson.list;
           console.log(data);
           createHtml("if");
        });
     }
    initDataif();
    
    function initDatamv() { // 디비에서 데이터 가져오기 위한 함수
        $.ajax({
           type : "post", // post 방식으로 통신 요청
           url : "homemvdata", // Spring에서 만든 URL 호출
           typedata : "json",
        }).done(function(result) { // 비동기식 데이터 가져오기
           dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
           data = dataJson.list;
           console.log(data);
           createHtml("mv");
        });
     }
    initDatamv();
    
  //리스트 html
    function createHtml(menu) { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
    $(".table-comm ." + menu).empty();

    for (var i = 0; i < data.length; i++) {
        var tag = "";
        tag += '<tr data-status="'+ data[i].type +'">' + '<td class="no">'+ data[i].no +'</td>' + '<td class="divide">' + data[i].divide + '</td>';
        tag += '<td>';
        if(data[i].type == "MOVIE"){
            var movie = data[i].url.split("/");
            if(movie[2] == "www.youtube.com" || movie[2] == "youtu.be"){
               tag += '<img class="media-photo" src="' + 'http://img.youtube.com/vi/' + movie[movie.length - 1] + '/0.jpg' + '">';
            }else{
               tag += '<img class="media-photo" src="' + 'https://odenseofficial.com/web/img/news/img_video_over.png' + '">';
            }
            
         }
        tag += '<p class="'+data[i].type+'" data-target="'+data[i].type+'">(' + data[i].type + ')</p></td>';
        tag += '<td>' + data[i].title + '</td>';
        tag += '<td>'+data[i].nickname+'</li>';
        tag += '<td><p>' + data[i].datetime + '</p><i><img src="resources/bootjsp/img/like.png">'+ data[i].like +'<img src="resources/bootjsp/img/click.png">'+ data[i].hit +'</i></td>';
        tag += '</tr>';
        $(".table-comm ." + menu).append(tag);
     }
    
    $('.no').css("display","none");
    
    $(".table-comm ." + menu + " tr").off().on("click",function(){
        location.href = "/lolcake/comm#"+ $(this).data('status') + "-" + $(this).find('td').eq(0).text();
       
    });
    //initDataif();
  }

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
                        <a href="/lolcake/" class="active">
                            <h4>HOME</h4>
                        </a>
                    </li>
                    <li>
                        <a href="/lolcake/ranking">
                            <h4>랭킹</h4>
                        </a>
                    </li>
                    <li>
                        <a href="/lolcake/comm">
                            <h4>커뮤니티</h4>
                        </a>
                    </li>
                    <li>
                        <a href="/lolcake/champ">
                            <h4>챔피언</h4>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:70px">
        <div class="col-md-6 col-md-offset-3" style="text-align: center">
            <img src="resources/bootjsp/img/logo.png">
            <div id="imaginary_container">
                <form action="searchView" method="post">
	                <div class="input-group stylish-input-group">
	                    <input name="nickname" type="text" class="form-control" placeholder="Search">
	                    <span class="input-group-addon">
	                        <button id="search" type="submit">
	                            <span class="glyphicon glyphicon-search"></span>
	                    </button>
	                    </span>
	                </div>
                </form>
            </div>
        </div>
        <section class="content">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <h1>BEST BOARD</h1>
                            <table class="table table-filter table-comm">
                                <tbody class="if">
                                  
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <h1>BEST MOVIE</h1>
                            <table class="table table-filter table-comm">
                                <tbody class="mv">
                                  
                                </tbody>
                            </table>
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