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
            var detail = [];
            var hash;
            var no;
            
            initData();
            
            function initData(){
            	 $.ajax({
                     type : "post", // post 방식으로 통신 요청
                     url : "champData", // Spring에서 만든 URL 호출
                     typedata : "json"
         	         }).done(function(result) { // 비동기식 데이터 가져오기
         	        	 dataJson = JSON.parse(result); 
                          data = dataJson.list;
         	            createHtml();
         	         });
            }

            function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
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
	               no = data[index].no;
	               champD();   
	            });
            }
            
            function champD(){
               $('.panel-body').load('resources/bootjsp/champD.html',function(){
            	   var d = {"no" : no}; 
               $.ajax({
                  type : "post", // post 방식으로 통신 요청
                  url : "champDetailData", // Spring에서 만든 URL 호출
                  typedata : "json",
                  data : d
               }).done(function(result) { // 비동기식 데이터 가져오기
            	   dataJson = JSON.parse(result); 
                   detail = dataJson.data;
                   if(detail == undefined){
                	   alert('정상적인 경로가 아닙니다.');
                	   location.href = "/lolcake/champ";
                   }else{
                	   //$(".champ-skill .skill p").empty();
                	   location.hash = "#C-" + no;
                       $("#champImg").attr("src",  detail[0].path + "/" + detail[0].img);
                       //$(".champ-skill .skill p").append("<p>" + data[0].champname + "</p>")
                       $('#champName').prepend(detail[0].champname);
                       $("tbody").empty();
                       for(var i = 0; i < detail.length; i++){
                          $("#skills img").eq(i).attr("src",  detail[i].skill_path + "/" + detail[i].skill_img);
                          $("tbody").append("<tr><td>" + detail[i].skillname + "</td><td>" + detail[i].dept + "</td></tr>");
                       }
                   }
               	  
               });
               
               $("#skills img").on("click", function(){
                      var i = $("#skills img").index($(this));
                      var html = '<div style="text-align: center;"><img src="resources/bootjsp/img/LOL.jpg" style="width:80%;"></div>';
                      if(detail[i].media_url != undefined ){
                         html = '<video class="skill-video" controls autoplay loop><source src="'+detail[i].media_path + detail[i].media_url+'" type="video/mp4">Your browser does not support HTML5 video.</video>';
                      }
                      $(".modal-dialog").empty().html(html);
                      $("#myModal").modal("show");
                   });
               
            	});
            }
            
            Pageload();
            
            function Pageload(){
               hash = location.hash;
               if(hash != ""){
                  no = hash.substr(3,hash.lengh);
                  champD();
               }
            }
            
            function popstateEvent(event) {
               hash = location.hash;
               if(hash != ""){
                  /* pageload(); */
               }else{
                  location.href = "/lolcake/champ";
               }
                
            }


            $(window).on('popstate', popstateEvent);
        });
    </script>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
            <img src="resources/bootjsp/img/logo.png" style="width:60px; position:absolute; left:-1px; top:-7px;">
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
                        <a href="/lolcake/champ" class="active">
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
<!--                 <form action="" class="search-form"> -->
<!--                     <div class="form-group has-feedback"> -->
<!--                         <label for="search" class="sr-only">Search</label> -->
<!--                         <input type="text" class="form-control" name="search" id="search" placeholder="search"> -->
<!--                         <span class="glyphicon glyphicon-search form-control-feedback"></span> -->
<!--                     </div> -->
<!--                 </form> -->
                <div class="panel panel-default">
                    <div class="panel-body panel-champ">
                        <h1>CHAMPION</h1>
                        <div class="champ">
                            
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
                         <img class="img-circle" src="resources/bootjsp/img/001-instagram-logo.png">
                    </a>
                <a href="https://kr.leagueoflegends.com/">
                        <img src="resources/bootjsp/img/lol.png">
                    </a>
            </div>
            <div class="col-sm-12 text-center ftCopy">
                Copyright &copy;LoLcake^^Yum
            </div>
        </div>
    </footer>
</body>

</html>