<%@ page import="models.User" %>
<%@ page import="java.util.Calendar" %><%--
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
    int state = Integer.parseInt(request.getAttribute("state") != null ? String.valueOf(request.getAttribute("state")) : "2");
    request.setAttribute("state", state);
    Calendar cal = Calendar.getInstance();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Profile Edit</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
    <jsp:include page="../../../common/util.jsp" flush="false"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form class="form-signin" method="post" onsubmit="return valueCheck()" enctype="multipart/form-data"
      action="/profileedit.do"
      style="margin-top: 100px; margin-bottom: 100px;">
    <div class="text-center" style="margin-bottom: 72px;">
        <div class="container text-left text-black-color profile-name-text"
             style="padding-left: 25px; width: 1040px !important; margin: 70px auto;">정보 수정
        </div>
        <div class="mb-4" style="height: 180px;">
            <input class="tag-hide" id="inputFile" type="file" name="inputFile"/>
            <a onclick="$('#inputFile').click()"
               class="cursor-pointer text-decoration-none dis-inline-block position-relative"
               style="padding-right:145px !important; height: inherit;">
                <c:choose>
                    <c:when test="${not empty user.img}">
                        <img id="profile-image" src="<%=request.getContextPath()%>${user.img}" class="position-absolute"
                             alt=""
                             width="145"
                             height="145" style="border-radius: 70px;"/>
                    </c:when>
                    <c:otherwise>
                        <img id="profile-image" src="../../../resources/images/profile_default.svg"
                             class="position-absolute" alt=""
                             width="145"
                             height="145"/>
                    </c:otherwise>
                </c:choose>
                <img class="position-absolute" style="bottom: 35px; right: 0;"
                     src="../../../resources/images/picture.svg" alt="" width="55" height="55"/>
            </a>
        </div>
        <div class="h3 mb-3 font-weight-normal text-black-color profile-name-text">${user.nickname}</div>
    </div>
    <div class="container" style="width: 564px !important;">
        <div class="row">
            <div class="col-9 form-label-group mb-4">
                <label class="pb-2 pl-1 form-title-text mr-3">아이디</label>
                <span class="form-title-text text-black-color">${user.id}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-12 form-label-group mb-3">
                <label for="inputPassword" class="pb-2 pl-1 form-title-text">비밀번호 재설정</label>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control"
                       placeholder="현재 비밀번호를 입력해주세요."
                       required="">
                <input type="password" id="inputNewPassword" name="inputNewPassword" class="form-control mt-2"
                       placeholder="새 비밀번호를 입력해주세요. (6자 이상)"
                       required="">
                <input type="password" id="inputNewPasswordCheck" name="inputNewPasswordCheck"
                       class="form-control mt-2"
                       placeholder="새 비밀번호를 한번 더 입력해주세요."
                       required="">
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <label for="inputNickname" class="pb-2 pl-1 form-title-text">닉네임</label>
                <input type="text" id="inputNickname" name="inputNickname" class="form-control mb-3"
                       placeholder="닉네임을 입력해주세요." value="${user.nickname}"
                       required="">
            </div>
        </div>
        <div class="row mb-1 mt-3">
            <div class="col-12">
                <div class="col-12 form-title-text" style="padding-left: 0; padding-bottom: 16px;">생년 월일</div>
            </div>
            <div class="row col-12" style="padding-right: 0 !important;">
                <div class="col-4">
                        <select id="inputYear" name="inputYear" class="custom-select"
                                style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">

                            <c:forEach var="i" begin="1960" end="<%=cal.get(Calendar.YEAR)%>" step="1">
                                <option value=${i} <c:if test="${user.year eq i}"> selected </c:if>>${i}년</option>
                            </c:forEach>
                        </select>
                </div>
                <div class="col-4">
                    <select id="inputMonth" name="inputMonth" class="custom-select"
                            style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">
                        <option value="1" <c:if test="${user.month eq '01'}"> selected</c:if>>1월</option>
                        <option value="2" <c:if test="${user.month eq '02'}">selected</c:if>>2월</option>
                        <option value="3" <c:if test="${user.month eq '03'}">selected</c:if>>3월</option>
                        <option value="4" <c:if test="${user.month eq '04'}">selected</c:if>>4월</option>
                        <option value="5" <c:if test="${user.month eq '05'}">selected</c:if>>5월</option>
                        <option value="6" <c:if test="${user.month eq '06'}">selected</c:if>>6월</option>
                        <option value="7" <c:if test="${user.month eq '07'}">selected</c:if>>7월</option>
                        <option value="8" <c:if test="${user.month eq '08'}">selected</c:if>>8월</option>
                        <option value="9" <c:if test="${user.month eq '09'}">selected</c:if>>9월</option>
                        <option value="10" <c:if test="${user.month eq '10'}">selected</c:if>>10월</option>
                        <option value="11" <c:if test="${user.month eq '11'}">selected</c:if>>11월</option>
                        <option value="12" <c:if test="${user.month eq '12'}">selected</c:if>>12월</option>
                    </select>
                </div>
                <div class="col-4" style="padding-right: 0!important;">
                    <select id="inputDay" name="inputDay" class="custom-select"
                            style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">
                        <option value="1" <c:if test="${user.day eq '01'}">selected</c:if>>1일</option>
                        <option value="2" <c:if test="${user.day eq '02'}">selected</c:if>>2일</option>
                        <option value="3" <c:if test="${user.day eq '03'}">selected</c:if>>3일</option>
                        <option value="4" <c:if test="${user.day eq '04'}">selected</c:if>>4일</option>
                        <option value="5" <c:if test="${user.day eq '05'}">selected</c:if>>5일</option>
                        <option value="6" <c:if test="${user.day eq '06'}">selected</c:if>>6일</option>
                        <option value="7" <c:if test="${user.day eq '07'}">selected</c:if>>7일</option>
                        <option value="8" <c:if test="${user.day eq '08'}">selected</c:if>>8일</option>
                        <option value="9" <c:if test="${user.day eq '09'}">selected</c:if>>9일</option>
                        <option value="10" <c:if test="${user.day eq '10'}">selected</c:if>>10일</option>
                        <option value="11" <c:if test="${user.day eq '11'}">selected</c:if>>11일</option>
                        <option value="12" <c:if test="${user.day eq '12'}">selected</c:if>>12일</option>
                        <option value="13" <c:if test="${user.day eq '13'}">selected</c:if>>13일</option>
                        <option value="14" <c:if test="${user.day eq '14'}">selected</c:if>>14일</option>
                        <option value="15" <c:if test="${user.day eq '15'}">selected</c:if>>15일</option>
                        <option value="16" <c:if test="${user.day eq '16'}">selected</c:if>>16일</option>
                        <option value="17" <c:if test="${user.day eq '17'}">selected</c:if>>17일</option>
                        <option value="18" <c:if test="${user.day eq '18'}">selected</c:if>>18일</option>
                        <option value="19" <c:if test="${user.day eq '19'}">selected</c:if>>19일</option>
                        <option value="20" <c:if test="${user.day eq '20'}">selected</c:if>>20일</option>
                        <option value="21" <c:if test="${user.day eq '21'}">selected</c:if>>21일</option>
                        <option value="22" <c:if test="${user.day eq '22'}">selected</c:if>>22일</option>
                        <option value="23" <c:if test="${user.day eq '23'}">selected</c:if>>23일</option>
                        <option value="24" <c:if test="${user.day eq '25'}">selected</c:if>>24일</option>
                        <option value="25" <c:if test="${user.day eq '25'}">selected</c:if>>25일</option>
                        <option value="26" <c:if test="${user.day eq '26'}">selected</c:if>>26일</option>
                        <option value="27" <c:if test="${user.day eq '27'}">selected</c:if>>27일</option>
                        <option class="days-needs-28" value="28"
                                <c:if test="${user.day eq '28'}">selected</c:if>>28일
                        </option>
                        <option class="days-needs-29" value="29"
                                <c:if test="${user.day eq '29'}">selected</c:if>>29일
                        </option>
                        <option class="days-needs-30" value="30"
                                <c:if test="${user.day eq '30'}">selected</c:if>>30일
                        </option>
                        <option class="days-needs-31" value="31"
                                <c:if test="${user.day eq '31'}">selected</c:if>>31일
                        </option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-9">
                <label for="inputEmail" class="pb-2 pl-1 form-title-text">이메일</label>
                <input type="text" id="inputEmail" name="inputEmail" class="form-control mb-2"
                       placeholder="이메일을 입력해주세요." value="${user.email}"
                       required="">
            </div>
            <div class="col-3 align-self-end pb-3">
                <input type="button" onclick="duplicateMail();" class="btn btn-block button-craft1" value="메일 인증" style="height: 33px !important;"/>
            </div>
        </div>
        <div class="row">
            <div class="col-9">
                <input type="text" id="inputNumber" name="inputNumber" class="form-control mb-3"
                       placeholder="발송된 인증문자 12자리를 입력해주세요."
                       required="">
            </div>
            <div id="emailProgress" style="padding-top: 18px;"
                 class="tag-hide col-3 align-self-center text-blue-color button-text"><img
                    src="../../../resources/images/ajax_loader.gif"/></div>
            <div id="emailCheck" class="tag-hide col-3 align-self-end text-blue-color button-text"
                 style="padding-bottom: 18px;">
                E-mail을 확인 해주세요.
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-9">
                <label for="inputPhone" class="pb-2 pl-1 form-title-text">휴대폰</label>
                <input type="number" id="inputPhone" name="inputPhone" class="form-control mb-3"
                       placeholder="휴대폰 번호 ‘-‘를 제외하고 입력해주세요." value="0${user.phone}"
                       required="">
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <button class="btn btn-block mt-4 mb-4 auth-submit text-white ml-0 mr-0" type="submit" style="height: 48px !important;">저장</button>
            </div>
        </div>
    </div>
