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
    <script>
        $(document).ready(function() {
         var data = [];
         var page = 1; // 현재 페이지 값
         var viewRow = 10; // 화면에 보여질 행 갯수
         initData();
            function initData(){
               var end = (viewRow * page);
                var start = (end - viewRow);
                
               var d = {
                        "start" : start,
                        "viewRow" : viewRow
                     };
               
             $.ajax({
                type : "post", // post 방식으로 통신 요청
                url : "rankingData",
                typedata : "json",
                data : d
             }).done(function(result) {
                dataJson = JSON.parse(result);
                   data = dataJson.list;
                   console.log(data);
                createHtml();
             });
            }
            
               $(window).scroll(function() {
                   if ($(window).scrollTop() >= $(document).height() - $(window).height() - 60) {
                       console.log(page);
                       page++;
                       initData();
                   }
               }); 
            
         
         function createHtml() {
            var tag = "";
            for (var i = 0; i < data.length; i++){
               tag += '<tr> ';
               tag += '<td class="id">' + data[i].id + '</td>';
               tag += '<td class="tier">' + '<img src="resources/tier/challenger_1.png">' + data[i].tier + '</td>';
               tag += '<td class="nickname">' + data[i].nickname + '</td>';
               tag += '<td class="LP">' + data[i].LP + '</td>';
               if(data[i].teamname == null){
                  tag += '<td class="teamname">' + "" + '</td>';
               }else {
                  tag += '<td class="teamname">' + data[i].teamname + '</td>';
               }
               tag += '<td class="rate">' +
                    '<div class="progress skill-bar">' +
                    '<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="' + data[i].rate + '" aria-valuemin="0" aria-valuemax="100">' +
                    '<i class="val">' + data[i].rate + "%"
                    '</i>' +
                    '</div>' +
                    '</div>' +
                    ' </td>' + '</tr>'
            }
            $(".table-ranking tbody").append(tag);

            progress();
            성진이_이벤트();
         }
         
         function 성진이_이벤트(){
            $("tbody tr").off().on("click", function(){
               location.href = "userD?id=" + $(this).find("td").eq(0).text();
            });
         }
         
            function progress() {
                $('.progress .progress-bar').css("width",
                    function() {
                        $(this).attr("aria-valuenow");
                        return $(this).attr("aria-valuenow") + "%";
                    }
                )
            };
            progress();


            $('tbody tr').on('click', function() {
                location.hash = $(this).find('td').eq(2).text();
                $('.panel-body').load('resources/bootjsp/userD.html');

            });

        });
    </script>
    <style>
       img {
       height : 100px;
       }
    </style>
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
                        <a href="/lolcake/">
                            <h4>HOME</h4>
                        </a>
                    </li>
                    <li>
                        <a href="/lolcake/ranking" class="active">
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
                    <div class="panel-body">
                        <h1>RANKING</h1>
                        <div class="table-responsive">
                            <table class="table table-filter table-ranking">
                                <thead>
                                    <tr>
                                        <td>
                                            랭킹
                                        </td>
                                        <td>
                                            티어
                                        </td>
                                        <td>
                                            소환사명
                                        </td>
                                        <td>
                                            LP
                                        </td>
                                        <td>
                                            팀
                                        </td>
                                        <td>
                                            승률
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                   
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