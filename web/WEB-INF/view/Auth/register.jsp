<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-02-28
  Time: 오후 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
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
    <title>Register</title>
    <jsp:include page="../../../common/style.jsp" flush="false"/>
    <jsp:include page="../../../common/font.jsp" flush="false"/>
    <jsp:include page="../../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../../common/ajaxs.jsp" flush="false"/>
    <script src="../../../resources/js/inspect.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<form class="form-signin" method="post" action="/register.do" enctype="multipart/form-data"
      onsubmit="return(valueCheck())"
      style="width: 564px; margin:100px auto;">
    <div class="text-center" style="margin-bottom: 97px;">
        <img class="mb-4" src="../../../resources/images/logo_symbol.svg" alt="" width="71" height="85">
        <div class="h3 mb-3 font-weight-normal text-black-color profile-name-text">회원 가입</div>
        <div class="text-black-color profile-sub-text">재미와 학습을 융합한 블록형 코딩 과학실</div>
    </div>
    <div class="container" style="width: 564px !important;">
        <div class="row">

            <div class="col-9 form-label-group mb-4">
                <label for="inputId" class="pb-2 pl-1 form-title-text">아이디</label>
                <input type="text" id="inputId" name="inputId" class="form-control" placeholder="아이디를 입력해주세요."
                       required=""
                       autofocus="">
            </div>
            <div class="col-3 align-self-end mt-2 mb-3" style="padding-bottom: 12px !important;">
                <input class="tag-hide" type="checkbox" id="duplicatedId"/>
                <input onclick="duplicateId();" type="button" class="btn btn-block button-craft1" value="중복 확인"
                       style="height: 33px !important;"/>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-12 form-label-group mb-3">
                <label for="inputPassword" class="pb-2 pl-1 form-title-text">비밀번호</label>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control"
                       placeholder="비밀번호를 입력해주세요.(8자 이상)"
                       required="">
                <input type="password" id="inputPasswordCheck" name="inputPasswordCheck"
                       class="form-control mt-2"
                       placeholder="비밀번호를 한번 더 입력해주세요."
                       required="">
            </div>
        </div>
        <div class="row  mt-3">
            <div class="col-12">
                <label for="inputNickname" class="pb-2 pl-1 form-title-text">닉네임</label>
                <input type="text" id="inputNickname" name="inputNickname" class="form-control mb-3"
                       placeholder="닉네임을 입력해주세요."
                       required="">
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <label class="pb-2 pl-1 form-title-text">성별</label>
                <div style="text-align: center;">
                    <input type="text" id="inputMan" name="gender" value="" class="tag-hide">
                    <a id="man_a" onclick="genderClicked('man')" style="margin-right: 100px"><img
                            src="../../../resources/images/man_icon.svg" alt="no_icon" width="100" height="100"></a>
                    <a id="woman_a" onclick="genderClicked('woman')"><img src="../../../resources/images/woman_icon.svg"
                                                                          alt="no_icon" width="100" height="100"></a>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <div class="col-12 form-title-text" style="padding-left: 0; padding-bottom: 16px;">생년 월일</div>
            </div>
            <div class="row col-12" style="padding-right: 0 !important;">
                <div class="col-4">
