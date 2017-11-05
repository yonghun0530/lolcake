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
			console.log(no);
			
			$.ajax({
				type : "post", // post 방식으로 통신 요청
				url : "champDetailData", // Spring에서 만든 URL 호출
				typedata : "json",
				data : {no : no}
			}).done(function(result) { // 비동기식 데이터 가져오기
// 				console.log(result);
				$("#champImg").attr("src",  result.data[0].path + "/" + result.data[0].img);
				$("iframe").attr("src", result.data[0].media_path + "/" + result.data[0].media_url);
				$("tbody").empty();
				for(var i = 0; i < result.data.length; i++){
// 					console.log(result.data[i]);
					$("#skills img").eq(i).attr("src",  result.data[i].skill_path + "/" + result.data[i].skill_img);
					$("tbody").append("<tr><td>" + result.data[i].skillname + "</td><td>" + result.data[i].dept + "</td></tr>");
				}
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
                    <img src="http://placehold.it/200x200" alt="" data-toggle="modal" data-target="#myModal">
                </div>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>Q</p>
                    </div>
                </div>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>W</p>
                    </div>
                </div>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>E</p>
                    </div>
                </div>
                <div>
                    <img src="http://placehold.it/200x200" alt="">
                    <div class='img-footer'>
                        <p>R</p>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <iframe class="skill-video" src="//cdn.leagueoflegends.com/champion-abilities/videos/mp4/0086_01.mp4" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 skillinfo">
            <table class="table table-filter table-champ">
                <thead>
                    <tr>
                        <td>
                            스킬명
                        </td>
                        <td>
                            설명
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            ㅂㄷㄼㄷㄼㄷㄼㄷㄹ
                        </td>
                        <td>
                            ㄷㄼㄷㄼㄷㄼㄷㄹㄷㅂㄹㄷㅂㄼㄷㄹㄷㄼㄷㄹㄷㅂㄹㄷㅂㄹㄷㅂㄹㄷㅂㄼㄷㄼㄷㄹ
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

</body>

</html>
