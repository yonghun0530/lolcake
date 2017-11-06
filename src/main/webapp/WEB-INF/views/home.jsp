<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
            $('')
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
                        <a href="/lolcake/" class="active">
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
                        <a href="/lolcake/champ">
                            <h4>챔피언</h4>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:70px">
        <div class="col-md-6 col-md-offset-3" style="text-align: center">
            <img src="resources/bootjsp/img/logo.png">
            <div id="imaginary_container">
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                    </button>
                    </span>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <h1>BEST BOARD</h1>
                            <table class="table table-filter table-comm">
                                <tbody>
                                    <tr data-status="INFO">
                                        <td>
                                            35
                                        </td>
                                        <td>
                                            <p class="info" data-target="INFO">(INFO)</p>
                                        </td>
                                        <td>
                                            제목입니다1
                                        </td>
                                        <td>
                                            임채영
                                        </td>
                                        <td>
                                            <p>2017/03/1</p>
                                            <i><img src="resources/bootjsp/img/like.png">255<img src="resources/bootjsp/img/click.png">365</i>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <h1>BEST MOVIE</h1>
                            <table class="table table-filter table-comm">
                                <tbody>
                                    <tr data-status="MOVIE">
                                        <td>
                                            755555
                                        </td>
                                        <td>
                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScPyG0_I6eKBwQBe54Lruefp6QodA9H3-md_VjWycwKzsjL_0D" class="media-photo">
                                            <p class="movie" data-target="MOVIE">(MOVIE)</p>
                                        </td>
                                        <td>
                                            제목입니다2
                                        </td>
                                        <td>
                                            최혁
                                        </td>
                                        <td>
                                            <p>2017/03/1</p>
                                            <i><img src="resources/bootjsp/img/like.png">255<img src="resources/bootjsp/img/click.png">365</i>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