</form>
<jsp:include page="../common/footer.jsp"/>
<script src="../../../resources/js/inspect.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        profileeditChek();
        $('#inputFile').change(function () {
            $('#profile-image').attr('src', URL.createObjectURL(this.files[0]));
        });
    });

    function exist(id) {
        var value = $('#' + id + ' option:selected').attr("value") * 1;
        console.log(value);
        if (value.length > 1) {
            return true;
        }
        return false;
    }

    function valueCheck() {
        var checkValue2 = inspection('inputPassword', 'password') ? true : false;
        var checkValue3 = inspection('inputNewPassword', 'password') ? true : false;
        var checkValue31 = inspection('inputNewPasswordCheck', 'password') ? true : false;
        var checkValue4 = inspection('inputNickname', 'nickName') ? true : false;
        var checkValue41 = exist('inputMonth') && exist('inputDay') && $('#inputYear').val() != null;
        if (checkValue41) {
            alert('생년 월일을 선택하여 주세요.');
            $('#inputDay').focus();
        }
        var checkValue5 = inspection('inputEmail', 'email') ? true : false;
        var checkValue51 = inspection('inputNumber', 'authStr') ? true : false;
        var checkValue6 = inspection('inputPhone', 'phone') ? true : false;
        var checkValue7 = ($('#inputNewPassword').val() === $('#inputNewPasswordCheck').val());
        if (checkValue7 == false) {
            alert('새비밀번호와 새비밀번호 확인을 올바르게 입력해주세요.');
            $('#inputPasswordCheck').focus();
        }
        var checkValue71 = ($('#inputPassword').val() !== $('#inputNewPassword').val());
        if (checkValue71 == false) {
            alert('비밀번호와 새비밀번호가 같습니다.');
            $('#inputNewPassword').focus();
        }
        var fileValue = $("#inputFile").val().split("\\");
        var fileName = fileValue[fileValue.length - 1];
        if (fileName == null || fileName == undefined) {
            /*올린 파일이 없을 경우*/
            if (checkValue2 && checkValue3 && checkValue31 && checkValue4 && checkValue5 && checkValue51 && checkValue6 && checkValue7 && checkValue71) {
                return true;
            } else {
                return false;
            }
        } else {
            /*올린 파일이 있을 경우*/
            var fileValue = $("#" + 'inputFile').val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            if (fileName.length > 1) {
                if (checkValue2 && checkValue3 && checkValue31 && checkValue4 && checkValue5 && checkValue51 && checkValue6 && checkValue7 && checkValue71) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    }

    function duplicateMail() {
        var valueCheck = inspection('inputEmail', 'email') ? true : false;
        if (valueCheck) {
            duplicatedMailprofile('${user.id}', $('#inputEmail').val(), 'auth');
        }
    }

    function profileeditChek() {
        var state = ${state};
        switch (state) {
            case 1:
                console.log(1);
                alert("Profile Edit Success");
                getLocation("profile.do");
                break;
            case 0:
                console.log(2);
                alert("Profile Edit Failed Token is not same");
                break;
            default:
                break;
        }
    }
</script>
</body>
</html>
