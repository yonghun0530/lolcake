<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	if(no == null){
		response.sendRedirect("champ");
	}
%>
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
			var no = <%=no%>;
			var data = [];
			$.ajax({
				type : "post", // post 방식으로 통신 요청
				url : "champDetailData", // Spring에서 만든 URL 호출
				typedata : "json",
				data : {no : no}
			}).done(function(result) { // 비동기식 데이터 가져오기
				data = result.data;
				$("#champImg").attr("src",  data[0].path + "/" + data[0].img);
				$("tbody").empty();
				for(var i = 0; i < result.data.length; i++){
					console.log(result.data[i]);
					$("#skills img").eq(i).attr("src",  data[i].skill_path + "/" + data[i].skill_img);
					$("tbody").append("<tr><td>" + data[i].skillname + "</td><td>" + data[i].dept + "</td></tr>");
				}
			});
			
			$("#skills img").on("click", function(){
				var i = $("#skills img").index($(this));
				var html = '<div style="text-align: center;"><img src="resources/bootjsp/img/LOL.jpg" style="width:80%;"></div>';
				if(data[i].media_url != undefined ){
					html = '<video class="skill-video" controls autoplay loop><source src="'+data[i].media_path + data[i].media_url+'" type="video/mp4">Your browser does not support HTML5 video.</video>';
				}
				$(".modal-dialog").empty().html(html);
				$("#myModal").modal("show");
			});
        });
    </script>
</head>

<body>

    <h1>CHAMPION INFO</h1>
    <div class="row">
        <div class="col-md-7 col-sm-7 col-xm-7 champ-skill">
            <div class="col-md-3 col-xm-3 col-sm-3">
                <img src="http://placehold.it/200x200" alt="" id="champImg">
            </div>
            <div class="col-md-7 col-sm-7 col-xm-7 skill" id="skills">
                <p>챔피언이름<span>상위 몇퍼센트</span></p>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                </div>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>Q</p>
                    </div>
                </div>
                <div>
                    <img  src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>W</p>
                    </div>
                </div>
                <div>
                    <img  src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>E</p>
                    </div>
                </div>
                <div>
                    <img  src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>R</p>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 skillinfo">
            <table class="table table-filter table-champ">
                <thead>
                    <tr>
                        <td>스킬명</td>
                        <td>설명</td>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </div>

</body>

</html>
