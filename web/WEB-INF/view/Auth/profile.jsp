<%@ page import="models.User" %>
<%@ page import="models.ProfileContents" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-09
  Time: 오후 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User user = (User) request.getAttribute("user");
    request.setAttribute("user", user);
    ProfileContents profileContents = (ProfileContents) request.getAttribute("profile");
    request.setAttribute("profile", profileContents);
    System.out.println(profileContents.toString());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=1040">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Profile</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>


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


    <style>
        .card-body {
            padding: 0.6rem !important;
        }

        .t-3 {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="text-center">
    <%--Banner--%>
    <div class="shadow-sm">
        <div class="container">
            <div class="row p-1">
                <div class="col-3">


                    <div class="text-left form-title-text mb-3">My

                        <a href="/profileedit.do?type=edit"
                           class="text-decoration-none text-grayDark-color position-absolute button-text"
                           style="right:10px;"><img
                                style="width: 17px; height: 17px;"
                                src="../../../resources/images/edit.svg"/></a>
                    </div>


                    <c:choose>
                        <c:when test="${not empty user.img}">
                            <img width="136" height="136" src="<%=request.getContextPath()%>${user.img}"
                                 style="border-radius: 70px;"/>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${user.gender eq 'man'}">
                                    <img width="136" height="136" src="../../../resources/images/man_icon.svg"/>
                                </c:when>
                                <c:otherwise>
                                    <img width="136" height="136" src="../../../resources/images/woman_icon.svg"/>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>



                    <div class="mt-3 profile-name-text">
                        ${user.id}
                    </div>
                    <div class="row pl-5 mt-3">
                        <div>
                            <img class="mr-2" width="14" height="28" src="../../../resources/images/profile_logged_in.svg"/>
                            <span class="button-text">${user.nickname}</span>
                        </div>
                    </div>
                    <div class="row pl-5 mt-2">
                        <div>
                            <img class="mr-2" width="16" height="14" src="../../../resources/images/mail.svg"/>
                            <span class="button-text">${user.email}</span>
                        </div>
                    </div>
                    <div class="mt-5 mb-2">
                        <button onclick="logout();" class="button-craft1" style="font-weight: normal; width: 122px; height: 30px;">로그아웃</button>
                    </div>
                </div>
                <div class="col-9">
                    <div class="text-left form-text text-Dark-color mb-4 ml-3">
                        최근 기록
                    </div>
                    <div id="carousel-example-multi6" class="carousel slide carousel-multi-item v-2 mb-2"
                         data-ride="carousel">
                        <div id="recents" class="carousel-inner v-2" role="listbox">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Middle--%>
    <div class="container" style="margin-top: 60px;">
        <%--Add Template--%>
        <div class="text-left profile-name-text text-Dark-color mb-4 row p-0 m-0">
            내 학습
            <button onclick="getLocation('detailCreate.do?type=create');"
                    class="btn btn-block button-craft2 m-0 p-0 ml-4"
                    style="color:#fff !important; font-weight: normal !important; width: 122px; height: 30px;">
                새로 만들기
            </button>
        </div>

        <%--Add Template--%>
        <div class="row">
            <div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2"
                 data-ride="carousel">
                <div id="edits" class="carousel-inner v-2" role="listbox"
                     style="width: 1040px; margin: 0 auto 0;">

                </div>
            </div>
            <%--<div class="border-0 col-2 justify-content-center align-self-center" style=" margin:15px; padding:0;">
        <img src="../../../resources/images/add.svg" class="align-self-center pb-5" style="cursor: pointer;"/>
        </div>--%>
        </div>
        <div class="text-left profile-name-text text-Dark-color mb-4" style="margin-top: 10px;">
            공유
        </div>
        <%--Add Template--%>
        <div class="row">
            <div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2"
                 data-ride="carousel">
                <div id="shares" class="carousel-inner v-2" role="listbox"
                     style="width: 1040px; margin: 0 auto 0;">

                </div>
            </div>
            <%--<div class="border-0 col-2 justify-content-center align-self-center" style=" margin:15px; padding:0;">
        <img src="../../../resources/images/add.svg" class="align-self-center pb-5" style="cursor: pointer;"/>
        </div>--%>
        </div>

        <div class="text-left profile-name-text text-Dark-color mb-4" style="margin-top: 10px;">
            좋아하는 게임
        </div>
        <%--Add Template--%>
        <div class="row">
            <div id="carousel-example-multi2" class="carousel slide carousel-multi-item v-2"
                 data-ride="carousel">
                <div id="likes" class="carousel-inner v-2" role="listbox"
                     style="width: 1040px; margin: 0 auto 0;">
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>

    $(document).ready(function () {
        /*최근*/
        recentsSetting();
        /*내 학습*/
        editsSetting();
        /*공유*/
        sharesSetting();
        /*좋아하는*/
        likesSetting();

        $('.carousel.carousel-multi-item.v-2 .carousel-item').each(function () {
            var next = $(this).next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }
            next.children(':first-child').clone().appendTo($(this));

            for (var i = 0; i < 4; i++) {
                next = next.next();
                if (!next.length) {
                    next = $(this).siblings(':first');
                }
                next.children(':first-child').clone().appendTo($(this));
            }
        });
    });

    function recentsSetting() {
        var html = '';
        <c:forEach varStatus="status" step="6" begin="1" end="${profile.recents.size()}">
        <c:choose>
        <c:when test="${status.count eq 1}">
        html += '<div class="carousel-item d-flex p-0">';
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.recents}">
        html += '<div class="col-2 col-md-2">\n' +
            '                            <div class="card mb-2 border-0">\n' +
            '                                           <img class="card-img-top" style="height: 130px;" src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg">\n' +
            '                                           <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '                                           <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '                                           <div class="pt-2" >\n' +
            '                                           <img onclick="goClicked(3,${content.no},\'${content.state}\')" src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '                                           </div>\n' +
            '                            </div>\n' +
            '                        </div>\n';
        </c:forEach>
        html += '</div>';
        </c:when>
        </c:choose>
        </c:forEach>
        $('#recents').html(html);
    }

    function editsSetting() {
        $('#edits').html('');
        var html = '';
        <c:forEach varStatus="status" step="6" begin="1" end="${profile.edits.size()}">
        <c:choose>
        <c:when test="${status.count eq 1}">
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.edits}">
        html += '<div class="col-xs-2 col-sm-2 col-md-2">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(1,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:when>
        <c:otherwise>
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.edits}">
        html += '<div class="col-xs-2 col-sm-2 col-md-2 t-3">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(1,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        $('#edits').html(html);
    }

    function sharesSetting() {
        $('#shares').html('');
        var html = '';
        <c:forEach varStatus="status" step="6" begin="1" end="${profile.shares.size()}">
        <c:choose>
        <c:when test="${status.count eq 1}">
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.shares}">
        html += '<div class="col-xs-2 col-sm-2 col-md-2">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(2,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:when>
        <c:otherwise>
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.shares}">
        html += '<div class="col-xs-2 col-sm-2 col-md-2 t-3">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(2,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        $('#shares').html(html);
    }

    function likesSetting() {
        $('#likes').html('');
        var html = '';
        <c:forEach varStatus="status" step="6" begin="1" end="${profile.likes.size()}">
        <c:choose>
        <c:when test="${status.count eq 1}">
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.likes}">
        html += '<div id="${content.no}" class="col-xs-2 col-sm-2 col-md-2">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;"/>\n' +
            '    <img onclick="deleteClicked(${content.no})" class="position-absolute" src="../../resources/images/delete_contents.png" style="top: 9px; right: 23px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(2,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:when>
        <c:otherwise>
        <c:forEach varStatus="status_sub" begin="${status.index-1}" end="${status.index-1+5}" step="1" var="content" items="${profile.likes}">
        html += '<div class="col-xs-2 col-sm-2 col-md-2 t-3">\n' +
            '    <img src="../../resources/images/main_content_sample' + '${status_sub.count%4+1}' + '.svg" style="height: 130px;">\n' +
            '    <img onclick="deleteClicked()" class="position-absolute" src="../../resources/images/delete_contents.png" style="top: 9px; right: 23px;">\n' +
            '    <div class="content-my-title-text mt-2">${content.name}</div>\n' +
            '    <div class="content-my-subtitle-text mt-1">${content.title}</div>\n' +
            '    <div class="pt-2">\n' +
            '        <img onclick="goClicked(2,${content.no})"  src="../../resources/images/main_go.svg" style="height: 25px;">\n' +
            '    </div>\n' +
            '</div>';
        </c:forEach>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        $('#likes').html(html);
    }

    function goClicked(type, content_no, state) {
        if (type == 1) {
            var form = document.createElement("form");
            form.setAttribute("method", "GET");
            form.setAttribute("action", '/detailCreate.do');
            var hiddenField1 = document.createElement("input");
            hiddenField1.setAttribute("type", "hidden");
            hiddenField1.setAttribute("name", "type");
            hiddenField1.setAttribute("value", "edit");
            form.appendChild(hiddenField1);
            var hiddenField2 = document.createElement("input");
            hiddenField2.setAttribute("type", "hidden");
            hiddenField2.setAttribute("name", "content_no");
            hiddenField2.setAttribute("value", content_no);
            form.appendChild(hiddenField2);
            $(document.body).append(form);
            form.submit();
        } else if (type == 2) {
            /*share and likes*/
            location.href = '/detail.do?content_no=' + content_no;
        } else if (type == 3) {
            var stateStr = state + '';
            alert(stateStr);
            if (stateStr == 'edit') {
                var form = document.createElement("form");
                form.setAttribute("method", "GET");
                form.setAttribute("action", '/detailCreate.do');
                var hiddenField1 = document.createElement("input");
                hiddenField1.setAttribute("type", "hidden");
                hiddenField1.setAttribute("name", "type");
                hiddenField1.setAttribute("value", "edit");
                form.appendChild(hiddenField1);
                var hiddenField2 = document.createElement("input");
                hiddenField2.setAttribute("type", "hidden");
                hiddenField2.setAttribute("name", "content_no");
                hiddenField2.setAttribute("value", content_no);
                form.appendChild(hiddenField2);
                $(document.body).append(form);
                form.submit();
            } else if (stateStr == 'share') {
                location.href = '/detail.do?content_no=' + content_no;
            }
        }
    }

    function deleteClicked(content_no) {
        deleteLikeByDetail('${user.no}',""+content_no);
        $('#'+content_no).hide();
        //likesSetting();
    }
</script>
</body>
</html>
