<%@ page import="models.User" %>
<%@ page import="models.Content" %>
<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-17
  Time: 오후 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User user = (User) request.getAttribute("user");
    request.setAttribute("user", user);
    if (request.getAttribute("state") != null) {
        request.setAttribute("state", (int) request.getAttribute("state"));
    }
    if (request.getAttribute("content") != null) {
        /*EDIT*/
        Content content = (Content) request.getAttribute("content");
        request.setAttribute("content", content);
    } else {
        /*CREATE*/
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>학습 상세 페이지</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/util.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
    <script src="../../../resources/js/inspect.js" type="text/javascript"></script>
    <style>
        .opacity-full {
            font-size: 12px !important;
            background-color: #5EBEFE !important;
            color:#FFF !important;
        }

        input {
            height: 48px !important;
        }

        .w-15 {
            width: 15% !important;
        }

        .w-85 {
            width: 85% !important;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container text-center">
    <form id="createForm" onsubmit="return save()" method="post">
        <div class="row p-0 mt-3">
            <div class="col-7 m-0 p-0 pr-2">
                <img src="../../../resources/images/detail_banner.svg" class="img-fluid"/>
            </div>
            <div class="col-5 m-0 p-0 text-left">
                <div class="row m-0 p-0 pr-2">
                    <div class="row col-12 m-0 p-0 ml-2">
                        <span class="my-auto w-15 detail-title-text">제목</span>
                        <div class="w-85 pl-2">
                            <input type="text" id="inputTitle" name="inputTitle" class="form-control"
                                   placeholder="제목을 입력해주세요."
                                   required="" autofocus="">
                        </div>
                    </div>
                </div>
                <div class="row m-0 p-0 pr-2 mt-4">
                    <div class="row col-12 m-0 p-0 ml-2">
                        <span class="my-auto w-15 detail-title-text">설명</span>
                        <div class="w-85 pl-2">
                            <input type="text" id="inputDescript" name="inputDescript" class="form-control"
                                   placeholder="설명을 입력해주세요." required="" autofocus="">
                        </div>
                    </div>
                </div>
                <div class="row m-0 p-0 pr-2 mt-4">
                    <div class="row col-12 m-0 p-0 ml-2">
                        <span class="my-auto w-15 detail-title-text">카테고리</span>
                        <div class="w-85 pl-2">
                            <input type="text" class="tag-hide" name="inputCategory" id="inputCategory">
                            <div>
                                <a id="science" onclick="categoryClick('science')" class="btn button-craft5 shadow-sm opacity-full"><img
                                        style="margin-right: 7px; width: 15px; height: 15px;"
                                        src="../../../resources/images/science.svg">과학
                                </a>
                                <a id="social" onclick="categoryClick('social')" class="btn button-craft5 shadow-sm"><img
                                        style="margin-right: 7px; width: 15px; height: 15px;"
                                        src="../../../resources/images/social.svg">사회
                                </a>
                                <a id="language" onclick="categoryClick('language')" class="btn button-craft5 shadow-sm"><img
                                        style="margin-right: 7px; width: 15px; height: 15px;"
                                        src="../../../resources/images/language.svg">국어
                                </a>
                                <a id="math" onclick="categoryClick('math')" class="btn button-craft5 shadow-sm"><img
                                        style="margin-right: 7px; width: 15px; height: 15px;"
                                        src="../../../resources/images/math.svg">수학
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row m-0 p-0 pr-2 mt-4">
                    <div class="row col-12 m-0 p-0 ml-2">
                        <span class="mb-auto w-15 detail-title-text">상세 설명</span>
                        <div class="w-85 pl-2">
                        <textarea type="text" id="inputDetailDescript" name="inputDetailDescript"
                                  class="non-form-control" placeholder="자세한 설명을 입력해주세요." required="" autofocus=""
                                  style="height: 180px;"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12 row">
                        <div class="col-12 text-center mr-4 ml-3 pr-1">
                            <img onclick="share()" class="cursor-pointer w-100" src="../../../resources/images/detail_create_button.svg"
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
                <div class="footer-text mt-auto pb-1">콘텐츠가 만들어진 의도와 목표를 이해한 후 학습을 즐겨보세요!</div>
            </div>
        </div>
        <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
            <input id="inputContents" name="inputContents" type="text" class="tag-hide"/>
            <div class="row col-12 m-0 p-0 text-left">
                <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
                <div id="title1" style="width: 95%;">
                    <input type="text" id="inputLearning-1" name="inputLearning1" class="non-form-control"
                           placeholder="이런걸 배워요 제목을 입력해주세요." required="" autofocus="">
                </div>
            </div>
            <div class="row col-12 m-0 p-0 text-left">
                <div class="mr-3" style="width: 22px;">

                </div>
                <div style="width: 95%;" class="mt-2">
               <textarea type="text" id="inputLearningDetail-1" name="inputLearningDetail1" class="non-form-control"
                         placeholder="이런걸 배워요 설명을 입력해주세요." required="" autofocus="" style="height: 200px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
            <div class="row col-12 m-0 p-0 text-left">
                <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
                <div style="width: 95%;">
                    <input type="text" id="inputLearning-2" name="inputLearning2" class="non-form-control"
                           placeholder="이런걸 배워요 제목을 입력해주세요." required="" autofocus="">
                </div>
            </div>
            <div class="row col-12 m-0 p-0 text-left">
                <div class="mr-3" style="width: 22px;">

                </div>
                <div style="width: 95%;" class="mt-2">
               <textarea type="text" id="inputLearningDetail-2" name="inputLearningDetail2" class="non-form-control"
                         placeholder="이런걸 배워요 설명을 입력해주세요." required="" autofocus="" style="height: 200px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row ml-3 mr-0 mb-0 p-0 m-t-40">
            <div class="row col-12 m-0 p-0 text-left">
                <img src="../../../resources/images/detail_blue_arrow_28.svg" class="img-fluid mr-3"/>
                <div style="width: 95%;">
                    <input type="text" id="inputLearning-3" name="inputLearning3" class="non-form-control"
                           placeholder="이런걸 배워요 제목을 입력해주세요." required="" autofocus="">
                </div>
            </div>
            <div class="row col-12 m-0 p-0 text-left">
                <div class="mr-3" style="width: 22px;">

                </div>
                <div style="width: 95%;" class="mt-2">
               <textarea type="text" id="inputLearningDetail-3" name="inputLearningDetail3" class="non-form-control"
                         placeholder="이런걸 배워요 설명을 입력해주세요." required="" autofocus="" style="height: 200px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row ml-3 mr-0 p-0 m-t-40 m-b-50" style="width: 97%;">
            <div class="row col-12 m-0 p-0 justify-content-end">
                <button type="submit" id="submit" class="tag-hide"></button>
                <img onclick="$('#submit').click();" class="cursor-pointer" src="../../../resources/images/detail_create_save.svg"/>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
    $(document).ready(function () {
        $('#inputLearningDetail-3').val('');
        $('#inputLearningDetail-1').val('');
        $('#inputLearningDetail-2').val('');
        if (${state eq 2 && not empty content}) {
            /*Create 저장 성공*/
            location.href = "/detailCreate.do?type=${content.state}&content_no=${content.no}";
        }
        /*default category science*/
        categoryClick(null);
        if (${not empty content}) {
            editSetting();
        }
    });

    function editSetting() {
        /*name*/
        $('#inputTitle').val(inputInjection('${content.name}'));
        /*title*/
        $('#inputDescript').val(inputInjection('${content.title}'));
        /*category*/
        $('#inputCategory').val('${content.category}');
        /*TODO category button setting func*/
        switch ($('#inputCategory').val()) {
            case 'science':
                $('#science').click();
                break;
            case 'social':
                $('#social').click();
                break;
            case 'language':
                $('#language').click();
                break;
            case 'math':
                $('#math').click();
                break;
        }
        /*detail*/
        $('#inputDetailDescript').val(inputInjection('${content.detail}'));
        /*contents*/
        $('#inputContents').val(inputInjection('${content.contents}'));
        /*TODO contents json parse and stringfy*/
        /*TODO PARSING STUDY BB*/
        var contents = JSON.parse('${content.contents}' + '').learn;
        $('#inputLearning-1').val(inputInjection(contents[0].title));
        $('#inputLearningDetail-1').val(inputInjection(contents[0].detail));
        var str = document.getElementById("inputLearningDetail-1").value;
        str = replaceAll(str,"<br/>","\r\n");
        document.getElementById("inputLearningDetail-1").value = str;

        $('#inputLearning-2').val(inputInjection(contents[1].title));
        $('#inputLearningDetail-2').val(inputInjection(contents[1].detail));
        str = document.getElementById("inputLearningDetail-2").value;
        str = replaceAll(str,"<br/>","\r\n");
        document.getElementById("inputLearningDetail-2").value = str;

        $('#inputLearning-3').val(inputInjection(contents[2].title));
        $('#inputLearningDetail-3').val(inputInjection(contents[2].detail));
        str = document.getElementById("inputLearningDetail-3").value;
        str = replaceAll(str,"<br/>","\r\n");
        document.getElementById("inputLearningDetail-3").value = str;
    }

    function categoryClick(e) {
        $('#science img').attr('src','../../../resources/images/science.svg');
        $('#social img').attr('src','../../../resources/images/social.svg');
        $('#language img').attr('src','../../../resources/images/language.svg');
        $('#math img').attr('src','../../../resources/images/math.svg');
        $('#science').removeClass("opacity-full");
        $('#social').removeClass("opacity-full");
        $('#language').removeClass("opacity-full");
        $('#math').removeClass("opacity-full");
        if (e !== null) {
            switch (e) {
                case 'science':
                    $('#science').addClass("opacity-full");
                    $('#science img').attr('src','../../resources/images/tab_science_white.svg');
                    $('#inputCategory').val('science');
                    break;
                case 'social':
                    $('#social').addClass("opacity-full");
                    $('#social img').attr('src','../../resources/images/tab_society_white.svg');
                    $('#inputCategory').val('social');
                    break;
                case 'language':
                    $('#language').addClass("opacity-full");
                    $('#language img').attr('src','../../resources/images/tab_language_white.svg');
                    $('#inputCategory').val('language');
                    break;
                case 'math':
                    $('#math').addClass("opacity-full");
                    $('#math img').attr('src','../../resources/images/tab_math_white.svg');
                    $('#inputCategory').val('math');
                    break;
            }
        } else {
            $('#science').addClass("opacity-full");
            $('#science img').attr('src','../../resources/images/tab_science_white.svg');
            $('#inputCategory').val('science');

        }
    };

    function edit() {
        if (!${state eq 2}) {
            /*AJAX*/
            changeContentState("edit", '${content.no}');
        } else {
            alert('Saved 먼저 클릭해주세요.');
        }
    };

    function share() {
        if (!${state eq 2}) {
            /*AJAX*/
            changeContentState("share", '${content.no}');
        } else {
            alert('Saved 먼저 클릭해주세요.');
        }
    }

    function save() {
        var title = inputInjection($('#inputTitle').val()) + '';
        var descript = inputInjection($('#inputDescript').val()) + '';
        var detail = inputInjection($('#inputDetailDescript').val()) + '';

        var str = document.getElementById("inputLearningDetail-1").value;
        str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
        document.getElementById("inputLearningDetail-1").value = str;

        str = document.getElementById("inputLearningDetail-2").value;
        str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
        document.getElementById("inputLearningDetail-2").value = str;

        str = document.getElementById("inputLearningDetail-3").value;
        str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
        document.getElementById("inputLearningDetail-3").value = str;

        if (title.length >= 2 &&
            descript.length >= 1 &&
            isCategorySelected() &&
            makeContents() &&
            detail.length >= 1 && makeContents()) {
            if (${state eq 1}) {
                /*EDIT상태*/
                $('#createForm').attr('action', '/detailCreate.do?type=edit&content_no=${content.no}');
            } else if (${state eq 2}) {
                /*CREATE상태*/
                $('#createForm').attr('action', '/detailCreate.do');
            }
            return true;
        } else {
            return false;
        }
    }

    function isCategorySelected() {
        return $('#inputCategory').val().length >= 3;
    }

    function makeContents() {
        var contents = new Object();
        var objArray = new Array();
        for (var i = 1; i <= 3; i++) {
            var obj = new Object();
            //inputinjection
            obj.title = inputInjection($('#inputLearning-' + i).val());
            obj.detail = inputInjection($('#inputLearningDetail-' + i).val());
            objArray.push(obj);
        }
        contents.learn = objArray;
        $('#inputContents').val(JSON.stringify(contents).toString());
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }
</script>
</body>
</html>