<%--                    <input type="number" id="inputYear" name="inputYear" class="form-control text-right"
                           required="" style="padding-right: 50px;">--%>
                    <select id="inputYear" name="inputYear" class="custom-select"
                            style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">
                    <c:forEach var="i" begin="1960" end="<%=cal.get(Calendar.YEAR)%>" step="1">
                        <option value=${i}>${i}년</option>
                    </c:forEach>
                    </select>
                    <%--<div style="position:absolute; right: 40px;top: 12px;" class="form-text">년</div>--%>
                </div>
                <div class="col-4">
                    <select id="inputMonth" name="inputMonth" class="custom-select"
                            style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                </div>
                <div class="col-4" style="padding-right: 0!important;">
                    <select id="inputDay" name="inputDay" class="custom-select"
                            style="background: #fff url(../resources/images/down_select.svg)  no-repeat right 0.75rem center/15px 10px; height: 48px; padding-right: 45px; text-align-last: right">
                        <option value="1">1일</option>
                        <option value="2">2일</option>
                        <option value="3">3일</option>
                        <option value="4">4일</option>
                        <option value="5">5일</option>
                        <option value="6">6일</option>
                        <option value="7">7일</option>
                        <option value="8">8일</option>
                        <option value="9">9일</option>
                        <option value="10">10일</option>
                        <option value="11">11일</option>
                        <option value="12">12일</option>
                        <option value="13">13일</option>
                        <option value="14">14일</option>
                        <option value="15">15일</option>
                        <option value="16">16일</option>
                        <option value="17">17일</option>
                        <option value="18">18일</option>
                        <option value="19">19일</option>
                        <option value="20">20일</option>
                        <option value="21">21일</option>
                        <option value="22">22일</option>
                        <option value="23">23일</option>
                        <option value="24">24일</option>
                        <option value="25">25일</option>
                        <option value="26">26일</option>
                        <option value="27">27일</option>
                        <option class="days-needs-28" value="28">28일</option>
                        <option class="days-needs-29" value="29">29일</option>
                        <option class="days-needs-30" value="30">30일</option>
                        <option class="days-needs-31" value="31">31일</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row mt-4 pt-2">
            <div class="col-9">
                <label for="inputEmail" class="pb-2 pl-1 form-title-text">이메일</label>
                <input type="email" id="inputEmail" name="inputEmail" class="form-control mb-2"
                       placeholder="이메일을 입력해주세요."
                       required="">
            </div>
            <div class="col-3 align-self-end pb-3">
                <input type="button" onclick="duplicateMail();" class="btn btn-block button-craft1" value="메일 인증"
                       style="height: 33px !important;"/>
            </div>
        </div>
        <div class="row">
            <div class="col-9">
                <input type="text" id="inputNumber" name="inputNumber" class="form-control mb-2"
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
        <div class="row mt-3 pt-2">
            <div class="col-9">
                <label for="inputPhone" class="pb-2 pl-1 form-title-text">휴대폰</label>
                <input type="number" id="inputPhone" name="inputPhone" class="form-control mb-3"
                       placeholder="휴대폰 번호 ‘-‘를 제외하고 입력해주세요.">
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-9">
                <label for="inputProfile" class="pb-2 pl-1 form-title-text">프로필 이미지</label>
                <input readonly type="text" id="inputProfile" name="inputProfile" class="form-control mb-3"
                       placeholder="Jpg, png 파일을 업로드해주세요."
                       required="">
            </div>
            <div class="col-3 align-self-end" style="padding-left: 0!important; padding-bottom: 20px;">
                <img class="btn" onclick="selectProfile()"
                     src="../../../resources/images/select_photo.svg"/>
                <input type="file" class="tag-hide" id="inputFile" name="inputFile"/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <label class="pb-2 pl-1 form-title-text">약관 동의</label>
                <div class="agreeform">
                    <div class="checkbox">
                        <input id="checkAll" type="checkbox" class="trigger check checka">
                        <label for="checkAll" class="checker" style="padding-left: 70px;">
                            <div class="form-title-text" style="line-height: 40px; width: 500px; font-weight: normal !important;">모두 동의합니다</div>
                        </label>
                    </div>
                    <div style="border-top: 1px solid #E5E5E5; padding-top: 32px;">
                        <input id="agree1" type="checkbox" class="trigger check checkv">
                        <label for="agree1" class="checker" style="padding-left: 70px;">
                            <div class="container" style="width:300px;">
                                <div class="row">

                                    <div class="button-text" style="line-height: 40px;">서비스 이용에 대한 약관
                                    </div>

                                    <div class="pt-1 pl-3 pr-3" style="width: 140px;">
                                        <input type="button"
                                               onclick="window.open('about:blank').location.href='/service.do'"
                                               class="btn btn-block button-craft1" value="약관 보기"
                                               style="height: 33px !important;"/>
                                    </div>

                                </div>


                            </div>

                        </label>
                    </div>
                    <div class="pt-3">
                        <input id="agree2" type="checkbox" class="trigger check checkv">
                        <label for="agree2" class="checker" style="padding-left: 70px;">

                            <div class="container" style="width:300px;">

                                <div class="row">

                                    <div class="button-text" style="line-height: 40px;">개인 정보 처리 방침에 대한 약관
                                    </div>
                                    <div class="pt-1 pl-3 pr-3" style="width: 140px;">
                                        <input type="button"
                                               onclick="window.open('about:blank').location.href='/private.do'"
                                               class="btn btn-block button-craft1" value="약관 보기"
                                               style="height: 33px !important;"/>
                                    </div>

                                </div>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <button class="btn btn-block mt-4 mb-4 auth-submit text-white ml-0 mr-0" type="submit" style="height: 48px;">회원가입 완료
                </button>
            </div>
        </div>
    </div>
