$(document).ready(function() {
            $('#menu > ul > li').mouseup(function() {
                var idx = $('#menu > ul > li').index(this);
                $('#menu > ul > li').removeClass('on').addClass('off');
                $('#menu > ul > li').eq(idx)
                    .addClass('on').removeClass('off');
                $('#menu > ul > li').eq(4).removeClass('off').removeClass('on');

            });
            
            var data = []; // 데이터 담을 배열 변수 선언
            var page = 1; // 현재 페이지 값
            var viewRow = 10; // 화면에 보여질 행 갯수
            var totCnt = 0; // 데이터 전체 객수
            
            function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
            	console.log(data);
               for(var i = 0; i < data.length; i++){
            	   var tag = "";
            	   tag += '<ul class="board-body">';
            	   tag += '<li>'+data[i].no+'</li>';
            	   tag += '<li>'+data[i].viewType+'</li>';
            	   tag += '<li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>';
            	   tag += '<li>'+data[i].title+'</li>';
            	   tag += '<li>'+data[i].nickname+'</li>';
            	   tag += '<li>'+data[i].datetime+'</li>';
            	   tag += '<li>'+data[i].hit+'</li>';
            	   tag += '</ul>';
                  $("#videoDetail #sections").append(tag);
               }
            }
            
            function initData(){ // 디비에서 데이터 가져오기 위한 함수
               $.ajax({
                     type:"post", // post 방식으로 통신 요청
                     url:"bbshotData", // Spring에서 만든 URL 호출
                     typedata: "json"
               }).done(function(result){ // 비동기식 데이터 가져오기
                  data = result.list; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
                  totCnt = result.cnt.cnt;
                  createHtml(); // 화면에 표현하기 위하여 함수 호출
               });
            }
            
            $("a").on("click", function(){
            	hash = $(this).attr("href");
            	page = hash.substr(1, hash.length);
            	console.log(page);
            });
            
            initData();
         });
       
