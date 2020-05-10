<%@ page import="models.MainContents" %>
<%@ page import="models.AdminManage" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-02-29
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    /*TODO Contents Favorites, Studys, Shares를 받는다.
     *  1. Studys와 Shares는 다시 Category별로 분류한다.
     *  2. 학습하고와 공유하고를 눌렀을때 레이아웃이 들어간다.*/
    MainContents contents = (MainContents) request.getAttribute("contents");
    request.setAttribute("contents", contents);
    System.out.println("contentsss : "+contents);

    for (int i = 0; i < contents.getStudys().getSciences().size(); i++) {
        System.out.println(contents.getStudys().getSciences().get(i).getNo());
    }
    AdminManage adminManage = (AdminManage) request.getAttribute("admin");
    request.setAttribute("admin", adminManage);
    if (request.getParameter("type") != null) {
        request.setAttribute("type", "study");
    } else {
        request.setAttribute("type", null);
    }
    System.out.println("adminM : "+adminManage);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>하고(Hago)</title>
    <jsp:include page="../../common/style.jsp" flush="false"/>
    <jsp:include page="../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../common/font.jsp" flush="false"/>
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
            background-color: #53BAFF;
        }

        body .carousel-indicators {
            bottom: 0;
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
    <%--Banner--%>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-bottom: 100px;">
        <ol class="carousel-indicators" style="bottom: -65px;">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="<%=request.getContextPath()%>${admin.bannerAll}" alt="First slide">
                <div class="cursor-pointer position-absolute text-grayDark-color text-center"
                     onclick="location.href='/intro.do'"
                     style="background-color: white; top:70%;left: 23.5%; width: 150px; height: 40px; border-radius: 100px; border:  2px solid #80CBFD; line-height: 35px;">
                    <span style="color: #80CBFD;font-family: Noto Sans KR, sans-serif !important; font-weight: bold;font-size: 16px;">자세히 보기</span>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<%=request.getContextPath()%>${admin.bannerLearn}" alt="Second slide">
                <div class="cursor-pointer position-absolute text-grayDark-color text-center"
                     onclick="getLocationMain('/main.do','study')"
                     style="background-color: white; top:77%;left: 45%; width: 150px; height: 40px; border-radius: 100px; border:  2px solid #80CBFD; line-height: 35px;">
                    <span style="color: #80CBFD;font-family: Noto Sans KR, sans-serif !important; font-weight: bold;font-size: 16px;">학습하러 가기</span>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<%=request.getContextPath()%>${admin.bannerShare}" alt="Third slide">
                <div class="cursor-pointer position-absolute text-grayDark-color text-center my-auto"
                     onclick="startTestDetail()"
                     style="background-color: white; top:70%;left: 26%; width: 150px; border-radius: 100px; background-color: #95DEFD;">
                    <div style="padding-top: 14px; padding-bottom: 14px; color: #FFFFFF;font-family: Noto Sans KR, sans-serif !important; font-weight: bold;font-size: 16px;">
                        시작하러 가기
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" data-slide="prev">
            <img src="../../resources/images/main_banner_left_button.svg">
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" data-slide="next">
            <img src="../../resources/images/main_banner_right_button.svg">
        </a>
    </div>
    <div class="dis-none" style="height: 450px;">
        <img id="main-banner" class="position-absolute" style="height: 450px; top: 76px; left: 0;"
             src="<%=request.getContextPath()%>${admin.bannerAll}"/>
    </div>
    <%--Banner--%>
    <div class="container mt-5 pt-5">
        <div class="position-relative">
            <form id="form-search" onsubmit="return checkSearchValue()" method="get" action="/search.do">
                <input id="inputSearch" placeholder="쉽게 배우는 콘텐츠를 검색해보세요." type="text" class="position-absolute search"
                       name="inputSearch"
                       style="top:70%;left: 50%; transform: translate(-50%,-50%);"/>
                <button id="submit" type="submit" class="tag-hide">
                </button>
            </form>
            <span onclick="$('#submit').click();" class="position-relative cursor-pointer"
                  style="left: 30%; top:5px;"><img width="24" height="24"
                                                 src="../../resources/images/search_icon.svg"/></span>
        </div>
        <div class="mt-5 text-center">
            <%--Button Control--%>
            <div class="row justify-content-center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <div class="m-4 border-0 text-decoration-none bg-white" style="outline:none;">
                        <a id="menu-all" onclick="menuOnClickFunction('menu-all');"
                           class="cursor-pointer text-decoration-none">
                            <img id="main-img-all" style="width: 72px;height: 72px;"
                                 src="../../resources/images/all_checked.svg"/>
                            <div class="mt-2 form-text" style="font-weight: normal !important;">
                                전체보기
                            </div>
                        </a>
                    </div>
                    <div class="m-4 border-0 text-decoration-none bg-white" style="outline:none;">
                        <a id="menu-study" onclick="menuOnClickFunction('menu-study');"
                           class="cursor-pointer text-decoration-none">
                            <img id="main-img-study" style="width: 72px;height: 72px;"
                                 src="../../resources/images/study_unchecked.svg"/>
                            <div class="mt-2 form-text" style="font-weight: normal !important;">
                                학습하고
                            </div>
                        </a>
                    </div>
                    <div class="m-4 border-0 text-decoration-none bg-white" style="outline:none;">
                        <a id="menu-share" onclick="menuOnClickFunction('menu-share');"
                           class="cursor-pointer text-decoration-none">
                            <img id="main-img-share" style="width: 72px;height: 72px;"
                                 src="../../resources/images/share_unchecked.svg"/>
                            <div class="mt-2 form-text" style="font-weight: normal !important;">
                                공유하고
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <%--Template-all--%>
            <div class="template">
                <%--학습 컨텐츠--%>
                <div id="layout-study">
                    <div class="profile-name-text text-Dark-color mt-5 ml-2 pt-5 my-auto text-center">
                        <img class="mr-1" style="vertical-align: text-bottom;"
                             src="../../resources/images/logo_dice.svg"/>
                        <span class="title-main-text">학습 콘텐츠</span>
                    </div>
                    <div class="mt-2 text-center">
                        <span class="text-grayDark-color" >하고의 운영자가 직접 기획하고 만든 콘텐츠를 통해 코딩을 익혀보세요!</span>
                    </div>
                    <div class="row justify-content-center m-4">
                        <div class="col-3">
                            <button onclick="studySubMenuOnClickFunction(this);" id="study-button-science"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="study-button-science-img" class="mr-3"
                                                                             src="../../resources/images/science.svg"/>과학
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="studySubMenuOnClickFunction(this);" id="study-button-social"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="study-button-social-img" class="mr-3"
                                                                             src="../../resources/images/social.svg"/>사회
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="studySubMenuOnClickFunction(this);" id="study-button-language"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="study-button-language-img" class="mr-3"
                                                                             src="../../resources/images/language.svg"/>국어
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="studySubMenuOnClickFunction(this);" id="study-button-math"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="study-button-math-img" class="mr-3"
                                                                             src="../../resources/images/math.svg"/>수학
                            </button>
                        </div>
                    </div>

                    <div class="carousel slide mt-5 mb-5" data-ride="carousel">
                        <!-- The slideshow -->
                        <div id="study1" class="container no-padding">
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
                        <div id="layout-study-add" class="container no-padding">
                        </div>
                    </div>
                </div>
                <%--인기 컨텐츠--%>
                <div id="layout-hit" class="tag-hide">
                    <div class="profile-name-text text-Dark-color mt-5 ml-2 pt-5 my-auto text-center">
                        <img class="mr-1" style="vertical-align: sub;" src="../../resources/images/good_icon.svg"/>
                        <span class="title-main-text">인기 콘텐츠</span>
                    </div>
                    <div class="mt-2 mb-5 text-center">
                        <span class="text-grayDark-color">하고의 학습자들이 가장 선호하고 재미있어 하는 콘텐츠를 경험하세요!</span>
                    </div>
                    <div id="demo" class="carousel slide mt-5 mb-5" data-ride="carousel">
                        <!-- The slideshow -->
                        <div id="hit1" class="container carousel-inner no-padding">
                            <div class="carousel-item active">
                                <div class="col-xs-3 col-sm-3 col-md-3">
                                    <img src="../../resources/images/main_content_sample1.svg">
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
                                    <img src="../../resources/images/main_content_sample4.svg">
                                    <div class="content-title-text mt-2">골드버그</div>
                                    <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="col-xs-3 col-sm-3 col-md-3">
                                    <img src="../../resources/images/main_content_sample4.svg">
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
                                    <img src="../../resources/images/main_content_sample1.svg">
                                    <div class="content-title-text mt-2">골드버그</div>
                                    <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <img src="../../resources/images/arrow_left.svg">
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <img src="../../resources/images/arrow_right.svg">
                            </a>
                        </div>
                    </div>
                </div>
                <%--공유 컨텐츠--%>
                <div id="layout-share">
                    <%--공유--%>
                    <div class="profile-name-text text-Dark-color mt-5 ml-2 pt-5 my-auto text-center">
                        <img class="mr-1" style="vertical-align: sub;"
                             src="../../resources/images/share_content_icon.svg"/>
                        <span class="title-main-text">공유 컨텐츠</span>
                    </div>
                    <div class="mt-2 text-center">
                        <span class="text-grayDark-color ">하고의 학습자들이 가장 선호하고 재미있어 하는 콘텐츠를 경험하세요!</span>
                    </div>
                    <div class="row justify-content-center m-4">
                        <div class="col-3">
                            <button onclick="shareSubMenuOnClickFunction(this);" id="share-button-science"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="share-button-science-img" class="mr-3"
                                                                             src="../../resources/images/science.svg"/>과학
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="shareSubMenuOnClickFunction(this);" id="share-button-social"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="share-button-social-img" class="mr-3"
                                                                             src="../../resources/images/social.svg"/>사회
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="shareSubMenuOnClickFunction(this);" id="share-button-language"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="share-button-language-img" class="mr-3"
                                                                             src="../../resources/images/language.svg"/>국어
                            </button>
                        </div>
                        <div class="col-3">
                            <button onclick="shareSubMenuOnClickFunction(this);" id="share-button-math"
                                    class="btn button-craft3 shadow-sm" style="font-weight: normal !important;"><img width="35" height="35"
                                                                             id="share-button-math-img" class="mr-3"
                                                                             src="../../resources/images/math.svg"/>수학
                            </button>
                        </div>
                    </div>
                    <div class="carousel slide mt-5 mb-5" data-ride="carousel">
                        <div id="share1" class="container carousel-inner no-padding">
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample3.svg">
                                <div class="content-title-text mt-2">ㅋㅋㅋㅋ</div>
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
                                <img src="../../resources/images/main_content_sample1.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3" style="margin-top: 30px;">
                                <img src="../../resources/images/main_content_sample2.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample1.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample4.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3">
                                <img src="../../resources/images/main_content_sample3.svg">
                                <div class="content-title-text mt-2">골드버그</div>
                                <div class="content-subtitle-text mt-1">과학교구를 통한 학습</div>
                            </div>
                        </div>
                        <div id="layout-share-add" class="container no-padding">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
</div>

<script src="../../resources/js/inspect.js" type="text/javascript"></script>
<script src="../../resources/js/main.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        hitContentsSetting();
        menuOnClickFunction(null);
        studySubMenuOnClickFunction(null);
        shareSubMenuOnClickFunction(null);
        if (${type eq 'study'}) {
            menuOnClickFunction('menu-study');
            $("html, body").animate({
                scrollTop: $("#layout-study").offset().top
            }, 1000);
        }
    });

    function menuOnClickFunction(type) {
        var mainBanner = $('#main-banner').attr('src') + '';
        var directory = mainBanner.substring(0, mainBanner.indexOf('/resources'));
        /*Response default*/
        $('#menu-all').addClass('text-grayDark-color');
        $('#menu-study').addClass('text-grayDark-color');
        $('#menu-share').addClass('text-grayDark-color');

        $('#main-img-all').attr('src', directory + '/resources/images/all_unchecked.svg');
        $('#main-img-study').attr('src', directory + '/resources/images/study_unchecked.svg');
        $('#main-img-share').attr('src', directory + '/resources/images/share_unchecked.svg');

        if (type !== null) {
            /*ChangeBanner and Response*/
            switch (type) {
                case "menu-all":
                    $('#main-img-all').attr('src', directory + '/resources/images/all_checked.svg');
                    var changeBanner = directory + '${admin.bannerAll}';
                    $('#' + type).removeClass('text-grayDark-color');
                    /*Layout default*/
                    $('#layout-hit').removeClass('tag-hide');
                    $('#layout-study').removeClass('tag-hide');
                    $('#layout-study-add').addClass('tag-hide');
                    $('#layout-share').removeClass('tag-hide');
                    $('#layout-share-add').addClass('tag-hide');
                    break;
                case "menu-study":
                    $('#main-img-study').attr('src', directory + '/resources/images/study_checked.svg');
                    var changeBanner = directory + '${admin.bannerLearn}';
                    $('#' + type).removeClass('text-grayDark-color');
                    $('#layout-hit').addClass('tag-hide');
                    $('#layout-share').addClass('tag-hide');
                    $('#layout-share-add').addClass('tag-hide');
                    $('#layout-study').removeClass('tag-hide');
                    $('#layout-study-add').removeClass('tag-hide');
                    break;
                case "menu-share":
                    $('#main-img-share').attr('src', directory + '/resources/images/share_checked.svg');
                    var changeBanner = directory + '${admin.bannerShare}';
                    $('#' + type).removeClass('text-grayDark-color');
                    $('#layout-hit').addClass('tag-hide');
                    $('#layout-study').addClass('tag-hide');
                    $('#layout-study-add').addClass('tag-hide');
                    $('#layout-share').removeClass('tag-hide');
                    $('#layout-share-add').removeClass('tag-hide');
                    break;
            }
        } else {
            $('#main-img-all').attr('src', directory + '/resources/images/all_checked.svg');
            var changeBanner = directory + '${admin.bannerAll}';
            $('#menu-all').removeClass('text-grayDark-color');
            $('#layout-hit').removeClass('tag-hide');
            $('#layout-study').removeClass('tag-hide');
            $('#layout-study-add').addClass('tag-hide');
            $('#layout-share').removeClass('tag-hide');
            $('#layout-share-add').addClass('tag-hide');
        }
    };

    function studySubMenuOnClickFunction(type) {
        $('#study-button-science').removeClass("opacity-full");
        $('#study-button-social').removeClass("opacity-full");
        $('#study-button-language').removeClass("opacity-full");
        $('#study-button-math').removeClass("opacity-full");


        if (type !== null) {
            switch (type.id) {
                case 'study-button-science':
                    $('#study-button-science').addClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-language').removeClass("opacity-full text-white-color");
                    $('#study-button-math').removeClass("opacity-full text-white-color");

                    $('#study-button-science-img').attr("src", "../../resources/images/tab_science_white.svg");
                    $('#study-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#study-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#study-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#study-button-social').addClass("text-black-color");
                    $('#study-button-language-img').addClass("text-black-color");
                    $('#study-button-math-img').addClass("text-black-color");

                    studyContentsSetting('science');
                    studyContentsAddSetting('science');
                    break;
                case 'study-button-social':
                    $('#study-button-social').addClass("opacity-full text-white-color  button-main-tab");
                    $('#study-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-language').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#study-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#study-button-social-img').attr("src", "../../resources/images/tab_society_white.svg");
                    $('#study-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#study-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#study-button-science').addClass("text-black-color");
                    $('#study-button-language-img').addClass("text-black-color");
                    $('#study-button-math-img').addClass("text-black-color");

                    studyContentsSetting('social');
                    studyContentsAddSetting('social');
                    break;
                case 'study-button-language':
                    $('#study-button-language').addClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#study-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#study-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#study-button-language-img').attr("src", "../../resources/images/tab_language_white.svg");
                    $('#study-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#study-button-science').addClass("text-black-color");
                    $('#study-button-social-img').addClass("text-black-color");
                    $('#study-button-math-img').addClass("text-black-color");

                    studyContentsSetting('language');
                    studyContentsAddSetting('language');


                    break;
                case 'study-button-math':
                    $('#study-button-math').addClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#study-button-language').removeClass("opacity-full text-white-color button-main-tab");

                    $('#study-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#study-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#study-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#study-button-math-img').attr("src", "../../resources/images/tab_math_white.svg");

                    $('#study-button-science').addClass("text-black-color");
                    $('#study-button-social-img').addClass("text-black-color");
                    $('#study-button-language-img').addClass("text-black-color");

                    studyContentsSetting('math');
                    studyContentsAddSetting('math');


                    break;
            }
        } else {
            $('#study-button-science').addClass("opacity-full text-white-color button-main-tab");
            $('#study-button-science-img').attr("src", "../../resources/images/tab_science_white.svg");
            studyContentsSetting('science');
            studyContentsAddSetting('science');
        }
        /*ajax data getter for button types*/
    };

    function shareSubMenuOnClickFunction(type) {
        $('#share-button-science').removeClass("opacity-full");
        $('#share-button-social').removeClass("opacity-full");
        $('#share-button-language').removeClass("opacity-full");
        $('#share-button-math').removeClass("opacity-full");

        if (type !== null) {
            switch (type.id) {
                case 'share-button-science':
                    $('#share-button-science').addClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-language').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#share-button-science-img').attr("src", "../../resources/images/tab_science_white.svg");
                    $('#share-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#share-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#share-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#share-button-social').addClass("text-black-color");
                    $('#share-button-language-img').addClass("text-black-color");
                    $('#share-button-math-img').addClass("text-black-color");

                    shareContentsSetting('science');
                    shareContentsAddSetting('science');
                    break;
                case 'share-button-social':
                    $('#share-button-social').addClass("opacity-full text-white-color  button-main-tab");
                    $('#share-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-language').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#share-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#share-button-social-img').attr("src", "../../resources/images/tab_society_white.svg");
                    $('#share-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#share-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#share-button-science').addClass("text-black-color");
                    $('#share-button-language-img').addClass("text-black-color");
                    $('#share-button-math-img').addClass("text-black-color");

                    shareContentsSetting('social');
                    shareContentsAddSetting('social');
                    break;
                case 'share-button-language':
                    $('#share-button-language').addClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-math').removeClass("opacity-full text-white-color button-main-tab");

                    $('#share-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#share-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#share-button-language-img').attr("src", "../../resources/images/tab_language_white.svg");
                    $('#share-button-math-img').attr("src", "../../resources/images/math.svg");

                    $('#share-button-science').addClass("text-black-color");
                    $('#share-button-social-img').addClass("text-black-color");
                    $('#share-button-math-img').addClass("text-black-color");

                    shareContentsSetting('language');
                    shareContentsAddSetting('language');
                    break;
                case 'share-button-math':
                    $('#share-button-math').addClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-social').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-science').removeClass("opacity-full text-white-color button-main-tab");
                    $('#share-button-language').removeClass("opacity-full text-white-color button-main-tab");

                    $('#share-button-science-img').attr("src", "../../resources/images/science.svg");
                    $('#share-button-social-img').attr("src", "../../resources/images/social.svg");
                    $('#share-button-language-img').attr("src", "../../resources/images/language.svg");
                    $('#share-button-math-img').attr("src", "../../resources/images/tab_math_white.svg");

                    $('#share-button-science').addClass("text-black-color");
                    $('#share-button-social-img').addClass("text-black-color");
                    $('#share-button-language-img').addClass("text-black-color");

                    shareContentsSetting('math');
                    shareContentsAddSetting('math');
                    break;
            }
        } else {
            $('#share-button-science').addClass("opacity-full text-white-color button-main-tab");
            $('#share-button-science-img').attr("src", "../../resources/images/tab_science_white.svg");
            shareContentsSetting('science');
            shareContentsAddSetting('science');
        }
        /*ajax data getter for button types*/
    };

    function videoClick() {
        /*$('#video-view-button').attr('data-src','urls');*/
        $('#video-view-button').click();
    };

    function hitContentsSetting() {
        var html = '';
        <c:forEach varStatus="status" step="4" begin="1" end="${contents.hitContents.size()}">
        <c:choose>
        <c:when test="${status.count eq 1}">
        html += '<div class="carousel-item active">';
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.hitContents}">
        html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
            '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
            '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
            '                                    <div class="content-subtitle-text mt-1">${content.title}</div> <div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
        </c:forEach>
        html += '</div>';
        </c:when>
        <c:otherwise>
        html += '<div class="carousel-item">';
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.hitContents}">
        html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
            '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
            '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
            '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
        </c:forEach>
        html += '</div>';
        </c:otherwise>
        </c:choose>
        </c:forEach>
        html += '                            <a class="carousel-control-prev" href="#demo" data-slide="prev">\n' +
            '                                <img src="../../resources/images/arrow_left.svg">\n' +
            '                            </a>\n' +
            '                            <a class="carousel-control-next" href="#demo" data-slide="next">\n' +
            '                                <img src="../../resources/images/arrow_right.svg">\n' +
            '                            </a>';
        $('#hit1').html(html);
    };

    function studyContentsSetting(type) {
        if (type == 'science') {
            $('#study1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.sciences.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#study1').html(html);
        } else if (type == 'social') {
            $('#study1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.socials.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#study1').html(html);
        } else if (type == 'language') {
            $('#study1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.languages.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#study1').html(html);
        } else if (type == 'math') {
            $('#study1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.maths.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.category}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.category}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#study1').html(html);
        }
    };

    function shareContentsSetting(type) {
        if (type == 'science') {
            $('#share1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.sciences.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#share1').html(html);
        } else if (type == 'social') {
            $('#share1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.socials.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#share1').html(html);
        } else if (type == 'language') {
            $('#share1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.languages.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#share1').html(html);
        } else if (type == 'math') {
            $('#share1').html('');
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.maths.size()}">
            <c:choose>
            <c:when test="${status.count eq 1}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            <c:when test="${status.count eq 2}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.category}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.category}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#share1').html(html);
        }
    };

    function studyContentsAddSetting(type) {
        if (type == 'science') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.sciences.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-study-add').html(html);
        }
        if (type == 'social') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.socials.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-study-add').html(html);
        }
        if (type == 'language') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.languages.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-study-add').html(html);
        }
        if (type == 'math') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.studys.maths.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.studys.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-study-add').html(html);
        }
    };

    function shareContentsAddSetting(type) {
        if (type == 'science') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.sciences.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.sciences}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-share-add').html(html);
        }
        if (type == 'social') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.socials.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.socials}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-share-add').html(html);
        }
        if (type == 'language') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.languages.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.languages}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-share-add').html(html);
        }
        if (type == 'math') {
            var html = '';
            <c:forEach varStatus="status" step="4" begin="1" end="${contents.shares.maths.size()}">
            <c:choose>
            <c:when test="${status.count >=3}">
            <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+3}" step="1" var="content" items="${contents.shares.maths}">
            html += '<div class="col-xs-3 col-sm-3 col-md-3 t-3">\n' +
                '                                    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
                '                                    <div class="content-title-text mt-2">${content.name}</div>\n' +
                '                                    <div class="content-subtitle-text mt-1">${content.title}</div><div class="pt-2"><img class="cursor-pointer" onclick="goClicked(${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;"></div></div>\n';
            </c:forEach>
            </c:when>
            </c:choose>
            </c:forEach>
            $('#layout-share-add').html(html);
        }
    };

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

    function checkSearchValue() {
        var checkValue = false;
        var str = replaceAll($('#inputSearch').val(),' ','');
        if(str.length>=1){
            checkValue = inspection('inputSearch', 'search') ? true : false;
            return checkValue;
        }else{
            return false;
        }
    };

    function goClicked(content_no) {
        postDetailAction(content_no);
    };

    function startTestDetail() {
        <c:choose>
        <c:when test="${empty contents.studys.contentsForTypes}">
            alert('학습 할 컨텐츠가 없습니다.');
        </c:when>
        <c:when test="${contents.studys.contentsForTypes.size() >= 1}">
            console.log('${contents.studys.contentsForTypes.get(0).no}');
            console.log('${contents.studys.contentsForTypes.get(0).state}');
            console.log('${contents.studys.contentsForTypes.get(0).user_no}');
            postDetailAction('${contents.studys.contentsForTypes.get(0).no}')
        </c:when>
        </c:choose>
    };
</script>
</body>
</html>
