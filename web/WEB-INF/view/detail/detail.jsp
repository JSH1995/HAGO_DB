<%@ page import="models.User" %>
<%@ page import="models.Content" %>
<%@ page import="models.Comment" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-11
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User user = (User) request.getAttribute("user");
    request.setAttribute("user", user);
    Content content = (Content) request.getAttribute("content");
    request.setAttribute("content", content);
    ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
    request.setAttribute("comments", comments);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>학습 상세 페이지</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/util.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
    <style>
        .opacity-full {
            font-size: 13px !important;
            background-color: #FFF !important;
            color: #000 !important;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container text-center">
    <div class="row p-0 mt-3">
        <div class="col-7 m-0 p-0 pr-4">
            <img src="../../../resources/images/panner_detail.svg" class="img-fluid"/>
        </div>
        <div class="col-5 m-0 p-0 pl-3 text-left">
            <div class="row">
                <img src="../../../resources/images/study_flag.svg" class="img-fluid"/>
                <span class="position-absolute content-title-text"
                      style="color: #FFF !important; top:1rem; left:0.9rem;">학습</span>
                <div class="col-9 m-0 p-0 ml-2">
                    <div class="row m-0 p-0">
                        <span class="text-black-color title-main-text">
                            ${content.name}
                        </span>
                    </div>
                    <div class="row m-0 p-0">
                        <span class="form-mytitle-text text-grayDark-color">
                            ${content.title}
                        </span>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <img src="../../../resources/images/detail_blue_arrow.svg" class="img-fluid mr-2"/>
                <div class="w-85 pl-2">
                    <c:choose>
                        <c:when test="${content.category eq 'math'}">
                            <a class="btn button-craft5 shadow-sm opacity-full"><img
                                    style="margin-right: 7px; width: 15px; height: 15px;"
                                    src="../../../resources/images/math.svg">수학
                            </a>
                        </c:when>
                        <c:when test="${content.category eq 'science'}">
                            <a class="btn button-craft5 shadow-sm opacity-full"><img
                                    style="margin-right: 7px; width: 15px; height: 15px;"
                                    src="../../../resources/images/science.svg">과학
                            </a>
                        </c:when>
                        <c:when test="${content.category eq 'social'}">
                            <a
                                    class="btn button-craft5 shadow-sm opacity-full"><img
                                    style="margin-right: 7px; width: 15px; height: 15px;"
                                    src="../../../resources/images/social.svg">사회
                            </a>
                        </c:when>
                        <c:when test="${content.category eq 'language'}">
                            <a class="btn button-craft5 shadow-sm opacity-full"><img
                                    style="margin-right: 7px; width: 15px; height: 15px;"
                                    src="../../../resources/images/language.svg">국어
                            </a>
                        </c:when>
                    </c:choose>
                    <%--         <img class="pb-1 my-auto" src="../../../resources/images/detail_science_icon.svg"/>
                             <span>과학</span>--%>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 row">
                    <div class="detail-title-text mr-4">제작자</div>
                    <c:choose>
                        <c:when test="${not empty content.user}">
                            <img class="img-fluid" style="border-radius:28px; width: 56px; height: 56px;"
                                 src="<%=request.getContextPath()%>${content.user.img}"/>
                        </c:when>
                        <c:otherwise>
                            <img class="img-fluid" style="border-radius:28px; width: 56px; height: 56px;"
                                 src="../../../resources/images/detail_profile.svg"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="ml-4 my-auto content-subtitle-text">
                        ${content.user.nickname}
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 row">
                    <div class="m-0 p-0 detail-title-text mr-2">
                        상세 설명
                    </div>
                    <div class="col-9 m-0 p-0 detail-mysub-text font-weight-normal text-grayDark-color ml-3">
                        ${content.detail}
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 row">
                    <div class="m-0 p-0 detail-title-text mr-2">
                        등록 일자
                    </div>
                    <div class="col-9 m-0 p-0 content-subtitle-text ml-3">
                        ${content.date}
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 row justify-content-end footer-text pr-5">
                    <div onclick="likeSetting()" class="cursor-pointer">
                        <img src="../../../resources/images/detail_like.svg" class="img-fluid ml-2 mr-2"/>
                        <span class="detail-ten_seven-text text-grayDark-color ">55</span>
                    </div>
                    <div class="cursor-pointer">
                        <img src="../../../resources/images/detail_comment.svg" class="img-fluid ml-2 mr-2"/>
                        <span class="detail-ten_seven-text text-grayDark-color">${comments.size()}</span>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 row">
                    <div class="col-12 text-center">
                        <img class="cursor-pointer" src="../../../resources/images/detail_go.svg" onclick="goHago()"
                             style="border-radius: 30px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row ml-0 mb-0 mr-0 p-0 m-t-40">
        <div class="col-12 row text-left">
            <img src="../../../resources/images/detail_book.svg" class="img-fluid"/>
            <div class="title-main-text ml-2 mr-2">학습 목표</div>
            <div class="content-my-subtitle-text mt-auto pb-1">콘텐츠가 만들어진 의도와 목표를 이해한 후 학습을 즐겨보세요!</div>
        </div>
    </div>
    <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
        <div class="row col-12 text-left">
            <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
            <div id="title1">
                수학의 기본 개념 이해
            </div>
        </div>
        <div class="row col-8 text-left ml-4 mt-1 content-my-subtitle-text" id="detail1">
            교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.
        </div>
    </div>
    <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
        <div class="row col-12 text-left">
            <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
            <div id="title2">
                수학의 기본 개념 이해
            </div>
        </div>
        <div class="row col-8 text-left ml-4 mt-1 content-my-subtitle-text" id="detail2">
            교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.
        </div>
    </div>
    <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
        <div class="row col-12 text-left">
            <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
            <div id="title3">
                수학의 기본 개념 이해
            </div>
        </div>
        <div class="row col-8 text-left ml-4 mt-1 content-my-subtitle-text" id="detail3">
            교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.교육용 프로그래밍 언어(EPL) 입니다.
            응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌
            컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.
        </div>
    </div>
    <hr class="m-t-60 m-b-60 border-0" style="background-color: #CCCCCC; outline: none; height: 2px;"/>
    <!--Comment-->
    <div class="row m-0 p-0">
        <div class="col-12 row text-left">
            <img src="../../../resources/images/comment.svg" class="img-fluid"/>
            <div class="title-main-text ml-2 mr-2">댓글</div>
            <div class="content-my-subtitle-text mt-auto pb-1">콘텐츠를 통해 배운 학습 경험을 다른 사용자와 공유해보세요!</div>
        </div>
    </div>
    <!--Comment End-->
    <!--Input Comment-->
    <div class="row m-0 p-0 mb-3 mt-5 p-2">
        <div class="media w-100">
            <c:choose>
                <c:when test="${not empty user}">
                    <img class="img-fluid" style="width: 58px; height: 58px; border-radius: 30px;"
                         src="<%=request.getContextPath()%>${user.img}"
                         alt="Generic placeholder image">
                </c:when>
                <c:otherwise>
                    <img class="img-fluid" src="../../../resources/images/detail_man_icon.svg"
                         style="width: 58px; height: 58px;border-radius: 30px;"
                         alt="Generic placeholder image"/>
                </c:otherwise>
            </c:choose>
            <div class="media-body text-left mt-auto">
                <h5 class="mt-0 ml-3" id="comment-username">로그인을 해주세요.</h5>
                <div class="dis-flex ml-3">
                    <input id="comment" placeholder="후기를 작성 해주세요" type="text"
                           class="w-100 border-top-0 border-left-0 border-right-0"
                           style="border-bottom: 2px solid #CCCCCC !important; outline: none; height: 37px !important;"/>
                </div>
            </div>
        </div>
        <div class="row m-0 p-0 col-12 justify-content-end mt-3">
            <img src="../../../resources/images/detail_comment_add.svg" onclick="addComment()"
                 class="img-fluid cursor-pointer" style="border-radius: 30px;"/>
        </div>
    </div>
    <!--Input Comment End-->
    <div id="layout" class="layout">
        <div class="media media-container text-left m-2 mb-4">
        </div>
        <c:forEach var="comment" varStatus="status" items="${comments}">
            <div class="media media-container text-left m-2 mb-4">
                <c:choose>
                    <c:when test="${not empty comment.user}">
                        <img class="mr-3" alt="..." style="width: 58px; height: 58px; border-radius: 30px;"
                             src="<%=request.getContextPath()%>${comment.user.img}"
                             alt="Generic placeholder image">
                    </c:when>
                    <c:otherwise>
                        <img width="58" height="58" class="mr-3"
                             src="../../../resources/images/profile_default.svg"
                             alt="Generic placeholder image">
                    </c:otherwise>
                </c:choose>
                <div class="media-body border-0 pb-3 text-blacklight-color button-text" style="border-bottom: 1px solid #CCCCCC !important;">
                    <div class="row m-0 p-0">
                        <h5 class="mt-0 text-blueDark-color">${comment.user.nickname}</h5>
                        <div class="ml-auto detail-ten_seven-text text-grayDark-color">
                                ${comment.date}
                        </div>
                    </div>
                        ${comment.comment}
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="text-center mt-5">
        <nav aria-label="Page navigation example">
            <ul id="nav-ul" class="pagination justify-content-center">
                <li class="page-item active" data-page="1"><a class="page-link border-0" href="#">1</a></li>
                <li class="page-item" data-page="2"><a class="page-link border-0" href="#">2</a></li>
                <li class="page-item" data-page="3"><a class="page-link border-0" href="#">3</a></li>
            </ul>
        </nav>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
    $(document).ready(function () {
        contentsSetting();
        commentsSetting();
        console.log('detail.jsp', ' 237 ', 'Log is : ', $('#layout' + ' .media-container:gt(0)'));
        runTable('nav-ul', 'layout');
        $("#comment").keypress(function (e) {
            if (e.which == 13) {
                addComment();  // 실행할 이벤트
            }
        });
    });

    function contentsSetting() {
        var contents = JSON.parse('${content.contents}' + '').learn;
        console.log(contents);
        $('#title1').html(contents[0].title);
        $('#detail1').html(contents[0].detail);
        $('#title2').html(contents[1].title);
        $('#detail2').html(contents[1].detail);
        $('#title3').html(contents[2].title);
        $('#detail3').html(contents[2].detail);
    }

    function commentsSetting() {
        if (${not empty user}) {
            /*로그인 상태*/
            $('#comment-username').html('${user.nickname}');
        } else {
            /*비로그인 상태*/
        }
    }

    function likeSetting() {
        if (${not empty user}) {
            // like add
            //alert("like add");
            addLikeByDetail('${user.no}', '${content.no}');
        } else {
            /*비로그인*/
            alert("로그인을 해주세요");
            getLocation("login.do");
        }
    }

    function addComment() {
        if (${not empty user}) {
            /*로그인 상태*/
            /*path, user_img, user_no, user_nickname, contents_no, comment*/
            if ($('#comment').val().length >= 1) {
                addCommentByDetail('<%=request.getContextPath()%>', '${user.img}', '${user.no}', '${user.nickname}', ${content.no}, inputInjection($('#comment').val()));
            } else {
                alert('내용을 입력해주세요.');
            }
        } else {
            /*비로그인 상태*/
            alert('로그인을 해주세요~!');
        }
        location.reload();
    }

    function goHago() {
        if (${not empty user}) {
            // 로그인 상태
                alert('${user.no}');

            var form = document.createElement("form");
            form.setAttribute("method", "get");
            form.setAttribute("action", "http://www.codinghago.com:3389");

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "go_user");
            hiddenField.setAttribute("value", "${user.no}");
            var hiddenField1 = document.createElement("input");
            hiddenField1.setAttribute("type", "hidden");
            hiddenField1.setAttribute("name", "go_contents");
            hiddenField1.setAttribute("value", "${content.no}");

            form.appendChild(hiddenField);
            form.appendChild(hiddenField1);

            document.body.appendChild(form);
            form.submit();
        } else {
            /*비로그인 상태*/
            alert('로그인을 해주세요~!');
        }
        location.reload();
    }
</script>
</body>
</html>