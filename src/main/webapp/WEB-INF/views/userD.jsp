<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String id = request.getParameter("id");
   if(id == null){
      response.sendRedirect("ranking");
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
    <script type="text/javascript">
        $(document).ready(function() {
         var id = 1;
         var data = [];
           function initData(){
               var d = {"id" : id}; 
              $.ajax({
                 type : "post", //post 방식
                 url : "userDData",
                 typedata : "json",
                 data : d 
              }).done(function(result) { 
                 console.log(result);
                 data = result.list;
                 console.log(data);
                 createHtml();
                 userHead();
              });
        	}
           initData();
           
            function userHead(){
               $(".user-name").html(data[0].nickname + '<span>'+ id +'등</span>');
               $(".table-user tbody tr td b").html(data[0].LP);
               $(".table-user tbody tr td p").html("승률" + data[0].rate + "%")
               $(".tier").html('<img src = "resources/tier/challenger_1.png">' + '<br>' + "Challenger");
            }
            function createHtml() {
              var tag = "";
       
              $(".table-userD tbody").empty();
                  for (var i = 0; i < data.length; i++){
                 if(data[i].result == "win"){
                    tag += '<tr class="row win">';
                 }else{
                    tag += '<tr class="row lose">';
                 }               
                 tag += '<td><img class="img-circle" src="' + data[i].url + '"></td>';
                 tag += '<td><p>랭크게임</p><p>' + data[i].result + '</p>'+'<p>' + data[i].kda + '</p><p>' + data[i].time + '</p></td>';
                 tag += '<td><img src="' + data[i].s1_url + '" class="spell"><img src="'+ data[i].s2_url + '" class="spell"><img src="' + data[i].s3_url + '" class="spell"></td>';
                 tag += '<td>아 군<div class="uChamp"><img src="' + data[i].Team1Url + '">' + data[i].Team1Champname + '</div><div class="uChamp"><img src="' + data[i].Team2Url + '">' + data[i].Team2Champname + '</div><div class="uChamp"><img src="' + data[i].Team3Url + '">' + data[i].Team3Champname + '</div><div class="uChamp"><img src="' + data[i].Team4Url + '">' + data[i].Team4Champname + '</div><div class="uChamp"><img src="' + data[i].Team5Url + '">' + data[i].Team5Champname + '</div></td>';
                 tag += '<td>적 군<div class="uChamp"><img src="' + data[i].Other1Url + '">' + data[i].Other1Champname + '</div><div class="uChamp"><img src="' + data[i].Other2Url + '">' + data[i].Other2Champname + '</div><div class="uChamp"><img src="' + data[i].Other3Url + '">' + data[i].Other3Champname + '</div><div class="uChamp"><img src="' + data[i].Other4Url + '">' + data[i].Other4Champname + '</div><div class="uChamp"><img src="' + data[i].Other5Url + '">' + data[i].Other5Champname + '</div></td>';
                 tag += '</tr>';

              }
               $(".table-userD tbody").append(tag);
                  
           }
        });
    </script>
</head>

<body>
<div class="container-fluid">
    <h1 class="user-name"></h1>
    <table class="table table-filter table-user">
        <thead>
            <tr>
                <td>
                    SOLO RANK
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <p class="tier"></p>
                    <b></b>
                    <p></p>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="container">
    <h1>전체전적</h1>
    <table class="table table-filter table-userD">
        <tbody>
        </tbody>
    </table>
</div>
</body>

</html>