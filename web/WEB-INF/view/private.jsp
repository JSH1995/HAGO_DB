<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-04-20
  Time: 오후 7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=1040">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>학습 상세 페이지</title>
    <jsp:include page="../../common/style.jsp" flush="false"/>
    <jsp:include page="../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../common/font.jsp" flush="false"/>
    <jsp:include page="../../common/util.jsp" flush="false"/>
    <jsp:include page="../../common/ajaxs.jsp" flush="false"/>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="container">
    <div class="text-center main-title mt-5 mb-5">
        <h1 class="text-blueDark-color">개인정보 처리 방침</h1>
    </div>
    <div class="text-left"><br/>1. 개인정보의 처리 목적 &lt;하고(HAGO)>(‘www.codinghago.com’이하 ‘HAGO’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의
        용도로는
        이용하지 않습니다.<br/>- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송
        등<br/><br/><br/>2. 개인정보의 처리 및 보유 기간<br/><br/>① &lt;하고(HAGO)>(‘www.codinghago.com’이하 ‘HAGO’) 은(는) 정보주체로부터 개인정보를
        수집할
        때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br/><br/>② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br/>☞
        아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.<br/>(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지,
        다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br/>- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년<br/><br/><br/>3. 정보주체와 법정대리인의
        권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.<br/><br/>① 정보주체는 하고(HAGO)(‘www.codinghago.com’이하 ‘HAGO) 에 대해
        언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br/>1. 개인정보 열람요구<br/>2. 오류 등이 있을 경우 정정 요구<br/>3. 삭제요구<br/>4. 처리정지
        요구<br/><br/><br/>4. 처리하는 개인정보의 항목 작성<br/><br/>① &lt;하고(HAGO)>('www.codinghago.com'이하 'HAGO')은(는) 다음의 개인정보 항목을
        처리하고
        있습니다.<br/><br/>&lt;회원가입과 구매결제의 처리><br/>- 필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 성별, 생년월일<br/><br/><br/>5. 개인정보의
        파기&lt;하고(HAGO)>('HAGO')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br/><br/>-파기절차<br/>이용자가
        입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에
        의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br/><br/>-파기기한<br/>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리
        목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를
        파기합니다.<br/><br/><br/>6. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항<br/><br/>하고(HAGO) 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를
        사용하지 않습니다.<br/><br/><br/>7. 개인정보 보호책임자 작성<br/><br/>① 하고(HAGO)(‘www.codinghago.com’이하 ‘HAGO) 은(는) 개인정보 처리에 관한 업무를
        총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br/><br/>▶ 개인정보 보호책임자<br/>성명 :이정희<br/>직책
        :대표<br/>직급 :대표<br/>연락처 :010-8721-5088, dlwjdgmlrnt@naver.com,<br/>※ 개인정보 보호 담당부서로 연결됩니다.<br/><br/>▶ 개인정보 보호 담당부서<br/>부서명
        :대표<br/>담당자 :이정희<br/>연락처 :010-8721-5088, dlwjdgmlrnt@naver.com,<br/>② 정보주체께서는 하고(HAGO)(‘www.codinghago.com’이하
        ‘HAGO) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다.
        하고(HAGO)(‘www.codinghago.com’이하 ‘HAGO) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br/><br/><br/>8. 개인정보 처리방침
        변경<br/><br/>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br/><br/><br/>9.
        개인정보의 안전성 확보 조치 &lt;하고(HAGO)>('HAGO')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고
        있습니다.<br/><br/>1.
        정기적인 자체 감사 실시<br/>개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br/><br/>2. 개인정보 취급 직원의 최소화 및 교육<br/>개인정보를
        취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br/><br/>3. 개인정보의 암호화<br/>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및
        관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br/><br/>[부칙] 본 약관은
        2020년 04월 20일부터 시행됩니다.<br/></div>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
