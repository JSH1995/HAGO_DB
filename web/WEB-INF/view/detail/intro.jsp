<%@ page import="models.AdminManage" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-11
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    AdminManage adminManage = (AdminManage) request.getAttribute("admin");
    request.setAttribute("admin", adminManage);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Company Intro</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <c:if test="${not empty admin.comIntro}">
        <img style="width: 100%" src="<%=request.getContextPath()%>${admin.comIntro}">
    </c:if>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
