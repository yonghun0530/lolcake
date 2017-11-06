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
    var hash = location.hash;
    var data = []; // 데이터 담을 배열 변수 선언
    var bbsD = [];
    var page = 1; // 현재 페이지 값
    var viewRow = 10; // 화면에 보여질 행 갯수
    var totCnt = 0; // 데이터 전체 객수
    var no;
    var id;
    var pwd;
   
    var $target = "ALL";
        $(document).ready(function () {
           $('.divide').hide();
           
            if (location.hash != "") {
               var 성진이짱 = 성진이();
                $target = 성진이짱[0];
                page = 성진이짱[1];
         }else{
            page = 1;
            hash = "ALL/1";
            location.hash = hash;
            $target = "ALL";
         }

            $('.btn-filter').on('click', function () {
                $target = $(this).data('target');
                location.hash = $target + "/1";
            
            });
            
            $('#write').on('click', function () {
               $('.container').load('resources/bootjsp/write.html',function(){
                  
                  $.getScript("https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js").done(function() {
                        if (CKEDITOR.instances['contents']) {
                            CKEDITOR.instances['contents'].destroy();
                        }
                        CKEDITOR.replace('contents', {
                            customConfig: '/lolcake/resources/js/config.js'
                        });
                    });
                  
/*                   $("#write").off().on("click",function(){
                        var type = $target;
                        var title = $("#title").val(); 
                        var contents = CKEDITOR.instances['contents'].getData();
                        var nickname = $("#nickname").val();
                        var passwd = $("#passwd").val();
                        var url = $("#url").val();
                        
                        console.log(type,title,contents,nickname,passwd,url);
                        
                        var param = {
                              "type": $target,
                              "title" : title,
                              "contents":contents,
                              "nickname" : nickname,
                              "passwd":passwd,
                              "url":url
                        };
                        
                        console.log(param);
                        
                        if(title==""){
                           alert("제목을 입력하세요");
                        }else if(contents==""){
                           alert("내용을 입력하세요");
                        }else if(nickname==""){
                           alert("이름을 입력하세요");
                        }else if(passwd==""){
                           alert("비밀번호를 입력하세요");
                        }else if($target=="MOVIE" && url=="http://"){
                           alert("url을 입력하세요");
                        }else{
                           $.ajax({
                               type : "post", // post 방식으로 통신 요청
                               url : "writeData", // Spring에서 만든 URL 호출
                               typedata : "json",
                               data : param
                            }).done(function(result) { // 비동기식 데이터 가져오기
                               alert("작성이 완료되었습니다.");
                               location.href = '/lolcake/comm';
                            });
                        }
                        
                    }); */
               });
                           
            });
            
            
            function pageload(){
                if ($target != 'ALL') {
                   $('.table-comm tbody tr').css('display', 'none');
                    $('.table-comm tr[data-status="' + $target + '"]').show();
                    
              } else {
                   $('.table-comm tbody tr').css('display', 'none').show();
                   
              }
                $('.table-responsive h1').text($target);
                initData();
            }"C:/Users/GD/AppData/Local/Temp/egit-patch3824950eb7ebdc8a8319fb05690b4d5ba13a2fbe/좀-와라.patch"
           
            //뒤로갈경우 데이터 유지 
            function popstateEvent(event) {
               var 성진이짱 = 성진이();
                $target = 성진이짱[0];
                page = 성진이짱[1];
                pageload();
            }
            
          
            function 성진이(){
               hash = location.hash;
               var 데이터 = hash.substr(1, hash.length);
               var 배열 = 데이터.split("/");
               return 배열;
            }
            
            $(window).on('popstate', popstateEvent);
            
            //리스트 html
            function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
            $(".table-comm tbody").empty();

            for (var i = 0; i < data.length; i++) {
               var tag = "";
               tag += '<tr data-status="' + data[i].type + '">';
               tag += '<td class="no">' + data[i].no + '</td>';
               tag += '<td class="divide">' + data[i].divide + '</td>';
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
               $(".table-comm tbody").append(tag);
            }
               
            if($target !="ALL"){
               $('.divide').show();
                    $('.no').hide();
            }else{
               $('.divide').hide();
                    $('.no').show();
            }
            
               $('.table-comm tbody tr').on('click', function () {
                  no = $(this).find('td').eq(0).text();
                   $('.container').load('resources/bootjsp/commD.html', function(){
                		 $('#list').on('click', function () {
                			 location.href = '/lolcake/comm';
                	     });
                   });
                   bbsData();
               });
         }
            
            //편집 아이디 검사
          function editError(button){
             id = $('#myModal').find('input').eq(0).val();
             pwd = $('#myModal').find('input').eq(1).val();
             
             if(id == null | pwd == null){
                alert("아이디 또는 비번을 입력해야합니다.");
             }else if(bbsD.nickname != id && bbsD.passwd != pwd){
                alert("아이디 또는 비번이 잘못되었습니다.");
             }else{
                if(button == "#bbsEdit"){
                    $('.modal-backdrop.fade').css('display','none');
                    $('.container').load('resources/bootjsp/write.html',function(){
                       $.getScript("https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js").done(function() {
                                  if (CKEDITOR.instances['contents']) {
                                      CKEDITOR.instances['contents'].destroy();
                                  }
                                  CKEDITOR.replace('contents', {
                                      customConfig: '/lolcake/resources/js/config.js'
                                  });
                                  
                                  CKEDITOR.instances['contents'].setData(bbsD.dept);
                              });
                       
                          $("#title").val(bbsD.title);                          
                                $("#nickname").val(bbsD.nickname);
                                if(bbsD.type =="MOVIE"){
                                   $("#url").val(bbsD.url);
                                }
                                
                       
                    });
                    
                    $("#write").off().on("click",function() {
                           var type = $target;
                           var title = $("#title").val(); 
                           var contents = CKEDITOR.instances['contents'].getData();
                           var nickname = $("#nickname").val();
                           var passwd = $("#passwd").val();
                           var url = $("#url").val();
                           console.log(type);
                          
                         var param = {
                               "type":$target,
                               "title" : title,
                               "contents":contents,
                               "nickname" : nickname,
                               "passwd":passwd,
                               "url":url,
                               "no": no
                            };
                         
                         
                         if(title==""){
                            alert("제목을 입력하세요");
                         }else if(contents==""){
                            alert("내용을 입력하세요");
                         }else if(nickname==""){
                            alert("이름을 입력하세요");
                         }else if(passwd==""){
                            alert("비밀번호를 입력하세요");
                         }else if(type==""){
                            alert("게시판을 선택하세요");
                         }else{
                            $.ajax({
                                  type : "post", // post 방식으로 통신 요청
                                  url : "editData", // Spring에서 만든 URL 호출
                                  typedata : "json",
                                  data : param
                               }).done(function(result) { // 비동기식 데이터 가져오기
                                  console.log(param);
                               alert("수정하였습니다")
                                  location.href = 'lolcake/comm';
                               });
                         }
                      });
                }else{
                   var d = {
                      "no" : no
                   };
                   console.log(d);
                   $.ajax({
                      type : "post", // post 방식으로 통신 요청
                      url : "Delete", // Spring에서 만든 URL 호출
                      typedata : "json",
                      data : d
                   }).done(function(result) { // 비동기식 데이터 가져오기
                      dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
                      alert("삭제되었습니다.");
                      location.href = '/lolcake/comm';
                   });
                }
             }
          }
            
            //상세보기 html 
            function createBbs(){
            $(".table-commD tbody").empty();
            var tag = "";
            tag += '<tr><td><p>' + bbsD.datetime + '<span>'
                  + bbsD.nickname + '</span></p></td></tr>';
            tag += '<tr><td>' + bbsD.title + '</td></tr>';
            tag += '<tr><td><i> 조회수 : ' + bbsD.hit
                  + '</i> <i> 추천수 : ' + bbsD.hit
                  + '</i></td></tr>';
            tag += '<tr><td class="comm-body">';
            if(bbsD.type == "MOVIE"){
               var movie = bbsD.url.split("/");
               if(movie[2] == "www.youtube.com" || movie[2] == "youtu.be"){
                  tag += '<iframe src="https://www.youtube.com/embed/' + movie[movie.length - 1] + '" width="560" height="315" frameborder="0" allowfullscreen></iframe>';
               }else{
                  tag += '<iframe src="' + bbsD.url + '" width="560" height="315" frameborder="0" allowfullscreen></iframe>';
               }       
            }      
            tag += bbsD.dept+ '</td></tr>';
            
            $(".table-commD tbody").append(tag);

            
            $('#bbsEdit').on('click',function(){
               editError('#bbsEdit');
            });
            
            $('#bbsDelete').on('click',function(){
               editError('#bbsDelete');
            });
            }
            
            //페이징 
            function createPaging() {
            var paging = totCnt / viewRow;
            // 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
            $(".pagination").empty(); // 초기화
            for (var i = 0; i < paging; i++){
               $(".pagination").append(
                     "<li> <a href='#" + $target + "/" + (i + 1) + "'>" + (i + 1) + "</a></li>")
            }


         }
            
            //리스트 데이터 불러오기
            function initData() { // 디비에서 데이터 가져오기 위한 함수
            var end = (viewRow * page);
            var start = (end - viewRow);
            
            
            var d = {
                  "start" : start,
                  "viewRow" : viewRow,
                  "type" : $target
               };
            
            $.ajax({
               type : "post", // post 방식으로 통신 요청
               url : "allData", // Spring에서 만든 URL 호출
               typedata : "json",
               data : d 
            }).done(function(result) { // 비동기식 데이터 가져오기
               dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
               data = dataJson.list;
               totCnt = dataJson.totCntall.tot;
               createPaging();
               createHtml(); // 화면에 표현하기 위하여 함수 호출
            });
         }
            
            //게시판 상세보기 데이터 불러오기
            function bbsData() { // 디비에서 데이터 가져오기 위한 함수
            var d = {
                  "no" : no
               };
            
            $.ajax({
               type : "post", // post 방식으로 통신 요청
               url : "bbsData", // Spring에서 만든 URL 호출
               typedata : "json",
               data : d 
            }).done(function(result) { // 비동기식 데이터 가져오기
               dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
               bbsD = dataJson.bbsD;
               console.log(bbsD);
               createBbs();
            });
         }
            
         initData();
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
                        <a href="/lolcake/comm" class="active">
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
                  <div class="table-responsive">
                            <div class="btn-group pull-right">
                                    <button type="button" class="btn btn-default btn-filter" data-target="ALL">ALL</button>
                                    <button type="button" class="btn btn-success btn-filter" data-target="FREE">FREE</button>
                                    <button type="button" class="btn btn-warning btn-filter" data-target="INFO">INFO</button>
                                    <button type="button" class="btn btn-danger btn-filter" data-target="MOVIE">MOVIE</button>
                            </div>
                      <h1>ALL</h1>
                     <table class="table table-filter table-comm">
                        <tbody>
                           
                        </tbody>
                     </table>
                            <button type="button" class="btn btn-danger pull-right" style="background-color: #b1b1b1;
    border: none;" id="write">글쓰기</button>
                            <div class="col-sm-6 col-sm-offset-3 text-center">
                             <ul class="pagination">
                                  <li class="disabled"><a href="#">«</a></li>
                            </ul>
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