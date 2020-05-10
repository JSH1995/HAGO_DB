<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-03-09
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<footer class="page-footer text-center font-small mt-4 wow fadeIn">
    <div class="pt-4">
        <a class="btn btn-outline-white" href="${admin.comInsta}" role="button">
            <i class="fas fa-instagram"><img src="../../../resources/images/logo_insta.svg"/></i>
        </a>
        <a class="btn btn-outline-white" href="${admin.comFacebook}" role="button">
            <i class="fas fa-facebook "><img src="../../../resources/images/logo_facebook.svg"/></i>
        </a>
        <a class="btn btn-outline-white" href="${admin.location}" role="button">
            <i class="fas fa-map"><img src="../../../resources/images/logo_map.svg"/></i>
        </a>
    </div>

    <div class="pt-4 text-center">
        <ul>
            <a href="/service.do"
               class="text-decoration-none waves-effect waves-light text-black-color button-text  pr-2">이용약관</a>

            <a href="/private.do"
               class="text-decoration-none waves-effect waves-light text-black-color button-text center-line ml-2 pr-4 mr-2 pl-4">개인정보 처리 방침</a>

            <a href="/intro.do" class="text-decoration-none waves-effect waves-light text-black-color button-text pl-2">회사
                소개</a>
        </ul>
    </div>

    <div class="pb-3 pt-4 mt-4 bg-gray-color">
        <a href="/main.do">
            <img style="width: 208px;height: 50px;" src="../../../resources/images/logo.svg"/>
        </a>
    </div>

    <div class="bg-gray-color">
        <table class="mx-auto text-center">
            <tbody class="text-left">
            <tr>
                <td class="text-Dark-color font-weight-bold">회사</td>
                <td class="font-weight">하고(HAGO)</td>
                <td class="text-Dark-color font-weight-bold">대표자</td>
                <td class="font-weight">이정희</td>
            </tr>
            <tr>
                <td class="text-Dark-color font-weight-bold">사업자번호</td>
                <td class="font-weight">860-12-01137</td>
                <td class="text-Dark-color font-weight-bold">전화번호</td>
                <td class="font-weight">010-8721-5088</td>
            </tr>
            <tr>
                <td class="text-Dark-color font-weight-bold">주소</td>
                <td class="font-weight">강원도 강릉시 범일로 579번길 24 진실관 412호</td>
            </tr>
            <tr>
                <td class="text-Dark-color font-weight-bold">메일</td>
                <td class="font-weight">dlwjdgmlrnt@naver.com</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="footer-copyright py-3 bg-gray-color button-text">
        <span class="font-weight-bold">Copyright ⓒ 2020 HAGO Inc., All Rights Reserved</span>
    </div>

</footer>