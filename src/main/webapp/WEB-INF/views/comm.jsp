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
    var data = []; // 데이터 담을 배열 변수 선언
	var page = 1; // 현재 페이지 값
	var viewRow = 10; // 화면에 보여질 행 갯수
	var totCnt = 0; // 데이터 전체 객수
	
        $(document).ready(function () {
        	
            var $target;
            var hash = location.hash;
            if(hash == ""){
                hash = "#ALL";
            }
            $target = hash.substr(1,hash.length);
            
            initData();
            
/*             if(location.hash == "#FR-W" | location.hash == "#IN-W" | location.hash == "#MO-W"){
                $target = "ALL";
                location.hash = $target;
                pageload();
            }else{
                pageload();
            } */
            
            $('.btn-filter').on('click', function () {
                $target = $(this).data('target');
                location.hash = $target;
                pageload();
            
            });
         
            $('tbody td p').on('click', function () {
                $target = $(this).data('target');
                location.hash = $target;
                pageload();
            
            });
            
            $('#write').on('click', function () {
                $('.container').load('resources/bootjsp/write.html');
                location.hash = "#FR-W";
            });
            
            //타겟에 맞춰서 내용보여주기
            function pageload(){
              if ($target != 'ALL') {
                $('.table tbody tr').css('display', 'none');
                    $('.table tr[data-status="' + $target + '"]').show();
                    $('.divide').show();
                    $('.no').hide();
              } else {
                $('.table tbody tr').css('display', 'none').show();
                $('.no').show();
                $('.divide').hide();
              }
              //제목 부분 바꾸기 
                $('.table-responsive h1').text($target);
            }
            
            //뒤로가기 버튼눌렀을 시 
            function popstateEvent(event) {
                hash = location.hash;
                $target = hash.substr(1,hash.length);
                pageload();
            }
            
            $(window).on('popstate', popstateEvent);
            
            function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
				for (var i = 0; i < data.length; i++) {
					var tag = "";
					tag += '<tr data-status="' + data[i].type + '">';
					tag += '<td class="no">' + data[i].no + '</td>';
					tag += '<td class="divide">' + data[i].divide + '</td>';
					tag += '<td><p class="' + data[i].type + '" data-target="' + data[i].type + '">(' + data[i].type + ')</p></td>';
					tag += '<td>' + data[i].title + '</td>';
					tag += '<td>'+data[i].nickname+'</li>';
					tag += '<td><p>' + data[i].datetime + '</p><i><img src="resources/bootjsp/img/like.png">'+ data[i].hit +'<img src="resources/bootjsp/img/click.png">'+ data[i].hit +'</i></td>';
					tag += '</tr>';
					$("tbody").append(tag);
				}
            	
			}
            function createPaging() {
				var paging = totCnt / viewRow;
				// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
				//$("#tbody").empty(); // 초기화

				$("#pagination a").off().on("click", function() {
					
					page = $(this).text();
					console.log(page);
					setTimeout(function() {
						initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
					}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
				});
			}
            
            function initData() { // 디비에서 데이터 가져오기 위한 함수
				hash = location.hash;
	            if(hash == ""){
	                hash = "#ALL";
	            }else{
					page = hash.substr(1, hash.length);
				}

				var end = (viewRow * page);
				var start = (end - viewRow);

				$.ajax({
					type : "post", // post 방식으로 통신 요청
					url : "allData", // Spring에서 만든 URL 호출
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
					totCnt = dataJson.totCntall.tot;
					console.log(totCnt);
					createHtml(); // 화면에 표현하기 위하여 함수 호출
					createPaging();
					pageload();
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
                        <a href="resources/bootjsp/comm.html" class="active">
                            <h4>커뮤니티</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resources/bootjsp/champ.html">
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
                                  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                  <li><a href="#">2</a></li>
                                  <li><a href="#">3</a></li>
                                  <li><a href="#">4</a></li>
                                  <li><a href="#">5</a></li>
                                  <li><a href="#">»</a></li>
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