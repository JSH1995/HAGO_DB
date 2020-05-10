<jsp:useBean id="admin" scope="request" type="models.AdminManage"/>
<!DOCTYPE html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.CustomCenter" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-11
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    //ArrayList<Announce> notice = (ArrayList<Announce>) request.getAttribute("Notice");
    ArrayList<CustomCenter> customCenters = (ArrayList<CustomCenter>) request.getAttribute("Qna");
    System.out.println("jsp custom" + customCenters);
    request.setAttribute("Qna", customCenters);
%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Q&A</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
    <link href="../../../resources/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="../../../resources/css/carousel/all.css" rel="stylesheet" type="text/css"/>
    <style>

        body .carousel-indicators li {
            background-color: #53BAFF;
        }

        body .carousel-indicators {
            bottom: 0;
        }

        p{
            opacity: 1 !important;
        }

        div.pr-5 img.position-relative{
            top: 24px !important;
        }

        div.media-body div div{
            margin-bottom: 13px !important;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
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
<div class="container text-center mt-5 pt-5">
    <%--Banner--%>
    <div class="text-left mb-5">
        <p class="title-main-text">
            Q&A
        </p>
        <p class="form-text mb-4">
            자주 하는 질문
        </p>
    </div>

    <%--Notice--%>
    <c:if test="${Qna.size()==0}">
        <div class="row col-12" style="height: 100vh!important;">
        </div>

    </c:if>
    <c:if test="${Qna.size() >= 1}">
        <div id="div_1" class="p-3 w-100 list-group bg-gray-color mb-5">
            <div class="media p-1 pl-3">
                <img width="20" height="20" class="mr-3" src="../../../resources/images/question.svg"
                     alt="Generic placeholder image">
                <div class="media-body text-left ">
                    <div class="row">
                        <div class="col-11">
                            <h5 id="question1" class="mt-0 form-text align-items-center">
                                <c:out value="${Qna.get(0).getQuestion()}" default="error"/>
                            </h5>
                        </div>
                        <button class="btn m-0 p-0 text-left collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseExample1"
                                id="title1-image"
                                aria-expanded="false" aria-controls="collapseExample1"><img width="50" height="13"
                                                                                            class="notice-image"
                                                                                            src="../../../resources/images/down_gray.svg">
                        </button>
                        <h6 class="footer-text mr-3"><img src="../../../resources/images/time.svg"
                                                          class="pl-3 mr-2 pb-1"><span id="date1"
                                                                                       class="footer-text"
                                                                                       style="opacity: 0.5;"><c:out
                                value="${Qna.get(0).getDate()}" default="error"/></span></h6>
                    </div>
                    <div class="pr-5 collapse" id="collapseExample1">
                        <img width="16" height="16" src="../../../resources/images/answer.svg"
                             class="position-relative" style="top: 20px; left: 0;">
                        <p id="answer1" class="button-text pl-4" style="opacity: 0.5;">
                            <c:out value="${Qna.get(0).getAnswer()}" default="error"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Qna.size() >= 2}">
        <div id="div_2" class="p-3 w-100 list-group bg-gray-color mb-5">
            <div class="media p-1 pl-3">
                <img width="20" height="20" class="mr-3" src="../../../resources/images/question.svg"
                     alt="Generic placeholder image">
                <div class="media-body text-left ">
                    <div class="row">
                        <div class="col-11">
                            <h5 id="question2" class="mt-0 form-text align-items-center"><c:out
                                    value="${Qna.get(1).getQuestion()}" default="error"/></h5>
                        </div>
                        <button class="btn m-0 p-0 text-left collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseExample2"
                                id="title2-image"
                                aria-expanded="false" aria-controls="collapseExample2"><img width="50" height="13"
                                                                                            class="notice-image"
                                                                                            src="../../../resources/images/down_gray.svg">
                        </button>
                        <h6 class="footer-text mr-3"><img src="../../../resources/images/time.svg"
                                                          class="pl-3 mr-2 pb-1"><span id="date2"
                                                                                       class="footer-text"
                                                                                       style="opacity: 0.5;"><c:out
                                value="${Qna.get(1).getDate()}" default="error"/></span></h6>
                    </div>
                    <div class="pr-5 collapse" id="collapseExample2">
                        <img width="16" height="16" src="../../../resources/images/answer.svg"
                             class="position-relative" style="top: 20px; left: 0;">
                        <p id="answer2" class="button-text pl-4" style="opacity: 0.5;">
                            <c:out value="${Qna.get(1).getAnswer()}" default="error"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Qna.size() >= 3}">
        <div id="div_3" class="p-3 w-100 list-group bg-gray-color mb-5">
            <div class="media p-1 pl-3">
                <img width="20" height="20" class="mr-3" src="../../../resources/images/question.svg"
                     alt="Generic placeholder image">
                <div class="media-body text-left ">
                    <div class="row">
                        <div class="col-11">
                            <h5 id="question3" class="mt-0 form-text align-items-center">
                                <c:out value="${Qna.get(2).getQuestion()}" default="error"/>
                            </h5>
                        </div>
                        <button class="btn m-0 p-0 text-left collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseExample3"
                                id="title3-image"
                                aria-expanded="false" aria-controls="collapseExample3"><img width="50" height="13"
                                                                                            class="notice-image"
                                                                                            src="../../../resources/images/down_gray.svg">
                        </button>
                        <h6 class="footer-text mr-3"><img src="../../../resources/images/time.svg"
                                                          class="pl-3 mr-2 pb-1"><span id="date3"
                                                                                       class="footer-text"
                                                                                       style="opacity: 0.5;">
                        <c:out value="${Qna.get(2).getDate()}" default="error"/>
                    </span></h6>
                    </div>
                    <div class="pr-5 collapse" id="collapseExample3">
                        <img width="16" height="16" src="../../../resources/images/answer.svg"
                             class="position-relative" style="top: 20px; left: 0;">
                        <p id="answer3" class="button-text pl-4" style="opacity: 0.5;">
                            <c:out value="${Qna.get(2).getAnswer()}" default="error"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Qna.size() >= 4}">
        <div id="div_4" class="p-3 w-100 list-group bg-gray-color mb-5">
            <div class="media p-1 pl-3">
                <img width="20" height="20" class="mr-3" src="../../../resources/images/question.svg"
                     alt="Generic placeholder image">
                <div class="media-body text-left ">
                    <div class="row">
                        <div class="col-11">
                            <h5 id="question4" class="mt-0 form-text align-items-center">
                                <c:out value="${Qna.get(3).getQuestion()}" default="error"/>
                            </h5>
                        </div>
                        <button class="btn m-0 p-0 text-left collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseExample4"
                                id="title4-image"
                                aria-expanded="false" aria-controls="collapseExample4"><img width="50" height="13"
                                                                                            class="notice-image"
                                                                                            src="../../../resources/images/down_gray.svg">
                        </button>
                        <h6 class="footer-text mr-3"><img src="../../../resources/images/time.svg"
                                                          class="pl-3 mr-2 pb-1"><span id="date4"
                                                                                       class="footer-text"
                                                                                       style="opacity: 0.5;">
                        <c:out value="${Qna.get(3).getDate()}" default="error"/>
                    </span></h6>
                    </div>
                    <div class="pr-5 collapse" id="collapseExample4">
                        <img width="16" height="16" src="../../../resources/images/answer.svg"
                             class="position-relative" style="top: 20px; left: 0;">
                        <p id="answer4" class="button-text pl-4" style="opacity: 0.5;">
                            <c:out value="${Qna.get(3).getAnswer()}" default="error"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Qna.size() >= 5}">
        <div id="div_5" class="p-3 w-100 list-group bg-gray-color mb-5">
            <div class="media p-1 pl-3">
                <img width="20" height="20" class="mr-3" src="../../../resources/images/question.svg"
                     alt="Generic placeholder image">
                <div class="media-body text-left ">
                    <div class="row">
                        <div class="col-11">
                            <h5 id="question5" class="mt-0 form-text align-items-center">
                                <c:out value="${Qna.get(4).getQuestion()}" default="error"/>
                            </h5>
                        </div>
                        <button class="btn m-0 p-0 text-left collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseExample5"
                                id="title5-image"
                                aria-expanded="false" aria-controls="collapseExample5"><img width="50" height="13"
                                                                                            class="notice-image"
                                                                                            src="../../../resources/images/down_gray.svg">
                        </button>
                        <h6 class="footer-text mr-3"><img src="../../../resources/images/time.svg"
                                                          class="pl-3 mr-2 pb-1"><span id="date5"
                                                                                       class="footer-text"
                                                                                       style="opacity: 0.5;">
                        <c:out value="${Qna.get(4).getDate()}" default="error"/>
                    </span></h6>
                    </div>
                    <div class="pr-5 collapse" id="collapseExample5">
                        <img width="16" height="16" src="../../../resources/images/answer.svg"
                             class="position-relative" style="top: 20px; left: 0;">
                        <p id="answer5" class="button-text pl-4" style="opacity: 0.5;">
                            <c:out value="${Qna.get(4).getAnswer()}" default="error"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <%--Notice Pagination--%>
    <div class="text-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${handler_totalpage >= 1}">
                    <li name="y" id="prev" class="page-item disabled" onclick="my_click(3)">
                        <a class="page-link border-0" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${handler_totalpage >= 1}">
                    <li class="page-item active"><a name="y" id="nav_1" class="page-link border-0" nw=0 href="#"
                                                    onclick="my_click(0)">
                        1</a></li>
                </c:if>
                <c:if test="${handler_totalpage >= 2}">
                    <li class="page-item"><a name="y" id="nav_2" class="page-link border-0" nw=1 href="#"
                                             onclick="my_click(1)">
                        2</a></li>
                </c:if>
                <c:if test="${handler_totalpage >= 3}">
                    <li class="page-item"><a name="y" id="nav_3" class="page-link border-0" nw=2 href="#"
                                             onclick="my_click(2)">
                        3</a></li>
                </c:if>
                <c:if test="${handler_totalpage >= 1}">
                    <c:choose>
                        <c:when test="${handler_totalpage == 1}">
                            <li name="y" id="next" class="page-item disabled" onclick="my_click(4)">
                        </c:when>
                        <c:otherwise>
                            <li name="y" id="next" class="page-item" onclick="my_click(4)">
                        </c:otherwise>
                    </c:choose>
                    <a class="page-link border-0" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <div class="row mt-5">
        <div class="col-12 form-text">
            회사에 문의하고 싶은 사항이 있나요?
        </div>
        <div class="col-12 d-flex flex-row justify-content-center">
            <button onclick="window.open('about:blank').location.href='${admin.googleForm}'" id="question"
                    class="btn btn-block mt-4 mb-4 auth-submit text-white" style="width: 365px;"
                    type="submit">문의하기
            </button>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
    $(document).ready(function () {
        console.log('hhi');
        $('#title1-image').click(function () {
            var button = document.getElementById('title1-image');
            var image = button.getElementsByClassName('notice-image').item(0);
            console.log(image.src.indexOf('down_gray'));
            if (image.src.indexOf('down_gray') >= 0) {
                image.src = '<%=request.getContextPath()%>/resources/images/up_blue.svg';
            } else {
                image.src = '<%=request.getContextPath()%>/resources/images/down_gray.svg';
            }
        });
        $('#title2-image').click(function () {
            var button = document.getElementById('title2-image');
            var image = button.getElementsByClassName('notice-image').item(0);
            console.log(image);
            if (image.src.indexOf('down_gray') >= 0) {
                image.src = '<%=request.getContextPath()%>/resources/images/up_blue.svg';
            } else {
                image.src = '<%=request.getContextPath()%>/resources/images/down_gray.svg';
            }
        });
        $('#title3-image').click(function () {
            var button = document.getElementById('title3-image');
            var image = button.getElementsByClassName('notice-image').item(0);
            console.log(image);
            if (image.src.indexOf('down_gray') >= 0) {
                image.src = '<%=request.getContextPath()%>/resources/images/up_blue.svg';
            } else {
                image.src = '<%=request.getContextPath()%>/resources/images/down_gray.svg';
            }
        });
        $('#title4-image').click(function () {
            var button = document.getElementById('title4-image');
            var image = button.getElementsByClassName('notice-image').item(0);
            console.log(image);
            if (image.src.indexOf('down_gray') >= 0) {
                image.src = '<%=request.getContextPath()%>/resources/images/up_blue.svg';
            } else {
                image.src = '<%=request.getContextPath()%>/resources/images/down_gray.svg';
            }
        });
        $('#title5-image').click(function () {
            var button = document.getElementById('title5-image');
            var image = button.getElementsByClassName('notice-image').item(0);
            console.log(image);
            if (image.src.indexOf('down_gray') >= 0) {
                image.src = '<%=request.getContextPath()%>/resources/images/up_blue.svg';
            } else {
                image.src = '<%=request.getContextPath()%>/resources/images/down_gray.svg';
            }
        });
    });

    function reset() {
        console.log("reset" + document.getElementById('title1-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray'));
        if (document.getElementById('title1-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray') < 0) {
            $('#title1-image').click();
        }
        if (document.getElementById('title2-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray') < 0) {
            $('#title2-image').click();
        }
        if (document.getElementById('title3-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray') < 0) {
            $('#title3-image').click();
        }
        if (document.getElementById('title4-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray') < 0) {
            $('#title4-image').click();
        }
        if (document.getElementById('title5-image').getElementsByClassName('notice-image').item(0).src.indexOf('down_gray') < 0) {
            $('#title5-image').click();
        }
    }

    function my_click(nav_id) {
        console.log(nav_id);
        var click_id;
        var id;// = nav_id;

        switch (nav_id) {
            case 0:
                click_id = $('#nav_1');
                break;
            case 1:
                click_id = $('#nav_2');
                break;
            case 2:
                click_id = $('#nav_3');
                break;
            case 3:
                click_id = $('#prev');
                break;
            case 4:
                click_id = $('#next');
                break;
            default:
                click_id = -1;
                break;
        }
        console.log("click_id", click_id);
        //console.log("debuging",${handler_totalpage});
        if (click_id.attr('id') == 'prev' || click_id.attr('id') == 'next') {
            //id = parseInt($this.siblings('.active').children().attr('nw'));
            if (click_id.attr('id') == 'prev') {
                click_id = click_id.siblings('.active').children();
                if (click_id.attr('id') == 'nav_1') return;
                else if (click_id.attr('id') == 'nav_2') {
                    click_id = $('#nav_1');
                } else if (click_id.attr('id') == 'nav_3') {
                    click_id = $('#nav_2');
                }
            } else if (click_id.attr('id') == 'next') {
                if (${handler_totalpage > 1}) {
                    click_id = click_id.siblings('.active').children();
                    console.log("asdf", click_id);
                    if (click_id.attr('id') == 'nav_3') return;
                    else if (click_id.attr('id') == 'nav_2') {
                        click_id = $('#nav_3');
                    } else if (click_id.attr('id') == 'nav_1') {
                        click_id = $('#nav_2');
                    }
                } else {
                    return;
                }
            }
        }

        id = parseInt(click_id.attr('nw'));
        console.log("id", id);
        reset();
        qna_reload(id, click_id);
    }
</script>
</body>
</html>
