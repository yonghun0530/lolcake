var data = []; // 데이터 담을 배열 변수 선언
	var page = 1; // 현재 페이지 값
	var viewRow = 10; // 화면에 보여질 행 갯수
	var totCnt = 0; // 데이터 전체 객수
	$(document)
			.ready(
					function() {
						$('#menu > ul > li').mouseup(
								function() {
									var idx = $('#menu > ul > li').index(this);
									$('#menu > ul > li').removeClass('on')
											.addClass('off');
									$('#menu > ul > li').eq(idx).addClass('on')
											.removeClass('off');
									$('#menu > ul > li').eq(4).removeClass(
											'off').removeClass('on');
								});

						 function createHtml() { // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
							//             	console.log(data);
							$("#videoDetail #sections .board-body").empty();

							for (var i = 0; i < data.length; i++) {
								var tag = "";
								tag += '<ul class="board-body">';
								tag += '<li>' + data[i].divide + '</li>';
								tag += '<li>영상</li>';
								tag += '<li>' + data[i].title + '</li>';
								tag += '<li><img src="http://www.op.gg/forum/outImage/https://i.ytimg.com/vi/YBXTf1gSr_A/hqdefault.jpg"></li>';
								tag += '<li>' + data[i].nickname + '</li>';
								tag += '<li>' + data[i].time + '</li>';
								tag += '<li>' + data[i].hit + '</li>';
								tag += '</ul>';
								$("#videoDetail #sections").append(tag);
							}
						} 

						function createPagingmd() {
							var paging = totCnt / viewRow;
							// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
							$("#paging").empty(); // 초기화
							for (var i = 0; i < paging; i++) {
								$("#paging").append(
										"<a href='#" + (i + 1) + "'>" + (i + 1)
												+ "</a>")
							}

							$("#paging a").off().on("click", function() {
								
								page = $(this).text();
								console.log(page);
								setTimeout(function() {
									initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
								}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
							});

						}

						function initDatamd() { // 디비에서 데이터 가져오기 위한 함수
							var hash = location.hash;

							if (hash != "") {
								page = hash.substr(1, hash.length);
							}

							var end = (viewRow * page);
							var start = (end - viewRow);

							$.ajax({
								type : "post", // post 방식으로 통신 요청
								url : "listDatamd", // Spring에서 만든 URL 호출
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
								totCnt = dataJson.totCntmd.tot;
								console.log(totCnt);
								commCreateHTML(); // 화면에 표현하기 위하여 함수 호출
								createPagingmd();
							});
						}

						// 						$("#paging a").off().on("click", function() {
						// // 							hash = $(this).attr("href");
						// // 							page = hash.substr(1, hash.length);
						// // 							console.log(page);

						// 						});

						initData();
					});