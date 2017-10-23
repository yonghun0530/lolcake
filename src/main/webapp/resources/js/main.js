function readyEvent(){    
    $(document).on('click', '#menu a', function(event){
    
    var url = event.target.href;
    /* 브라우저 히스토리 내용 담기 */
    history.pushState(null, null, url);
    /* 변경 내용 적용 : 링크 시 url 이벤트 처리 */
    $('#container').load(url + ' #container');
    /* URL 주소로 이동을 막기 */
    event.preventDefault();
    });
}

function popstateEvent(event){
    /* 변경 내용 적용 : 브라우저 콘트롤 버튼 이벤트 처리 */
    $('#container').load(location.href + ' #container');
}

$(document).ready(readyEvent);
    
$(window).on('popstate', popstateEvent);