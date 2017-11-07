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
         var id = <%=id%>;
         var data = [];
         console.log("성진아 보아라...",id);
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
                 용훈이_이벤트();
              });
        }
           initData();
           
            function 용훈이_이벤트(){
               $(".user-name").html(data[0].nickname + '    <span>'+ id +'등</span>');
               $("tbody tr td b").html(data[0].LP + "       승률" + data[0].rate + "%");
               $(".tier").html('<img src = "resources/tier/challenger_1.png">' + '<br>' + "Challenger");
            }
            function createHtml() {
              var tag = "";
       
              $(".table-userD tbody").empty();
                  for (var i = 0; i < data.length; i++){
                 if(data[i].result == "win"){
                    tag += '<div class="row 성진">';
//                     tag += '<tr id="color" class="성진" >'; 
                 }else{
                    tag += '<div class="row 용훈">';
//                     tag += '<tr id="color"class="용훈" >';
                 }
                 
                 tag += '<div class="col-xs-7 col-sm-3"><img src="' + data[i].url + '" + style="width: 100%;"></div>';
                 tag += '<div class="col-xs-5 col-sm-2 성훈"><p>랭크게임</p><p>' + data[i].result + '</p><p>' + data[i].kda + '</p><p>' + data[i].time + '</p></div>';
                 tag += '<div class="col-xs-12 col-sm-3"><img src="' + data[i].s1_url + '" class="spell"><img src="' + data[i].s2_url + '" class="spell"><img src="' + data[i].s3_url + '" class="spell"></div>';
                 tag += '<div class="col-xs-6 col-sm-2">아 군<div class="uChamp"><img src="' + data[i].Team1Url + '">' + data[i].Team1Champname + '</div><div class="uChamp"><img src="' + data[i].Team2Url + '">' + data[i].Team2Champname + '</div><div class="uChamp"><img src="' + data[i].Team3Url + '">' + data[i].Team3Champname + '</div><div class="uChamp"><img src="' + data[i].Team4Url + '">' + data[i].Team4Champname + '</div><div class="uChamp"><img src="' + data[i].Team5Url + '">' + data[i].Team5Champname + '</div></div>';
                 tag += '<div class="col-xs-6 col-sm-2">적 군<div class="uChamp"><img src="' + data[i].Other1Url + '">' + data[i].Other1Champname + '</div><div class="uChamp"><img src="' + data[i].Other2Url + '">' + data[i].Other2Champname + '</div><div class="uChamp"><img src="' + data[i].Other3Url + '">' + data[i].Other3Champname + '</div><div class="uChamp"><img src="' + data[i].Other4Url + '">' + data[i].Other4Champname + '</div><div class="uChamp"><img src="' + data[i].Other5Url + '">' + data[i].Other5Champname + '</div></div>';
                 tag += '</div>';
                 
//                  tag += '<td class="result">' + data[i].result + '</td>';
//                  tag += '<td>' + '<img src ="' + data[i].url + '">' + '</td>'
//                  tag += '<td>' + "랭크게임" + '</td>'
//                  tag += '<td>' + data[i].time + '</td>'
//                  tag += '<td>' + '<img src ="' + data[i].s1_url + '" class="spell">' +
//                              '<img src ="' + data[i].s2_url + '" class="spell">' +
//                              '<img src ="' + data[i].s3_url + '" class="spell">' + '</td>'
//                  tag += '<td>' + '<div class="userfont">' + data[i].kda + '</div>' + '</td>'
//                  tag += '<td>' + "아 군" + '<div class="uChamp">' + '<img src ="' + data[i].Team1Url + '">' + data[i].Team1Champname  
//                 + '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Team2Url + '">' + data[i].Team2Champname + '
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Team3Url + '">' + data[i].Team3Champname + 
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Team4Url + '">' + data[i].Team4Champname + 
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Team5Url + '">' + data[i].Team5Champname + 
//                   '</div>' + '</td>'
//                  tag += '<td>' + "적 군" + '<div class="uChamp">' + '<img src ="' + data[i].Other1Url + '">' + data[i].Other1Champname + 
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Other2Url + '">' + data[i].Other2Champname + '
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Other3Url + '">' + data[i].Other3Champname + 
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Other4Url + '">' + data[i].Other4Champname + 
//                   '</div>' + 
//                  '<div class="uChamp">' + '<img src ="' + data[i].Other5Url + '">' + data[i].Other5Champname + 
//                   '</div>' + '</td>'
              }
//                   $(".table-userD tbody").append(tag);
               $("#성진이용").append(tag);
                  
           }
        });
    </script>
    <style>
       .uChamp{
      text-align : left;
   }
   .uChamp img{
      margin-right : 20px;
      width : 30px;
      height : 30px;
   }
      .spell {
         width: calc(100% / 3);
/*          height: 77px; */
         float: left;
      }
      .result { 
         font-size : 20px;
      }
      .성진 {
      background-color: #a3cfec;  
      border : 1px solid #99b9cf;   
      }
      .용훈 {
         background-color: #e2b6b3; 
      border : 1px solid #cea7a7;
      }
      .성훈 {
         font-size: 2rem;
      }
      .container-fluid {
         padding-left: 0;
         padding-right: 0;
      }
    </style>
