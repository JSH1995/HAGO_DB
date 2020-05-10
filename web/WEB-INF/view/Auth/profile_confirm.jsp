<%@ page import="models.User" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-09
  Time: 오후 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int state = Integer.parseInt(request.getAttribute("state") != null ? String.valueOf(request.getAttribute("state")) : "0");
    request.setAttribute("state", state);
    String where = (String) request.getAttribute("type");
    request.setAttribute("where", where);
    System.out.println("where : " + where);
    User user = (User) request.getAttribute("user");
    request.setAttribute("user", user);
    System.out.println("user : "+user);
    if (request.getAttribute("content_no") != null) {
        request.setAttribute("action", "/profileconfirm.do?type=" + where + "&content_no=" + request.getAttribute("content_no"));
    } else {
        request.setAttribute("action", "/profileconfirm.do?type=" + where);
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
    <title>Profile Confirm</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
</head>
<body class="text-center" cz-shortcut-listen="true">
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="text-left profile-name-text" style="padding-left: 25px; width: 1040px !important; margin: 70px auto;">
    내 정보
</div>
<div class="container" style="width: 564px !important; margin: 0 auto 260px;">
    <form class="form-signin" method="post" onsubmit="return valueCheck();" action="${action}"
          style="max-width: 564px !important;">
        <div class="form-label-group mb-2 row">
            <div class="col-12">
                <c:choose>
                    <c:when test="${not empty user.img}">
                        <img class="mb-2" src="<%=request.getContextPath()%>${user.img}" alt="" width="140"
                             height="140" style="border-radius: 70px;">
                    </c:when>
                    <c:otherwise>
                        <img class="mb-2" src="../../../resources/images/profile_default.svg" alt="" width="140"
                             height="140">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-12">
                <div class="h3 mt-2 mb-5 font-weight-normal title-text" style="margin-bottom: 80px !important;">
                    <span>${user.nickname}</span>
                </div>
            </div>
            <div class="col-12 d-flex flex-row">
                <label for="inputPassword" class="button-text" style="font-weight: bold !important;">본인 확인을 위해 비밀번호를
                    입력해주세요.</label>
            </div>
            <div class="col-12 mt-2 d-flex flex-row mt-2">
                <input type="password" id="inputPassword" name="inputPassword" class="form-control button-text mr-4"
                       placeholder="비밀번호를 입력해주세요."
                       required="">
                <button class="btn btn-block auth-submit text-white"
                        style="height: 48px; margin-top: 5px; width: 56px; border-radius: 50px;"
                        type="submit">
                    <img src="../../../resources/images/enter_arrow.svg">
                </button>
            </div>
            <div class="tag-hide" id="message">
                <div class="col-12 d-flex flex-row ml-1">
                    <%--State Wrong--%>
                    <span class="text-blue-color footer-text">비밀번호가 틀렸습니다. 다시 입력해주세요</span>
                </div>
                <div class="col-12 d-flex flex-row ml-1 mt-2">
                    <a href="/passwordsearch.do" class="border-bottom pb-1 text-decoration-none">
                        <div>
                            <img class="justify-content-center mb-1" style="width: 13px; height: 18px;"
                                 src="../../../resources/images/lock.svg">
                            <div class="d-inline-block pl-2 footer-text text-grayDark-color">비밀번호를 잊으셨나요?</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        document.getElementById('inputPassword').focus();
        confirmCheck();
    });

    function valueCheck() {
        var checkValue = false;
        checkValue = inspection('inputPassword', 'password') ? true : false;
        return checkValue;
    }

    function confirmCheck() {
        var state = ${state};
        switch (state) {
            case 1:
                $('#message').addClass("tag-hide");
                alert("Confirmed");
                if (${where eq 'create'}) {
                    getLocation("/detailCreate.do");
                } else if (${where eq 'edit'}) {
                    getLocation("/profileedit.do");
                } else if (${where eq 'cEdit'}) {
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
                    hiddenField2.setAttribute("value", "${content_no}");
                    form.appendChild(hiddenField2);
                    $(document.body).append(form);
                    alert("getLocation");
                    form.submit();
                }
                break;
            case 2:
                alert("Password Failed");
                $('#message').removeClass("tag-hide");
                break;
            case 3:
                console.log(3);
                alert("Error");
                break;
            default:
                console.log(4);
                break;
        }
    }
</script>
<script src="../../../resources/js/inspect.js" type="text/javascript"></script>
</body>
</html>
