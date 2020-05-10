<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-02-28
  Time: 오후 5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    int state = Integer.parseInt(request.getAttribute("isLogin") != null ? String.valueOf(request.getAttribute("isLogin")) : "0");
    request.setAttribute("state", state);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Login</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form class="form-signin" method="post" onsubmit="return valueCheck()" action="/login.do"
      style="width: 50% !important; margin:100px auto;">
    <div class="text-center" style="margin-bottom: 97px;">
        <img class="mb-4" src="../../../resources/images/logo_symbol.svg" alt="" width="71" height="85">
        <div class="h3 mb-3 font-weight-normal text-black-color profile-name-text">로그인</div>
        <div class="text-black-color profile-sub-text">재미와 학습을 융합한 블록형 코딩 과학실</div>
    </div>
    <div class="container" style="width: 564px !important;">
        <div class="form-label-group mb-4">
            <label for="inputId" class="pb-2 pl-1 form-title-text">아이디</label>
            <input type="text" id="inputId" name="inputId" class="form-control" placeholder="아이디를 입력해주세요."
                   required=""
                   autofocus="">
        </div>

        <div class="form-label-group mb-3 mt-4">
            <label for="inputPassword" class="pb-2 pl-1 form-title-text">비밀번호</label>
            <input type="password" id="inputPassword" name="inputPassword" class="form-control"
                   placeholder="비밀번호를 입력해주세요.(6자 이상)"
                   required="">
        </div>
     <%--   <div>
            <input id="remember" type="checkbox" name="remember" value="true" class="trigger">
            <label for="remember" class="checker" style="padding-left: 50px;">
                <div class="button-text" style="line-height: 40px; width: 175px;">로그인 상태 유지</div>
            </label>
        </div>
--%>
        <button class="btn btn-block mt-5 mb-4 auth-submit text-white" type="submit" style="height: 48px;">로그인</button>
    </div>
    <div class="pt-4 text-center">
        <ul>
            <a href="/register.do"
               class="text-decoration-none waves-effect waves-light text-black-color button-text pr-2">회원가입</a>

            <a href="/idsearch.do"
               class="text-decoration-none waves-effect waves-light text-black-color button-text center-line ml-2 pr-4 mr-2 pl-4">아이디
                찾기</a>

            <a href="/passwordsearch.do"
               class="text-decoration-none waves-effect waves-light text-black-color button-text pl-2">비밀번호 찾기</a>
        </ul>
    </div>
</form>
<jsp:include page="../common/footer.jsp"/>
<script src="../../../resources/js/inspect.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        loginCheck();
        $("input:checkbox").on('click', function () {
            if ($(this).prop('checked')) {
                $(this).parent().addClass("selected");
                console.log('checked');
            } else {
                $(this).parent().removeClass("selected");
                console.log('unchecked');
            }
        });
    });

    function valueCheck() {
        var checkValue = false;
        checkValue = inspection('inputId', 'id') ? true : false;
        if (checkValue) {
            checkValue = inspection('inputPassword', 'password') ? true : false;
            if (checkValue) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    function loginCheck() {
        var state = ${state};
        switch (state) {
            case 1:
                console.log(1);
                alert("Login Success");
                getLocation("main.do");
                break;
            case 2:
                console.log(2);
                alert("Password Failed");
                break;
            case 3:
                console.log(3);
                alert("Id Not Exist");
                break;
            case 4:
                console.log(4);
                alert("Server is not Opening");
                break;
            default:
                console.log(5);
                break;
        }
    }
</script>
</body>
</html>