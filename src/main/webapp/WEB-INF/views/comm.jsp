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
    var reply = [];
    var page = 1; // 현재 페이지 값
    var viewRow = 10; // 화면에 보여질 행 갯수
    var totCnt = 0; // 데이터 전체 객수
    var no;
    var id;
    var pwd;

    var $target = "ALL";
    
      $(document).ready(function () {
           $('.divide').hide();
           var hash = location.hash;
           Load();
           
           function Load(){
              hash = location.hash;
               var data = hash.substr(1,hash.lengh);
               var result = data.indexOf("/");
               
               if(location.hash == ""){
                     page = 1;
                    hash = "ALL/1";
                    location.hash = hash;
                    $target = "ALL";
               }else if(result != '-1'){
                  var 배열 = data.split('/');
                  $target = 배열[0];
                  page = 배열[1];
                  pageload();
               }else if(data == "WRITE" | data == "EDIT"){
              writeBbs(data);
               }else{
                  var 배열 = data.split('-');
                  no = 배열[1];
                  hitandlike("hit");
               }
           }
           
           function popstateEvent(event) {
              location.reload();
            }


            $(window).on('popstate', popstateEvent);
           
            $('.btn-filter').on('click', function () {
                $target = $(this).data('target');
                location.hash = $target + "/1";
            });
            
            $('#write').on('click', function () {
               writeBbs("WRITE");
                           
            });
            
            
            function pageload(){
                if ($target != 'ALL') {
                   $('.table-comm tbody tr').css('display', 'none');
                    $('.table-comm tr[data-status="' + $target + '"]').show();
                    
                 } else {
                   $('.table-comm tbody tr').css('display', 'none').show();
                   
                 }
                $('.panel-body h1').text($target);
                initData();
            }
            
            //게시판 리스트 html 구현
            function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
            $(".table-comm tbody").empty();
         
            
            //상세보기 html
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
                   $target =  $(this).data('status');
                   location.hash = $target + "-" + no;
                   
   /*                 hitandlike("hit"); */
               });
               
         }
            
              //편집시 아이디와 패스워드 검사 후 버튼별 이벤트 지정
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
                       writeBbs("EDIT");                 
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
                         alert("삭제되었습니다.");
                         location.href = '/lolcake/comm';
                      });
                   }
                }
             }
            function hitandlike(url){
                      $.ajax({
                         type : "post",
                         url : url,
                         typedata : "json",
                         data : {"no" : no}
                      }).done(function(result) { 
                         bbsData();
                      });
            }
              
            // 글쓰기 부분 두가지로 구성. 쓰기 OR 수정 
            function writeBbs(write){
                $('.container').load('resources/bootjsp/write.html',function(){
                   $('.bbswrite input').eq(1).hide();
                    var $target = "FREE";
                     location.hash = write;
                    $('.btn-filter').on('click', function() {
                        $target = $(this).data('target');
                        writeload();
                    });
                    
                    $('#list').on('click', function() {
                        location.href = '/lolcake/comm';
                    });

                    function writeload() {        
                        if ($target == 'MOVIE') {
                             $('.bbswrite input').eq(1).show();
                            //버튼을 연달아 누르면 문제발생 -> 질문
                        }else{
                            $('.bbswrite input').eq(1).hide();
                            $("#url").val("http://");
                        }
                        $('.panel-body h1').text($target + " WRITE");
                    }
                    
                    $.getScript("https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js").done(function() {
                          if (CKEDITOR.instances['contents']) {
                              CKEDITOR.instances['contents'].destroy();
                          }
                          CKEDITOR.replace('contents', {
                              customConfig: 'resources/js/config.js'
                          });
                          
                          if(write != "write"){
                             CKEDITOR.instances['contents'].setData(bbsD.dept);
                          }
                      });
                       
                    if(write != "write"){
                       $("#title").val(bbsD.title);                          
                        $("#nickname").val(bbsD.nickname);
                        if(bbsD.type =="MOVIE"){
                           $("#url").val(bbsD.url);
                        }
                    }
                    $("#write").on("click",function() {
                       
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
                         if(write != "write"){
                            $.ajax({
                                 type : "post", // post 방식으로 통신 요청
                                 url : "editData", // Spring에서 만든 URL 호출
                                 typedata : "json",
                                 data : param
                              }).done(function(result) { // 비동기식 데이터 가져오기
                                 console.log(param);
                              alert("수정하였습니다")
                                 location.href = '/lolcake/comm';
                              });
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
                      }
                   });
                 });
               
            }
            
            //상세보기 html 부분구현
            function createBbs(){
                $('.container').load('resources/bootjsp/commD.html', function(){
                    $('#list').on('click', function () {
                       location.href = '/lolcake/comm';
                     });
                    Reply();
                    
                    
                    
                    $(".table-commD tbody").empty();
                    var tag = "";
                    tag += '<tr><td><p>' + bbsD.datetime + '<span>'
                          + bbsD.nickname + '</span></p></td></tr>';
                    tag += '<tr><td>' + bbsD.title + '</td></tr>';
                    tag += '<tr><td><i> 조회수 : ' + bbsD.hit
                          + '</i> <i> 추천수 : ' + bbsD.like
                          + '</i></td></tr>';
                    tag += '<tr><td class="comm-body">';
                    //영상일 경우 영상 경로를 눠서 표현. 영상이 아닐경우는 노필요
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
                 
                    $(".like b").text(bbsD.like);
                    $("#like").off().on("click",function(){
                       hitandlike("like");
                    });
                    
                    //편집버튼클릭시 
                    $('#bbsEdit').on('click',function(){
                       editError('#bbsEdit');
                    });
                    
                    //삭제버튼클릭시
                    $('#bbsDelete').on('click',function(){
                       editError('#bbsDelete');
                    });

                    /* 댓글쓰기 */
                    $("#reWrite").click(function reWrite() {

                        no = bbsD.no;
                        var id = $(".Pid").val();
                        var passwd = $(".Ppasswd").val();
                        var comment = $(".Pcomment").val();
                        comment = comment.replace(/\n/g, "<br>");
                        var Cparam = {
                            "no": no,
                            "comment": comment,
                            "id": id,
                            "passwd": passwd
                        };

                        if (comment == "") {
                            alert("내용을 입력하세요");
                        } else if (id == "") {
                            alert("ID을 입력하세요");
                        } else if (passwd == "") {
                            alert("비밀번호를 입력하세요");
                        } else {

                            $.ajax({
                                type: "post",
                                url: "replyWrite",
                                typedata: "json",
                                data: Cparam
                            }).done(function(result) {
                                alert("작성이 완료되었습니다.");
                                passwd = $(".Ppasswd").val("");
                                comment = $(".Pcomment").val("");
                                id = $(".Pid").val("");
                                $(".comment").empty();
                                Reply();
                            });
                        }
                });
               
            });
            }
                

                function createCmt() {
                    var replyC = [];
                    for (var i = 0; i < reply.length; i++) {
                        var tag = "";
                        tag += "<li class='comment'>" +
                            "<div class='comment-body'>" +
                            "<div class='comment-heading'>" +
                            "<h4 class='user'>" +
                            reply[i].id +
                            "</h4>" +
                            "<h5 class='time'>" +
                            reply[i].datetime +
                            "</h4>" +
                            "</div>" +
                            "<div class='row'>" +
                            "<p class='col-xs-12 cmt'>" +
                            reply[i].comment +
                            "</p>" +
                            "<textarea class='Edit' rows='10' style='width: 97%; margin-left:15px;'>" +
                            "</textarea>" +
                            "<div class='col-xs-12 text-right cmtBtn'>" +
                            "<button type='button' class='btn btn-danger cmtBtnEdit' style='background-color: #b1b1b1; border: none;'>편집</button>" +
                            "<div class='hideInput'>" +
                            "<input class='input-info Eid' placeholder='닉네임' type='text'>" +
                            "<input class='input-info Epasswd' placeholder='비번' type='password'>" +
                            "<input class='input-info okay' type='button' value='확인'>" +
                            "</div>" +
                            "<div class='hideBtn'>" +
                            "<button type='button' class='btn btn-danger cmtBtnUpdate' style='background-color: #b1b1b1; border: none; margin: 5px;'>수정</button>" +
                            "<button type='button' class='btn btn-danger cmtBtnDelete' style='background-color: #b1b1b1; border: none;'>삭제</button>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</li>";

                        $(".comment").parent().eq(0).append(tag);
                    }
                    $('.hideInput').hide();
                    $('.hideBtn').hide();
                    $('.Edit').hide();
                    /* 편집버튼 */
                    $('.cmtBtnEdit').click(function() {
                        var i = $(".cmtBtnEdit").index(this);

                        $('.hideInput').eq(i).show();
                        $(this).hide();
                        alert('댓글에 ID와 비밀번호를 입력해주세요');
                    });


                    /* 유효성검사버튼 */
                    $('.okay').click(function() {
                        var i = $('.okay').index(this);
                        var comment = $(".cmt").eq(i).html();
                        comment = comment.replace(/<br>/g, '\n');
                        $('.Edit').eq(i).text(comment);

                        if ($('.Eid').eq(i).val() == reply[i].id && $('.Epasswd').eq(i).val() == reply[i].passwd) {
                            $('.hideBtn').eq(i).show();
                            $('.hideInput').eq(i).hide();
                            $('.Edit').eq(i).show();
                            $('.cmt').eq(i).hide();
                        } else {
                            alert('ID와Password가 정확하지 않습니다.');
                        }

                    });

                    $(".cmtBtnDelete").click(function() {
                        var j = $(".cmtBtnDelete").index(this);

                        var d = {
                            "no": reply[j].no
                        }
                        $.ajax({
                            type: 'post',
                            typedata: 'json',
                            data: d,
                            url: 'reRemove'
                        }).done()

                        alert("삭제되었습다")
                        $(".comment").empty();
                        Reply();
                    })

                    /* 수정버튼 */
                    $('.cmtBtnUpdate').click(function() {
                        var index = $('.cmtBtnUpdate').index(this);
                        var comment = $(".Edit").eq(index).val();
                        comment = comment.replace(/\n/g, '<br>');
                        var d = {
                            "no": reply[index].no,
                            "comment": comment
                        }
                        $.ajax({
                            type: "post", // post 방식으로 통신 요청
                            url: "reEdit", // Spring에서 만든 URL 호출
                            typedata: "json",
                            data: d
                        }).done(
                            function(result) { // 비동기식 데이터 가져오기

                                alert("수정하였습니다")
                                $('.hideBtn').eq(index).hide();
                                $('.Edit').eq(index).hide();
                                $('.cmt').eq(index).show();
                            });
                        $(".comment").empty();
                        Reply();
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
            
            //게시판 리스트 데이터 불러오기
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
               console.log(data);
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
               console.log();
               createBbs();
            });
         }
            
          function Reply() {
              var d = {
                  "no": no
              };
              $.ajax({
                  type: "post", // post 방식으로 통신 요청
                  url: "replyD", // Spring에서 만든 URL 호출
                  typedata: "json",
                  data: d
              }).done(function(result) { // 비동기식 데이터 가져오기
                  dataJson = JSON.parse(result); // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
                  reply = dataJson.replyD;
                  createCmt();
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
                  <div>
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
    border: none; margin-bottom: 18px;" id="write">글쓰기</button>
                            <div class="col-sm-6 col-sm-offset-3 text-center" style="position:static">
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