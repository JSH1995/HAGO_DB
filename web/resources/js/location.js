function getLocation(url) {
    var form = document.createElement("form");
    form.setAttribute("method", "GET");
    form.setAttribute("action", url);
    console.log("getLocation");
    $(document.body).append(form);
    form.submit();
}
function postDetailAction(content_no){
    /*/detail.do?content_no=40*/
    console.log('postDetailAction');
    var form = document.createElement("form");
    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "content_no");
    input.setAttribute("value", content_no);
    form.appendChild(input);
    form.setAttribute("method", "POST");
    form.setAttribute("action", '/detail.do');
    $(document.body).append(form);
    form.submit();
}
function getLocationMain(url, study) {
    console.log('getLocationMain');
    var form = document.createElement("form");
    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "type");
    input.setAttribute("value", study);
    form.appendChild(input);
    form.setAttribute("method", "POST");
    form.setAttribute("action", url);
    $(document.body).append(form);
    form.submit();
}

function postLocation(url) {
    var form = document.createElement("form");
    form.setAttribute("method", "POST");
    form.setAttribute("action", url);
    $(document.body).append(form);
    form.submit();
}

function postLocation(url) {
    var form = document.createElement("form");
    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "type");
    input.setAttribute("value", "authed");
    form.setAttribute("method", "POST");
    form.setAttribute("action", url);
    $(document.body).append(form);
    form.submit();
}