</head>

<body>
<div class="container-fluid">
    <h1 class="user-name"></h1>
    <table class="table table-filter">
        <thead>
            <tr>
                <td>
                    SOLO RANK
                </td>
                <!-- <td>
                    TEAM RANK
                </td> -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <!-- <img src="http://opgg-static.akamaized.net/images/medals/master_1.png"> -->
                    <p class="tier">Diamond 3</p>
                    <b>32LP</b>
                    <!-- <p><span>101승 94패</span> / 승률52%</p> -->
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="container">
    <h1>전체전적</h1>
    <div id="성진이용"></div>
<!--     <div class="row 성진" id="성진이용"> -->
<!--        <div class="col-xs-7 col-sm-3"><img src="resources/character/MissFortune.png" style="width: 100%;"></div> -->
<!--        <div class="col-xs-5 col-sm-2 성훈"><p>랭크게임</p><p>win</p><p>1/0/2</p><p>44분 21초</p></div> -->
<!--        <div class="col-xs-12 col-sm-3"><img src="resources/spell/SummonerHaste.png" class="spell"><img src="resources/spell/SummonerFlash.png" class="spell"><img src="resources/spell/Destruction.png" class="spell"></div> -->
<!--        <div class="col-xs-6 col-sm-2">아 군<div class="uChamp"><img src="resources/character/Nami.png">나미</div><div class="uChamp"><img src="resources/character/Udyr.png">우디르</div><div class="uChamp"><img src="resources/character/Nocturne.png">녹턴</div><div class="uChamp"><img src="resources/character/Leona.png">레오나</div><div class="uChamp"><img src="resources/character/MissFortune.png">미스 포츈</div></div> -->
<!--        <div class="col-xs-6 col-sm-2">적 군<div class="uChamp"><img src="resources/character/Evelynn.png">이블린</div><div class="uChamp"><img src="resources/character/Volibear.png">볼리베어</div><div class="uChamp"><img src="resources/character/Lissandra.png">리산드라</div><div class="uChamp"><img src="resources/character/Urgot.png">우르곳</div><div class="uChamp"><img src="resources/character/Jhin.png">진</div></div> -->
<!--     </div> -->
<!--     <table class="table table-filter table-userD"> -->
<!--         <tbody> -->
<!--             <tr> -->
<!--                 <td> -->
<!--                     <img class="img-circle" src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1"> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                     <p>일반게임<span>28분14초</span></p> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                     <img src="http://opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=c_scale,w_22&v=1"> -->
<!--                     <img src="http://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=c_scale,w_22&v=1"> -->
<!--                     <img src="http://opgg-static.akamaized.net/images/lol/mastery/6362.png"> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                      <div class="userfont">K/<span>D</span>/A</div> -->

<!--                     <div class="userfont">?/<span>?</span>/?</div> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                      Ally -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">제드 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">한 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">두두 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">세세세 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">네네네네네네네 -->
<!--                     </div> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                     Enemy -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">제드 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">한 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">두두 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">세세세 -->
<!--                     </div> -->
<!--                     <div class="uChamp"> -->
<!--                         <img src="http://opgg-static.akamaized.net/images/lol/champion/Zed.png?image=c_scale,w_46&v=1">네네네네네네네 -->
<!--                     </div> -->
<!--                 </td> -->
<!--             </tr> -->

<!--         </tbody> -->
<!--     </table> -->
</div>
</body>

</html>