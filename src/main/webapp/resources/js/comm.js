$(document).ready(function() {

            var hash = location.hash;
            if (hash == "") {
                hash = "#HOT";
            }

            $('.commenu ul li a').off().on("click", function() {
                var index = $('.commenu ul li a').index(this);
                menubar(index);
            });
            
            $('#insert').off().on("click", function() {
                location.hash = "#FR-W";
                $("#container").load("../html/write.html");
            });
            
            if(location.hash == "#FR-W" | location.hash == "#IF-W" | location.hash == "#MD-W"){
                location.hash = "#HOT";
                pageload();
            }else{
                pageload();
            }
            

            function popstateEvent(event) {
                hash = location.hash;
                if (hash == "") {
                    hash = "#HOT";
                }
                pageload();
            }

            $(window).on('popstate', popstateEvent);

            function pageload() {
                var index;
                switch (hash.substr(1, hash.length)) {
                    case "HOT":
                        index = 0;
                        //$(".board-body").load("");
                        break;
                    case "FR":
                        index = 1;
                        $("#videoDetail #sections").empty(); // 초기화
                        $(".board-body").load("/lolcake/bbsfr");
                        break;
                    case "IF":
                        index = 2;
                        $(".board-body").load("");
                        break;
                    case "MD":
                        index = 3;
                        break;
                    case "FR-W":
                        index = 0;
                        $(".moviewrite").hide();
                        $(".bbswrite").show();
                        break;
                    case "IF-W":
                        index = 1;
                        $(".moviewrite").hide();
                        $(".bbswrite").show();
                        break;
                    case "MD-W":
                        index = 2;
                        $(".moviewrite").show();
                        $(".bbswrite").hide();
                        break;
                }
                menubar(index);
            }

            function menubar(index) {
                $('.commenu ul li a').removeClass("on");
                $('.commenu ul li a').eq(index).addClass("on");
                $('.commenu ul li').css("background-color", "white");
                $('.commenu ul li').eq(index).css("background-color", "#36161c");
            }
        }); 
