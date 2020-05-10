<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-09
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if(request.getSession().getAttribute("USER")!=null){
        request.setAttribute("check",true);
    }else{
        request.setAttribute("check",false);
    }
%>
<style>
    .nav-item .nav-link .nav-no-height {
        line-height: inherit;
    }

    .nav-item .nav-link {
        line-height: 50px;
    }
    .navbar-toggler{
        width: 47px;
        height: 34px;
        border:none;
    }
    .navbar-toggler .line{
        width: 100%;
        float: left;
        height: 2px;
        background-color: #fff;
        margin-bottom: 5px;
    }
</style>

<!-- Navbar -->
<nav class="navbar-light navbar navbar-expand-lg navbar-dark scrolling-navbar bg-white">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand text-black-color" href="/main.do">
            <img style="width: 208px;height: 50px;" src="../../../resources/images/logo.svg"/>
        </a>
        <!-- Collapse -->
        <button class="navbar-toggler bg-blueDark-color" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation" >
            <span class="line"></span>
            <span class="line"></span>
            <span class="line" style="margin-bottom: 0;"></span>
        </button>
        <!-- Links -->
        <div class="collapse navbar-collapse" style="cursor: default;" id="navbarSupportedContent">
            <!-- Left -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light text-black-color button-text mr-5 cursor-pointer"
                       style="font-size: 1.0rem !important; font-weight: normal !important;" onclick="getLocationMain('/main.do','study');">학습하고</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light text-black-color button-text mr-5"
                       style="font-size: 1.0rem !important; font-weight: normal !important;" href="/notice.do">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light text-black-color button-text mr-5"
                       style="font-size: 1.0rem !important; font-weight: normal !important;" href="/qna.do">고객센터</a>
                </li>
                <c:choose>
                    <c:when test="${check}">
                        <li class="nav-item">
                            <a href="/profile.do"
                               class="nav-link nav-no-height waves-effect waves-light text-black-color button-text mr-5"><img
                                    src="../../../resources/images/logged_in.svg"></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light text-black-color button-text mr-5"
                               style="font-size: 1.0rem !important; font-weight: normal !important;" href="/login.do">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-light text-black-color button-text mr-5"
                               style="font-size: 1.0rem !important; font-weight: normal !important;" href="/register.do">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<!-- Navbar -->