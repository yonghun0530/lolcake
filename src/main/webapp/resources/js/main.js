/*
        $(document).ready(function () {


                        var hash = location.hash;
                        if (hash == "") {
                            hash = "#home";
                        }
                        $("a").on("click", function() {
                            hash = $(this).attr("href");
                            htmlLoad();
                        });

                        function htmlLoad() {
                            if (hash == "#comm" | hash == "#home" | hash == "#ranking" | hash == "#champ") {
                                var url = "../html/" + hash.substr(1, hash.length) + ".html";
                                // div 태그 속에 url에서 가져온 데이터 넣기.
                                $("#container").load(url);

                                var index;
                                switch (hash.substr(1, hash.length)) {
                                    case "home":
                                        index = 0;
                                        break;
                                    case "ranking":
                                        index = 1;
                                        break;
                                    case "comm":
                                        index = 2;
                                        break;
                                    case "champ":
                                        index = 3;
                                        break;
                                    default:
                                        break;
                                }

                                $("a").removeClass("on");
                                $("a").eq(index).addClass("on");
                            }

                        }

                        htmlLoad();

                        function popstateEvent(event) {
                            hash = location.hash;
                            if (hash == "") {
                                hash = "#home";
                            }



                            htmlLoad();

                        }


                        $(window).on('popstate', popstateEvent);
        });
*/
