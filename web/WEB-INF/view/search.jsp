<%--Created by IntelliJ IDEA.
User: zlzld
Date: 2020-03-23
Time: 오후 5:44
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="models.ContentsForTypes" %>
<%@ page import="models.AdminManage" %>
<%
    ContentsForTypes contents = (ContentsForTypes) request.getAttribute("contents");
    request.setAttribute("contents", contents);
    AdminManage admin = (AdminManage) request.getAttribute("admin");
    request.setAttribute("admin",admin);
%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=1040">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Search</title>
    <jsp:include page="../../common/style.jsp" flush="false"/>
    <jsp:include page="../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../common/font.jsp" flush="false"/>
    <jsp:include page="../../common/util.jsp" flush="false"/>
    <link href="../../resources/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/carousel/all.css" rel="stylesheet" type="text/css"/>
    <style>
        .t-3 {
            margin-top: 30px;
        }

        video:focus {
            outline: none;
        }

        .col-md-3 {
            display: inline-block;
            margin-left: -8px !important;
        }

        .col-md-3 img {
            width: 100%;
            height: auto;
        }

        body .carousel-indicators li {
            background-color: red;
        }

        body .carousel-indicators {
            bottom: 0;
        }

        body .carousel-control-prev-icon,
        body .carousel-control-next-icon {
            background-color: red;
        }

        body .no-padding {
            padding-left: 0;
            padding-right: 0;
        }
    </style>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="text-center">
    <div style="height: 450px;">
        <img id="main-banner" class="position-absolute" style="height: 450px; top: 76px; left: 0;"
             src="<%=request.getContextPath()%>${admin.bannerAll}"/>
    </div>
    <div class="container mt-4 pt-4">
        <div class="position-relative">
            <form id="form-search" onsubmit="return checkSearchValue()" method="get" action="/search.do">
                <input id="inputSearch" placeholder="쉽게 배우는 골드버그를 검색해보세요." type="text" class="position-absolute search"
                       name="inputSearch"
                       style="top:50%;left: 50%; transform: translate(-50%,-50%);"/>
            </form>
            <span class="position-relative" style="left: 30%; top:0;"><svg fill="#53BAFF"
                                                                           xmlns="http://www.w3.org/2000/svg"
                                                                           width="24"
                                                                           height="24" viewBox="0 0 24 24"><path
                    d="M23.809 21.646l-6.205-6.205c1.167-1.605 1.857-3.579 1.857-5.711 0-5.365-4.365-9.73-9.731-9.73-5.365 0-9.73 4.365-9.73 9.73 0 5.366 4.365 9.73 9.73 9.73 2.034 0 3.923-.627 5.487-1.698l6.238 6.238 2.354-2.354zm-20.955-11.916c0-3.792 3.085-6.877 6.877-6.877s6.877 3.085 6.877 6.877-3.085 6.877-6.877 6.877c-3.793 0-6.877-3.085-6.877-6.877z"/></svg></span>
        </div>
        <div class="mt-5 text-center">
            <%--Template-all--%>
            <div class="template">
                <%--검색 컨텐츠--%>
                <div id="layout-study">
                    <div class="profile-name-text text-Dark-color mt-5 ml-2 pt-5 my-auto text-center">
                        <img class="mr-1 mb-1" style="vertical-align: sub;"
                             src="../../resources/images/main_search.svg"/>
                        <span class="title-main-text">검색 컨텐츠</span>
                    </div>
                    <div class="mt-2 text-center">
                        <span class="text-grayDark-color ">검색을 통해 원하는 콘텐츠의 정보를 확인하고 학습해보세요!</span>
                    </div>
                    <div class="row justify-content-center m-4">
                        <button onclick="searchSubMenuOnClickFunction(this);" id="search-button-science"
                                class="btn button-craft3 shadow-sm"><img width="35" height="35"
                                                                         id="search-button-science-img" class="mr-3"
                                                                         src="../../resources/images/science.svg"/>과학
                        </button>
                        <button onclick="searchSubMenuOnClickFunction(this);" id="search-button-social"
                                class="btn button-craft3 shadow-sm"><img width="35" height="35"
                                                                         id="search-button-social-img" class="mr-3"
                                                                         src="../../resources/images/social.svg"/>사회
                        </button>
                        <button onclick="searchSubMenuOnClickFunction(this);" id="search-button-language"
                                class="btn button-craft3 shadow-sm"><img width="35" height="35"
                                                                         id="search-button-language-img" class="mr-3"
                                                                         src="../../resources/images/language.svg"/>국어
                        </button>
                        <button onclick="searchSubMenuOnClickFunction(this);" id="search-button-math"
                                class="btn button-craft3 shadow-sm"><img width="35" height="35"
                                                                         id="search-button-math-img" class="mr-3"
                                                                         src="../../resources/images/math.svg"/>수학
                        </button>
                    </div>

                    <div class="carousel slide" data-ride="carousel">
                        <!-- The slideshow -->
                        <div id="search1" class="container no-padding">
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample1.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample3.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample2.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample4.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample4.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample2.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample3.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample1.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
<script src="../../../resources/js/inspect.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        var max = ${contents.sciences.size()*1};
        for (var i = 0; i < 3; i++) {
            switch (i) {
                case 0:
                    if (max <${contents.socials.size()*1}) {
                        max = ${contents.socials.size()*1}
                            console.log('max : ' + max);
                    }
                    break;
                case 1:
                    if (max <${contents.languages.size()*1}) {
                        max = ${contents.languages.size()*1}
                            console.log('max : ' + max);
                    }
                    break;
                case 2:
                    if (max <${contents.maths.size()*1}) {
                        max = ${contents.maths.size()*1}
                            console.log('max : ' + max);
                    }
                    break;
            }
        }
        for (var i = 0; i < 4; i++) {
            switch (i) {
                case 0:
                    if (max ==${contents.sciences.size()*1}) {
                        $('#search-button-science').click();
                    }
                    break;
                case 1:
                    if (max ==${contents.socials.size()*1}) {
                        $('#search-button-social').click();
                    }
                    break;
                case 2:
                    if (max ==${contents.languages.size()*1}) {
                        $('#search-button-language').click();
                    }
                    break;
                case 3:
                    if (max ==${contents.maths.size()*1}) {
                        $('#search-button-math').click();
                    }
                    break;
            }
        }
    });

    function searchContentsSetting(type) {
        if (type == 'science') {
            console.log('searchContentsSetting' + type);
            $('#search1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.sciences.size()}">
            console.log('searchContents Setting count : ${status.count}');
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:otherwise>
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            $('#search1').html(html);
        } else if (type == 'social') {
            console.log('studyContentsSetting' + type);
            $('#search1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.socials.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:otherwise>
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            $('#search1').html(html);
        } else if (type == 'language') {
            console.log('studyContentsSetting' + type);
            $('#search1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.languages.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:otherwise>
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            $('#search1').html(html);
        } else if (type == 'math') {
            console.log('studyContentsSetting' + type);
            $('#search1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.maths.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.category}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.category}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:otherwise>
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.category}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.category}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            $('#search1').html(html);
        }
    }

    function searchSubMenuOnClickFunction(type) {
        console.log('search.jsp', ' 169 ', 'Log is : ', type);
        $('#search-button-science').removeClass("opacity-full");
        $('#search-button-social').removeClass("opacity-full");
        $('#search-button-language').removeClass("opacity-full");
        $('#search-button-math').removeClass("opacity-full");
        if (type !== null) {
            switch (type.id) {
                case 'search-button-science':

                    $('#search-button-science').addClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-language').removeClass("opacity-full text-white-color");
                    $('#search-button-math').removeClass("opacity-full text-white-color");

                    $('#search-button-science-img').attr("src", "../../resources/images/tab_science_white.svg");
                    $('#search-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#search-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#search-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#search-button-social').addClass("text-black-color");
                    $('#search-button-language-img').addClass("text-black-color");
                    $('#search-button-math-img').addClass("text-black-color");

                    searchContentsSetting('science');
                    break;
                case 'search-button-social':
                    console.log('study button social');
                    $('#search-button-social').addClass("opacity-full text-white-color  button-main-tab");
                    $('#search-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-language').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#search-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#search-button-social-img').attr("src", "../../resources/images/tab_society_white.svg");
                    $('#search-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#search-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#search-button-science').addClass("text-black-color");
                    $('#search-button-language-img').addClass("text-black-color");
                    $('#search-button-math-img').addClass("text-black-color");

                    searchContentsSetting('social');
                    break;
                case 'search-button-language':
                    $('#search-button-language').addClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#search-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#search-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#search-button-language-img').attr("src", "../../resources/images/tab_language_white.svg");
                    $('#search-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#search-button-science').addClass("text-black-color");
                    $('#search-button-social-img').addClass("text-black-color");
                    $('#search-button-math-img').addClass("text-black-color");

                    searchContentsSetting('language');
                    break;
                case 'search-button-math':

                    $('#search-button-math').addClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#search-button-language').removeClass("opacity-full text-white-color button-main-tab");

                    $('#search-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#search-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#search-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#search-button-math-img').attr("src", "../../resources/images/tab_math_white.svg");

                    $('#search-button-science').addClass("text-black-color");
                    $('#search-button-social-img').addClass("text-black-color");
                    $('#search-button-language-img').addClass("text-black-color");

                    searchContentsSetting('math');
                    break;
            }
        } else {
            $('#search-button-science').addClass("opacity-full text-white-color button-main-tab");
            $('#search-button-science-img').attr("src", "../../resources/images/main_sience_on.svg");
            searchContentsSetting('science');
        }
        /*ajax data getter for button types*/
    }

    function goClicked(content_no){
        postDetailAction(content_no);
    }

    function checkSearchValue() {
        var checkValue = false;
        checkValue = inspection('inputSearch', 'search') ? true : false;
        return checkValue;
    }
</script>
</body>
</html>