</form>
<jsp:include page="../common/footer.jsp"/>
<script>
    $(document).ready(function () {
        if (${not empty user}) {
            window.history.back();
        }
        registerChek();
        genderClicked("man");
        $("#checkAll").click(function () {
            $(".check").prop('checked', $(this).prop('checked'));
        });
        $('.checkv').click(function () {
            if ($('.checkv:checked').length == 2) {
                $('.checka').prop('checked', true);
            } else {
                $('.checka').prop('checked', false);
            }
        })
    });

    function valueCheck() {
        var checkValue0 = $('#duplicatedId').is(':checked') == true ? true : false;
        if (!checkValue0) {
            alert('id 중복 확인을 해주세요');
        }
        var checkValue1 = inspection('inputId', 'id') ? true : false;
        var checkValue2 = inspection('inputPassword', 'password') ? true : false;
        var checkValue3 = inspection('inputPasswordCheck', 'password') ? true : false;
        var checkValue4 = inspection('inputNickname', 'nickName') ? true : false;
        var checkValue41 = $('#inputMonth option:selected').val() != null && $('#inputDay option:selected').val() != null && $('#inputYear').val() != null;
        if (!checkValue41) {
            alert('생년 월일을 선택하여 주세요.');
            $('#inputDay').focus();
        }
        var checkValue5 = inspection('inputEmail', 'email') ? true : false;
        var checkValue51 = inspection('inputNumber', 'authStr') ? true : false;
        if (checkValue51) {
            if ($('#emailCheck').hasClass('tag-hide')) {
                $('#emailCheck').removeClass('tag-hide')
            }
        }else{
            if ($('#emailCheck').hasClass('tag-hide')) {
                $('#emailCheck').removeClass('tag-hide')
            }
        }
        //var checkValue6 = inspection('inputPhone', 'phone') ? true : false;
        var checkValue6 = true;
        var checkValue7 = ($('#inputPassword').val() === $('#inputPasswordCheck').val());
        if (checkValue7 == false) {
            alert('비밀번호와 비밀번호 확인을 올바르게 입력해주세요.');
            $('#inputPassword').focus();
        }
        var fileValue = $("#inputFile").val().split("\\");
        var fileName = fileValue[fileValue.length - 1];
        console.log(fileName);
        var checkValue8 = false;
        if (fileName != null && fileName.length > 3) {
            checkValue8 = inspection('inputProfile', 'profile');
        } else {
           /* checkValue8 = false;
            alert("프로필 이미지를 확인해주세요");
            $('#inputProfile').focus();*/
            checkValue8 = true;
        }
        var checkValue9 = $('#checkAll').is(":checked");
        if (!checkValue9) {
            console.log('register.jsp', ' 276 ', 'Log is : ', checkValue9);
            alert('약관에 동의하여 주세요.');
            $('#checkAll').focus();
        }
        if (checkValue0 && checkValue1 && checkValue2 && checkValue3 && checkValue4 && checkValue41 && checkValue5 && checkValue51 && checkValue6 && checkValue7 && checkValue8 && checkValue9) {
            return true;
        } else {
            return false;
        }
    }

    // 0 = man
    function genderClicked(gender) {
        if (gender === "man") {
            // $('#inputMan').val("man");
            $('#woman_a').addClass('op-0-5');
            $('#man_a').removeClass('op-0-5');

        } else {
            //  $('#inputMan').val("woman");
            $('#man_a').addClass('op-0-5');
            $('#woman_a').removeClass('op-0-5');
        }
        $('#inputMan').val(gender);
    }

    function duplicateId() {
        var valueCheck = inspection('inputId', 'id') ? true : false;
        if (valueCheck) {
            duplicatedId($('#inputId').val());
        }
    }

    function duplicateMail() {
        var valueCheck = inspection('inputEmail', 'email') ? true : false;
        if (valueCheck) {
            duplicatedMail('', $('#inputEmail').val(), '');
        }
    }

    function selectProfile() {
        $('#inputFile').change(function () {
            var fileValue = $('#inputFile').val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            $('#inputProfile').val(fileName);
        });
        $('#inputFile').click();
    }

    function registerChek() {
        var state = ${state};
        switch (state) {
            case 1:
                console.log(1);
                alert("Register Success");
                getLocation("login.do");
                break;
            case 0:
                console.log(2);
                alert("Register Failed");
                break;
            case -2:
                console.log(-2);
                alert("Auth Number is mismatch");
            default:
                break;
        }
    }
</script>
</body>
</html>
