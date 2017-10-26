<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lolCake</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	html, body { padding: 0; margin: 0; background-color: #fff4f4; }
	ul { list-style: none; padding-left: 0; margin: 0; }
	li { display: inline-block; float: left; }
	h1, h2, h3, h4, h5 { margin: 0; color: white; }
	header { width: 100%; height: 22px; background-color: black; position: fixed; top: 0; left: 0; }
	header ul { width: 88px; padding-left: calc(50% - 44px); display: inline-block; }
	header ul li { padding: 0 5px; }
	header ul li a { width: 12px; height: 12px; border-radius: 6px; display: inline-block; background-color: red; }
	header ul li a h4 { position: absolute; top: 22px; left: 0; width: 100%; height: 28px; text-align: center; background-color: #ffd295; display: none; }
	header ul li a h4:after {border-left: 10px solid transparent; border-right: 10px solid transparent; border-bottom: 10px solid #ffd295; content: ""; position: absolute; top: -10px; left: calc(50% - 10px); }
	section { margin-top: 70px; }
	footer { clear: both; text-align: center; margin-top: 50px; }
	footer .sub { margin-left: calc(50% - 78px); }
	footer ul li { margin: 0 10px; }
	footer ul li img { width: 32px; }
	footer .copyright { clear: both; }
	.on { background-color: blue; }
	.on h4 { display: block; }
</style>
<link rel="stylesheet" href="/lolcake/resources/css/main2.css">
<script>
	$(document).ready(function(){
		$("header a").on("click", function(){
			var hash = $(this).attr("href");
			initHashCheck(hash, "", true);
		});
		initHashCheck(location.hash, "");
	});
	function initHashCheck(hash, select, click){
		if(hash == ""){
			hash = "#home";
			select = $("header a").eq(0);
		}else{
			if(select == ""){
				if(hash == "#comm"){
					select = $("header a").eq(2);
					hash = "#comm/HOT";
				}
			}
		}
		var ds = getHashData(hash);
		var url = "/lolcake/resources/html/" + ds[0] + ".html #container";
        // div 태그 속에 url에서 가져온 데이터 넣기.
        $("section").load(url, function(d, s, x) {
            if (s == "error") { // 오류 발생 시 (404, 500) 등등...
                alert("잘못된 주소를 입력하셨습니다. 처음으로 돌아 갑니다.");
                location.href = "home.html"; // 화면 다시 읽어 오게 만든다.
            }else{
            	if(ds[0] == "comm"){
            		commCreateEvent(click, ds[1]);
            	}               	
            }
        });
        
        if(ds[0] == "home"){
			select = $("header a").eq(0);
		}else if(ds[0] == "ranking"){
			select = $("header a").eq(1);
		}else if(ds[0] == "comm"){
			select = $("header a").eq(2);
		}else if(ds[0] == "champ"){
			select = $("header a").eq(3);
		}
        console.log(ds, select);
        $("header a").removeClass("on");
        $(select).addClass("on");
	}
	function getHashData(hash){
		var sj = hash.substr(1, hash.length);
		var ds = sj.split("/");
		return ds;
	}
	function commCreateEvent(click, menu){
		if(menu == "HOT"){
			commGetDataEvent("bbshotData", 0);
		}else if(menu == "FR"){
			commGetDataEvent("bbsfrData", 1);
		}else if(menu == "IF"){
			commGetDataEvent("bbsifData", 2);
		}else if(menu == "MD"){
			commGetDataEvent("bbsmdData", 3);
		}
		
		$(".commenu a").on("click", function(){
			var index = $(".commenu a").index(this);
			var href = $(this).attr("href");
			var ds = getHashData(href);
			// 데이터 가공...
			var url = "";
			if(ds[1] == "HOT"){
				url = "bbshotData";
			}else if(ds[1] == "FR"){
				url = "bbsfrData";
			}else if(ds[1] == "IF"){
				url = "bbsifData";
			}else if(ds[1] == "MD"){
				url = "bbsmdData";
			}else{
				alert("너의 잘 못이란....");
				return false;
			}
			commGetDataEvent(url, index);
		});
	}
	function commGetDataEvent(url, index){
		$.ajax({type:"post", url:url, datatype:"json"}).done(function(result){
			commCreateHTML(result.list, index);
		});
	}
	function commCreateHTML(data, click){
		$(".board-body").empty();
		for(var i = 0; i < data.length; i++){
     	   var tag = "";
     	   tag += '<ul class="board-body">';
     	   tag += '<li>'+data[i].divide+'</li>';
     	   tag += '<li>'+data[i].viewType+'</li>';
     	   tag += '<li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>';
     	   tag += '<li>'+data[i].title+'</li>';
     	   tag += '<li>'+data[i].nickname+'</li>';
     	   tag += '<li>'+data[i].datetime+'</li>';
     	   tag += '<li>'+data[i].hit+'</li>';
     	   tag += '</ul>';
           $("#videoDetail #sections").append(tag);
        }
		
		commClickBG(click);
	}
	function commClickBG(index){
		$('.commenu ul li a').removeClass("on");
        $('.commenu ul li a').eq(index).addClass("on");
        $('.commenu ul li').css("background-color", "white");
        $('.commenu ul li').eq(index).css("background-color", "#36161c");
	}
</script>
</head>
<body>
	<header>
		<ul>
            <li>
                <a href="#home" class="on">
                    <h4>HOME</h4>
                </a>
            </li>
            <li>
                <a href="#ranking">
                    <h4>랭킹</h4>
                </a>
            </li>
            <li>
                <a href="#comm">
                    <h4>커뮤니티</h4>
                </a>
            </li>
            <li>
                <a href="#champ">
                    <h4>챔피언</h4>
                </a>
            </li>
        </ul>
	</header>
	<section>내용</section>
	<footer>
		<div class="basic">
            <p>서울시 금천구 가산디지털2로 115 대륭테크노타운3차 <span>|</span>Goodee<span>|</span>김성진 임채영 주용훈 최혁<span>|</span>사업자 등록번호 119-86-83838</p>
        </div>
        <div class="sub">
            <ul>
                <li>
                    <a class="fb" href="http://www.facebook.com/1lolcake2/"><img src="../img/002-facebook-logo-button.png"></a>
                </li>
                <li>
                    <a class="gram" href="https://www.instagram.com/lolcake.yum/"><img src="../img/001-instagram-logo.png"></a>
                </li>
                <li>
                    <a href="https://kr.leagueoflegends.com/"><img class="lol" src="../img/lol.png"></a>
                </li>
            </ul>
        </div>
        <div class="copyright">
            <h6>Copyright(c) LoLcake^^Yum</h6>
        </div>
	</footer>
</body>
</html>