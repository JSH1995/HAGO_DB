<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-14
  Time: 오후 6:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=1040">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>하고(Hago)</title>
    <jsp:include page="../../common/style.jsp" flush="false"/>
    <jsp:include page="../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../common/font.jsp" flush="false"/>
    <link href="../../resources/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/carousel/all.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<script>
    $(document).ready(function () {
        var auth = 'auth';
        console.log('auth : ' + (auth != null));
    })
</script>
<div class="col-xs-2 col-sm-2 col-md-2">
    <img src="../../resources/images/main_content_sample1.svg" style="height: 130px;">
    <img class="position-relative" src="../../resources/images/delete_contents.png" style="top: 0; right: 0;"/>
    <div class="content-my-title-text mt-2">asdfasdf</div>
    <div class="content-my-subtitle-text mt-1">detail</div>
    <div class="pt-2 pl-4 pr-5">
        <img src="../../resources/images/main_go.svg" style="height: 25px;">
    </div>
</div>

<div class="carousel-item active">
    <div class="col-12 col-md-2 p-0 m-0 p-2">
        <div class="card mb-2 border-0">
            <img class="card-img-top" style="height: 156px;"
                 src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg"
                 alt="Card image cap">
            <div class="card-body">
                <h4 class="align-items-center d-flex justify-content-center card-title text-black-color form-title-text-mini mb-0"
                    style="width:100% !important;height: 50px !important;">${content.title}</h4>
                <div class="align-items-center d-flex justify-content-center" style="height: 150px !important;">
                    <p class="card-text text-grayDark-color button-text-mini">${content.detail}</p>
                </div>
                <button class="btn btn-block button-craft2" style="width: 107px;height: 30px;"><img
                        width="25" height="11"
                        src="../../resources/images/go.svg"/></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
