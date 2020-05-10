<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-04-20
  Time: 오후 7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        <h1 class="text-blueDark-color">이용 약관</h1>
    </div>
    <div class="text-left">
        <br/><br/>제 1 장 총 칙<br/><br/>제1조 [목 적]<br/><br/>본 약관 하고(이하 “회사”라 합니다)가 운영하는
        온라인 교육 사이트 HAGO(www.codinghago.com 이하 “서비스”라 합니다)의 이용과 관련하여 회사와 이용자 사이에 권리•의무 및 책임사항등을 규정하는 것을 목적으로
        합니다.<br/><br/>제2조 [정 의]<br/><br/>1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/><br/>① “회사”라 함은 “학습자료”와 관련된 경제활동을 영위하는 자로서
        “이용자”에게 “학습자료” 및 제반 서비스를 제공하는 자를 말합니다.<br/><br/>② “이용자”라 함은 이 약관에 따라 “회사”가 제공하는 “학습자료” 및 제반 서비스를 이용하는 “학습자” 및
        “교육자”를 말합니다.<br/><br/>③ “학습자”이라 함은 HAGO 교육 서비스를 학습하는 자를 말하며 회원 가입 시 회사가 제공하는 정보와 서비스를 지속적으로 이용할 수
        있습니다.<br/><br/>④ “교육자”라 함은 “학습자”가 아니면서 HAGO 교육 서비스를 활용하여 학습 지도를 하는 자를 말하며 계정을 생성하여 회사가 제공하는 학습자료 및 교육자용 제반서비스를
        이용하는 자를 말합니다.<br/><br/>⑤ “학습자료”라 함은 회사가 제작하여 웹사이트에서 제공 및 판매하는 유료 학습 콘텐츠 또는 유료 강의 자료 등 서비스 및 기타 관련정보를 의미함으로써,
        정보통신망이용촉진 및 정보보호 등에 관한 법률 제 2조제 1항 제 1호의 규정에 의한 정보통신망에서 사용되는 부호 ㆍ 문자 ㆍ 도형 ㆍ 색체 ㆍ 음성 ㆍ 음향 ㆍ이미지 ㆍ 영상 등(이들의 복합체를
        포함한다)의 정보나 자료를 말합니다.<br/><br/>⑥ “아이디(ID)”라 함은 “학습자” 또는 “교육자”의 식별과 “학습자료” 및 제반 서비스의 이용을 위하여 “학습자” 또는 “교육자”가 정하고,
        “회사”가 승인하는 문자 또는 숫자의 조합을 말합니다.<br/><br/>⑦ “비밀번호(PASSWORD)”라 함은 “학습자” 또는 “교육자” 임을 확인하고, 비밀보호를 위해 “학습자” 또는 “교육자”에게
        부여된 “아이디”와 일치하는 “학습자” 또는 “교육자” 자신이 정한 문자 또는숫자의 조합을 말합니다.<br/><br/>⑧ "상품"이라 함은 회사에서 지정하는 상거래를 목적으로 유료로 판매하는 학습자료와
        교육 서비스 , 교육정보서비스, 교육자용 학습관리서비스를 말합니다.<br/><br/>⑨ “전자우편(Email)”이라 함은 인터넷을 통한 우편 혹은 전기적 매체를 이용한 우편을
        말합니다.<br/><br/>⑩ “운영자(관리자)”라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 또는 회사를 말합니다.<br/><br/>⑪ “학습자” 또는 “교육자”의
        게시물”이라 함은 회사의 서비스가 제공되는 사이트에 “학습자” 또는 “교육자”가 올린 글, 이미지, 각종 파일 및 링크, 각종 덧글 등의 정보를 의미합니다.<br/><br/>⑫ “맴버십”이라 함은 회사
        사이트 내에서 제공하는 유료 서비스를 이용할 수 있는 상품입니다.<br/><br/>⑬ “해지”라 함은 학습생이 유료 서비스 구매 이후 이용 계약을 종료시키는 의사를 표시하는 것을
        말합니다.<br/><br/>⑭ “사이트”라 함은 회사가 재화 ㆍ 용역 ㆍ 정보를 이용자에게 제공하기 위하여 기기 등 정보통신 설비를 이용하여 재화 ㆍ 용역을 거래할 수 있도록 설정한 가상의 영업장 또는
        회사가 운영하는 웹 사이트를말하며, 통합된 하나의 아이디 및 비밀번호를 이용하여 서비스를 제공받을 수 있는 아래의 사이트를 의미합니다.<br/><br/>2. 전항 각호에 해당하는 정의 이외의, 기타
        용어의 정의에 대하여는 거래 관행 및 관계 법령에 따릅니다.<br/><br/>제3조 [회사정보 등의 제공]<br/><br/>1. “회사”는 “이용자”가 쉽게 알 수 있도록 다음 각 호의 사항을 사이트
        초기 화면에 게시합니다.<br/><br/>① 대표자의 성명 및 상호<br/><br/>② 영업소 소재지 주소(이용자의 불만을 처리할 수 있는 곳의 주소를 포함한다)및 전자우편주소<br/><br/>③
        전화번호, 이메일<br/><br/>④ 사업자등록번호<br/><br/>⑤ 사이트의 이용약관<br/><br/>⑥ 개인정보취급방침<br/><br/>제4조 [약관의 게시 등]<br/><br/>1. “회사”는
        “이용자”에게 이 약관을 제시하여 동의를 받으며, 사이트 회원가입 화면에 이 약관을 게시합니다. 이 경우 제3조를 준용합니다.<br/><br/>2. “회사”는 “이용자”가 동의하기 전에 약관에 정하여져
        있는 내용 중 학습자 자격의 제한 및 상실, 과오금의 환불, 이용제한, 해제 • 해지, 이용자에 대한 피해보상 등과 같은 중요한 내용을 이용자가 쉽게알 수 있도록 별도의 연결화면 등을 제공하여
        설명합니다.<br/><br/>3.“회사”는 제1항, 제2항을 위반한 경우 이 약관의 전부 또는 일부를 계약의 내용으로 주장하지 못 합니다.<br/><br/>제5조 [약관의 변경 등]<br/><br/>1.
        “회사”는 「콘텐츠산업진흥법」,「전자상거래 등에서의 소비자보호에 관한 법률」,「학원의 설립ㆍ운영 및 과외교습에 관한 법률」,「약관의 규제에 관한 법률」, 문화체육관광부장관이 정하는
        「콘텐츠이용자보호지침」, 기타 관계법령 또는 상관습에 위배하지 않는 범위에서 이 약관을 변경할 수 있습니다.<br/><br/>② “회사”가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여
        현행약관과 함께 사이트 초기화면에 그 적용일자 7일(“이용자”에게 불리한 변경 또는 중대한 사항의 변경은 30일) 이전부터 적용일자 이후상당한 기간 동안 공지하고, 기존 “학습자”에게는 변경될 약관,
        적용일자 및 변경사유(중요내용에 대한 변경인 경우 이에 대한 설명을 포함)를 본 약관 제6조의 방법을 통하여 통지합니다.<br/><br/>③ “회사”가 약관을 변경할 경우에는 변경약관을 공지한 후
        7일(“이용자”에게 불리한 변경 또는 중대한 사항의 변경은 30일) 동안 변경약관의 적용에 대한 “이용자”의 동의 여부를 확인합니다.<br/><br/>④ “회사”는 제3항의 기간 동안【“이용자”가
        거절의 의사표시를 하지 않으면 동의한 것으로 간주 하겠다】는 내용을 별도로 고지하였음에도 불구하고 “이용자”가 이 기간 내에 거절의사를 표시하지 않았을 경우변경약관에 동의한 것으로 간주할 수 있습니다.<br/><br/>⑤
        “이용자”가 변경약관의 적용을 거절한 경우 “회사”는 변경 전 약관에 따른 서비스 제공이 기술적, 영업적으로 가능한 때에 변경 전 약관에 따라 서비스를 제공합니다. 다만, 변경 전 약관에 따라
        서비스를제공하는 것이 기술적, 영업적으로 곤란한 경우 “회사”는 “이용자”의 손해를 배상하고, 학습자료 이용계약을 해지할 수 있습니다.<br/><br/>제 6조 [“학습자”에 대한
        통지]<br/><br/>1. 회사는 학습자에게 알려야 할 사항이 발생하는 경우, 학습자 가입 시 학습자가 공개한 전자우편주소, 팝업 창, 유 • 무선 등의 방법으로 통지할 수
        있습니다.<br/><br/>2. 회사는 학습자 전체에 대한 통지의 경우 7일 이상 회사 웹 사이트 게시판에 게시함으로써 전항의 통지에 갈음할 수 있습니다. 다만, 학습자 본인의 거래와 관련하여 중대한
        영향을 미치는 사항에 대하여는 전항과동일한 방법으로 별도 통지할 수 있습니다.<br/><br/>제7조 [약관의 해석]<br/><br/>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는
        「콘텐츠산업진흥법」, 「전자상거래 등에서의 소비자보호에 관한 법률」, 「학원의 설립ㆍ운영 및 과외교습에 관한 법률」,「약관의 규제에 관한 법률」, 문화체육관광부장관이 정하는 「콘텐츠 이용자보호지침」,
        기타 관계법령 및 상관습에 따릅니다.<br/><br/>제2장 학습자 또는 교육자 가입과 탈퇴 및 개인정보보호 등<br/><br/>제8조 [학습자 또는 교육자 가입]<br/><br/>1. 학습자 또는
        교육자로 가입하여 회사 서비스의 이용을 희망하는 자는 약관의 내용을 숙지한 후 동의함을 표시하고, 회사가 제시하는 소정의 학습자 또는 교육자 가입 양식에 관련사항을 기재하여 가입을
        신청하여야합니다.<br/><br/>2. 회사는 전항에 따라 학습자 또는 교육자가 가입 신청양식에 기재하는 모든 정보를 실제 데이터인 것으로 간주합니다.<br/><br/>3. 실명이나 실제 정보를
        입력하지 않은 학습자 또는 교육자는 법적인 보호를 받을 수 없으며 본 약관의 관련 규정에 따라 서비스 사용에 제한을 받을 수 있습니다.<br/><br/>4. 회사는 본 조 제 1항에 따른 이용자의
        신청에 대하여 학습자 또는 교육자 가입을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않을 수 있으며, 승낙 이후라도취소할 수
        있습니다.<br/><br/>① 이용자의 귀책사유로 인하여 승인이 불가능한 경우<br/><br/>② 실명을 사용하지 않은 경우<br/><br/>③ 타인의 명의 또는 개인정보를 도용하는
        경우<br/><br/>④ 허위의 정보를 제공하는 경우<br/><br/>⑤ 중복된 아이디, 휴대폰번호를 사용하는 경우<br/><br/>⑥ 회사가 제시하는 학습자 가입 신청양식에 관련 내용을 기재하지 않은
        경우<br/><br/>⑦ 이전에 회사 이용약관 또는 관계법령을 위반하여 학습자 자격이 상실되었던 경우<br/><br/>⑧ 본 약관 제 18조 [학습생의 의무]를 위반하는 경우<br/><br/>⑨ 기타
        본 약관 및 관계법령을 위반하는 경우<br/><br/>⑩ 이용자 가입 신청양식에 기재되어 회사에 제공되는 개인정보 (ID, 비밀번호, 주소 등) 가 선량한 풍속 기타 사회질서에 위배되거나 타인을
        모욕하는 경우<br/><br/>5. 회사는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.<br/><br/>6. 회사가 본 조 제 4항과 제
        5항에 따라 학습자 가입신청의 승낙을 하지 아니하거나 유보한 경우에는 팝업 창을 통하여 즉시 이용자 (신청자)에게 알립니다. 단, 회사의 귀책사유 없이 신청자에게 알릴 수 없는경우에는 예외로
        합니다.<br/><br/><br/>제9조 [이용자 정보의 변경]<br/><br/>1. 이용자는 회사 사이트 “마이페이지”에서 언제든지 자신의 개인정보를 열람하고 수정할 수 있습니다.<br/><br/>2.
        이용자가 전항의 변경사항을 수정하지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br/><br/>제10조 [“이용자”의 “아이디” 및 “비밀번호”의 관리에 대한 의무]<br/><br/>1.
        이용자는 아이디와 비밀번호에 대한 관리책임이 있으며, 이를 타인에게 공개하여 제 3자가 이용하도록 하여서는 아니 됩니다.<br/><br/>2. 이용자는 자신의 아이디 및 비밀번호가 유출되어 제 3자에
        의해 사용되고 있음을 인지한 경우, 즉시 회사에 알려야 합니다.<br/><br/>3. 회사는 전항의 경우 이용자의 개인정보보호 및 기타 서비스 부정이용행위 방지 등을 위하여 이용자에게 비밀번호의 변경
        등 필요한 조치를 요구할 수 있으며, 이용자는 회사의 요구가 있는 즉시 회사의 요청에성실히 응해야 합니다.<br/><br/>4. 회사는 학습생이 본 조 제 2항 및 제 3항에 따른 의무를 성실히
        이행하지 않아 발생한 불이익에 대하여 책임지지 않습니다.<br/><br/>제11조 [이용자 탈퇴 및 자격 상실 등]<br/><br/>1. 이용자가 탈퇴하고자 할 경우에는 본인이 회사 고객센터에 전화를
        하거나 홈페이지를 통하여 탈퇴신청을 하여야 합니다. 이 경우 회사는 지체 없이 탈퇴처리합니다.<br/><br/>2. 회사는 학습생이 본 약관 또는 관계법령을 위반하는 경우, 서비스 이용을 제한하거나
        이용자 자격을 상실 시킬 수 있습니다.<br/><br/>3. 이용자가 탈퇴를 하는 경우 이용중인 맴버십 상품은 모두 소멸됩니다.<br/><br/>제 3장 서비스의 이용 계약<br/><br/>제12조
        [서비스의 이용]<br/><br/>1. 회사는 이용자에게 원활한 서비스를 제공합니다.<br/><br/>2. 회사가 제공하는 서비스는 인터넷 통신망을 통해 전송되며, 서비스 이용을 위한 인터넷 통신망의
        설치 의무는 이용자에게 있습니다.<br/><br/>제13조 [학습기기사양]<br/><br/>1. 회사가 제공하는 학습자료를 이용하는데 필요한 PC 브라우저의 사양은 아래와 같습니다.<br/><br/>-
        크롬 최적화<br/><br/>- IE 11 ( IE 11 이하 버전에서는 상위 버전 또는 크롬 이용을 권장합니다.)<br/><br/>2. 회사가 제공하는 학습자료를 이용하는데 필요한 학습전용기기의
        사양은 변경될 수 있습니다.<br/><br/>제14조 [거래조건에 대한 정보의 표시]<br/><br/>1. 회사는 다음 각 호에 해당하는 사항을 사이트, 해당 학습자료 또는 그 포장에 표시
        합니다.<br/><br/>① 학습자료의 명칭, 종류, 내용, 가격, 이용기간<br/><br/>② 환불기준 등 서비스 이용계약의 해지방법 및 효과<br/><br/>③ 이용약관 및 개인정보취급방침<br/><br/>2.
        회사는 전항 각 호의 사항을 회사 사이트, 본 이용약관, 개인정보취급방침 등에서 이미 고지하고 있는 경우, 별도로 표시하지 않을 수 있습니다.<br/><br/>제15조 [서비스 이용계약의 성립 및
        결제방법 등]<br/><br/>1. 이용자는 회사가 제공하는 다음 각 호 또는 이와 유사한 절차에 의하여 학습자료 서비스 이용을 신청을 합니다. 회사는 계약 체결 전, 다음 각 호의 사항에 관하여
        이용자가 정확하게 이해하고 실수 또는 착오없이 거래할 수 있도록 정보를 제공합니다.<br/><br/>① 학습자료 목록의 열람 및 선택<br/><br/>② 학습자료 상세정보 확인<br/><br/>③ 결제
        신청<br/><br/>④ 주문상품 및 결제금액 확인 (환불규정 안내)<br/><br/>⑤ 성명, 주소, 연락처 등 정보 입력<br/><br/>⑥ 결제수단 선택<br/><br/>⑦ 결제금액
        재확인<br/><br/>⑧ 결제 완료<br/><br/>2. 이용자는 신용카드, 인터넷계좌이체, 무통장 입금 등 회사에서 정하고 있는 방법으로 유료서비스의 결제가 가능합니다. 다만, 각 결제수단마다
        결제수단의 특성에 따른 일정한 제한이 있을 수 있습니다.<br/><br/>3. 미성년 학습생의 결제는 원칙적으로 보호자 [법정대리인]의 명의 또는 보호자 [법정대리인] 동의 하에 이루어져야 하고,
        보호자 [법정대리인]는 본인 동의 없이 체결된 자녀 (미성년자)의 계약을 취소할 수있습니다.<br/><br/>4. 미성년자가 유료서비스의 대금을 자신의 명의로 결제하는 경우, 당해 미성년자는 법정대리인
        등 보호자의 승낙을 증명하는 문서, 전자우편 등을 제공하거나 유ㆍ무선을 통하여 확인을 할 수 있도록 보호자의 연락처를제공하여야 합니다. 만약 이러한 절차를 이행하지 않을 경우 결제금액은 보호자
        [법정대리인]에 의하여 처분이 허락된 재산으로 볼 수 있습니다.<br/><br/>5. 회사는 보호자의 동의 여부를 유ㆍ무선 등의 방법을 통하여 확인할 수 있습니다.<br/><br/>6. 회사는 이용자의
        유료서비스 이용신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다.<br/><br/>① 유료 서비스의 이용요금을 납입하지 않는
        경우<br/><br/>② 유료 서비스 신청금액 총액과 결제금액 총액이 일치하지 않은 경우<br/><br/>③ 기타 합리적인 이유로 회사가 필요하다고 인정되는 경우<br/><br/>7. 회사는 이용자가
        본 조 위 조항의 절차에 따라 유료서비스 이용을 신청할 경우, 승낙의 의사표시로써 본 약관 제 6조의 방법을 통하여 이용자에게 통지하고, 승낙의 통지가 이용자에게 도달한 시점에 계약이성립한 것으로
        봅니다.<br/><br/>8. 회사의 승낙의 의사표시에는 이용자의 이용신청에 대한 확인 및 서비스제공 가능 여부, 이용신청의 정정, 취소 등에 관한 정보 등을 포함합니다.<br/><br/>제16조
        [회사의 의무]<br/><br/>1. 회사는 법령과 본 약관이 정하는 권리의 행사와 의무의 이행을 신의에 좇아 성실하게 하여야 합니다.<br/><br/>2. 회사는 이용자가 서비스를 이용하는 과정에서
        이용자 개인정보가 외부로 유출되지 않도록 방화벽을 설치하는 등 별도의 보안장치를 사용하고 있습니다.<br/><br/>3. 회사는 이용자가 유료서비스 이용 및 그 대금내역을 수시로 확인할 수 있도록
        조치합니다.<br/><br/>4. 회사는 서비스 이용과 관련하여 이용자로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 지체 없이 처리합니다. 이용자가 제기한 의견이나 불만사항에 대해서는
        게시판을 활용하거나 전자우편 등을통하여 그 처리과정 및 결과를 전달합니다.<br/><br/>5. 회사는 본 약관에서 정한 의무 위반으로 인하여 이용자가 입은 손해를 배상합니다.<br/><br/>제17조
        [이용자의 의무]<br/><br/>1. 회사의 명시적 동의가 없는 한 이용자의 이용권한은 이용자 개인에 한정되며, 타인에게 양도, 증여하거나 이를 담보로 제공할 수 없습니다.<br/><br/>2.
        회사는 이용자가 다음 각 호의 1에 해당하는 의무를 위반 하였을 경우 기간을 정하여 전부 또는 일부의 서비스 이용을 중지하거나 상당기간의 최고 후 이용계약을 해지할 수 있습니다.<br/><br/>①
        이용자가 이용신청 또는 변경 시, 허위사실을 기재하거나, 자신 또는 다른 이용자의 ID 및 개인정보를 이용ㆍ공유하는 경우<br/><br/>② 이용자가 회사 또는 제 3자의 권리나 저작권을 침해하는 경우<br/><br/>③
        이용자가 회사에서 제공하는 서비스를 이용하여 상품 또는 용역을 판매하는 영업활동 등의 상행위를 하는 경우<br/><br/>④ 이용자가 다른 이용자의 서비스 이용을 방해하거나, 회사의 운영진, 직원 또는
        관계자를 사칭하는 경우<br/><br/>⑤ 이용자가 회사 사이트 내에서, 사회의 안녕질서 혹은 미풍양속을 저해하는 행위를 하거나, 그와 관련된 부호ㆍ문자ㆍ음성ㆍ음향 및 영상 등의 정보를 게시하여
        타인에게 유포시키는 경우<br/><br/>⑥ 이용자가 회사로부터 유ㆍ무상으로 제공받은 적립금 등의 재화를 제 3자와 유ㆍ무상 등의 방법으로 거래하는 경우<br/><br/>⑦ 회사의 서비스 운영을 고의로
        방해 하거나 그리할 목적으로 다량의 정보를 전송하거나 광고 성 정보를 전송하는 경우<br/><br/>⑧ 관계법령 및 기타 본 약관에서 규정한 사항을 위반한 경우<br/><br/>⑨ 회사 및 타인의
        명예를 훼손하거나 모욕하는 경우<br/><br/>⑩ 이용자가 그 채무를 이행하지 아니하여 회사가 상당기간 그 이행을 요청하였음에도 이를 이행하지 않는 경우<br/><br/>제18조 [부정이용 금지 및
        차단]<br/><br/>1. 회사는 다음 각 호에 해당하는 경우를 부정 이용행위로 봅니다.<br/><br/>① 동일한 ID로 2대 이상의 학습기기에서 동시접속이 발생하는 경우<br/><br/>② 동일한
        ID로 다수의 학습기기 서비스를 이용하는 경우<br/><br/>③ 자신의 ID 및 코스 등의 서비스를 타인이 이용하도록 하는 경우<br/><br/>④ 자신의 ID 및 코스 등의 서비스를 타인에게 판매,
        대여, 양도하는 행위 및 이를 광고하는 행위<br/><br/>2. 회사는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각 호에 따른 조치를 취할 수 있습니다.<br/><br/>① [1차 발견
        시] - 전자우편 또는 쪽지, 팝업 창을 통하여 경고합니다.<br/><br/>② [2차 발견 시] - 전화와 동일한 방법으로 경고하고 동시에 서비스 이용을 정지 시킵니다.<br/><br/>③ [3차
        발견 시] - 전자우편, 쪽지, 팝업 창 또는 유ㆍ무선을 통하여 3차 위반내용의 통지 및 서비스 이용을 정지 시키고 30일간의 소명기간 부여하며, 정당한 사유가 없는 경우 강제 탈퇴처리합니다.<br/><br/>또한
        남은 유료 서비스 기간이 소멸되면 다수 이용에 따른 회사 피해금액에 대한 반환을 요구할 수 있습니다.<br/><br/>3. 이용자는 전항 제 2호 및 3호의 조치를 이유로, 서비스 이용기간의 연장을
        요구할 수 없습니다.<br/><br/>4. 이용자는 회사로부터의 본 조 제 2항의 조치에 이의가 있는 경우, 회사 고객센터에 해당 사실에 대하여 소명할 수 있으며, 이용자 자신의 고의나 과실이 없었음을
        입증한 경우 회사는 서비스 제공 정지 기간만큼이용기간을 연장합니다. 그에 따라 이용에 관한 별도의 조치를 받을 수 있습니다.<br/><br/>5. 부정이용 식별방법 및 차단<br/><br/>① 회사는
        이용자의 서비스 이용 중에 수집ㆍ확인된 IP정보 등의 자료를 토대로, 서버를 통하여 부정이용 여부를 분류ㆍ확인 합니다.<br/><br/>② 회사는 이용자가 서비스 이용 중에 복제프로그램을 실행시키거나
        동일한 ID로 동시 접속을 하는 경우, 서비스 이용 접속을 강제로 종료 시킵니다.<br/><br/>제19조 [서비스의 제공 및 변경]<br/><br/>1. 회사는 연중무휴, 1일 24시간 서비스 제공을
        원칙으로 합니다.<br/><br/>2. 회사는 운영상 또는 기술상 등의 상당한 이유가 있는 경우 제공하고 있는 서비스를 변경할 수 있습니다.<br/><br/>3. 전항에 따라 서비스가 변경되는 경우에는
        변경되는 사유 및 내용을 본 약관 제6조에 따른 방법으로 이용자에게 통지 합니다.<br/><br/>4. 회사는 본조의 2항에 의해 해지하게 되는 이용자에게는 환불 규정에 따라
        처리합니다.<br/><br/>5. 회사 사정에 의한 서비스 이용 중단 및 기타 부득이한 사유로 서비스를 지속할 수 없을 경우에는 이를 이용자에게 공지한 후 최대한 신속하게 환불하여
        드립니다.<br/><br/>제20조 [서비스의 중단]<br/><br/>1. “회사”는 기기 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 “학습자료”의
        이용을 일시적으로 중단할 수 있습니다. 이 경우“회사”는 제6조에서 정한 방법으로이용자에게 통지합니다. 다만, “회사”가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수
        있습니다.<br/><br/>2. “회사”는 “학습자료”의 이용에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검을 실시하기 24시간 이전에 제 6조에서 정한 방법으로 이용자에게 통지합니다. 이 경우
        정기점검시간은 제 6조에서 정한방법에 따라 통지한 시간으로 합니다.<br/><br/>3. 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 “학습자료”를 제공할 수 없게 되는 경우에
        “회사”는 제 6조에서 정한 방법으로 “이용자”에게 통지하고, “회사”가 정한 바에 따라 “이용자”에게 보상합니다. 다만, “회사”가 보상기준 등을 고지하지 아니하거나, 고지한 보상기준이 적절하지 않은
        경우에는 「콘텐츠이용자보호지침」에 따라 “이용자”에게 보상합니다.<br/><br/>제21조 [정보의 제공 및 광고의 게재]<br/><br/>1. 회사는 이용자가 서비스 이용 중 필요하다고 인정되는
        다양한 정보를 공지사항이나 전자우편 또는 유선상 등의 방법으로 이용자에게 제공할 수 있습니다. 다만, 이용자는 언제든지 전자우편 등을 통하여 수신 거절을할 수 있습니다.<br/><br/>2. 회사는
        서비스 제공과 관련하여 해당 서비스화면, 회사 사이트, 이용자 가입 시 이용자가 직접 작성한 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 이용자는 수신거부를 할
        수있습니다.<br/><br/>제22조 [이용자가 등록한 게시물의 삭제]<br/><br/>1. 회사는 이용자가 등록한 게시물 중 본 약관 및 관계법령 등에 위배되는 게시물이 있는 경우 이를 지체 없이
        삭제 합니다.<br/><br/>2. 회사가 운영하는 게시판 등에 게시된 정보로 인하여 법률상 이익이 침해된 자는 회사에게 당해 정보의 삭제 또는 반박내용의 게재를 요청할 수 있습니다. 이 경우 회사는
        지체 없이 필요한 조치를 취하고 이를즉시 신청인에게 통지 합니다.<br/><br/>제23조 [저작권]<br/><br/>1. 회사가 제공하는 모든 학습자료에 대한 저작권은 회사에
        있습니다.<br/><br/>2. 이요자는 회사가 제공하는 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 녹화ㆍ복제ㆍ편집ㆍ전시ㆍ전송ㆍ배포ㆍ판매ㆍ방송ㆍ공연하는 등의 행위로 회사의 저작권을 침해
        하여서는 안 됩니다.<br/><br/>제24조 [개인정보보호]<br/><br/>1. 회사는 이용자의 개인정보보호를 중요시 하며, 학습생이 회사의 서비스를 이용함과 동시에 온라인상에서 회사에게 제공한
        개인정보의 철저한 보호를 위하여 최선을 다하고 있습니다.<br/><br/>2. 개인정보보호와 관련된 자세한 사항은 회사 사이트에서 전자적 표시형태로 제공되는 개인정보취급방침에서 확인할 수
        있습니다.<br/><br/>제 4장 서비스의 환불 및 변경<br/><br/>제25조 [관계법령상 청약철회 및 환불정책]<br/><br/>1. 회사의 본 약관상 환불규정 등은 “약관의 규제에 관한
        법률”, “콘텐츠산업 진흥법”, “전자상거래 등에서의 소비자보호에 관한 법률”, “학원의 설립ㆍ운영 및 과외교습에 관한 법률” 등을 반영하였습니다.<br/><br/>2. 회사는 이용자에게 대금 등을
        환불할 때에 기 지불한 대금의 결제와 동일한 방법으로 전부 또는 일부를 환불합니다. 다만, 동일한 방법으로 환불이 불가능 할 때에는 이를 사전에 고지합니다.<br/><br/>3. 청약철회 등의 경우
        재화 등의 반환에 필요한 비용은 이용자가 부담합니다.<br/><br/>4. 본 조 1항의 관계법령에 따른 소비자의 청약철회가 불가능한 경우로는,<br/><br/>① 청약철회가 불가능한 학습자료에 대한
        사실을 표시사항에 포함한 경우<br/><br/>② 시용상품을 제공한 경우<br/><br/>③ 한시적 또는 일부 이용 등의 방법을 제공한 경우 등이 있습니다.<br/><br/>5. 회사는 본 조 제 3항
        제 2호에 해당하는 사유인 ‘시용상품’과 ‘한시적 또는 일부 이용 등의 방법’을 제공하고 있으며 유ㆍ무상의 ‘체험상품’등이 이에 해당 합니다.<br/><br/>제26조 [회사의 환불 및 자동결제
        해지규정]<br/><br/>1. 이용자는 [멤버십 구매 > 나의 멤버십 > 멤버십 내역보기]에서 환불요청을 하실 수 있으며, 멤버십 구매 후 7일 이내, 콘텐츠 이용 이력이 없을 경우 전액 환불
        됩니다.<br/><br/>단, 회사의 모든 교육 프로그램은 소프트웨어 콘텐츠로써 맴버십 구매 후 교육 콘텐츠 이용 시점 후에는 재화의 가치가 현저히 감소되기 때문에 환불되지 않습니다.<br/><br/>다음
        기간 자동 결제를 원하지 않으실 경우에는 자동결제 전에 해지 신청을 하시면 됩니다.<br/><br/>단, 무제한 콘텐츠 이용 멤버십 특성상 자동결제 완료 후에는 환불이 불가하며 다음기간 자동결제 해지만
        가능합니다.<br/><br/>2. 관계법령 및 본 약관의 규정을 위반하여 회사로부터 강제탈퇴 처리가 되는 경우에는 본 조의 환불규정이 적용되지 않습니다.<br/><br/>3. 자동 결제 해지는 [멤버십
        구매 > 나의 멤버십 > 멤버십 내역보기]에서 하실 수 있으며, 해지를 신청한 다음 달에 해지처리가 완료됩니다.<br/><br/>제5장 피해보상 및 분쟁해결<br/><br/>제27조
        [면책조항]<br/><br/>1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br/><br/>2. 회사는 이용자의
        귀책사유로 인하여 발생한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br/><br/>3. 회사는 이용자가 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는
        책임을 지지 않습니다.<br/><br/>4. 회사는 이용자 상호간 또는 이용자와 제 3자 간에 학습자료를 매개로 하여 발생한 분쟁 등에 대하여 책임을 지지 않습니다.<br/><br/>5. 회사는
        이용자가 학습기기에 대한 임의적인 설정 변경 또는 회사가 제공하지 않는 소프트웨어를 설치하여 발생하는 유해환경 차단 기능 및 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br/><br/>제28조
        [이용자의 권익보호]<br/><br/>1. 회사는 이용자의 수, 이용시간 등을 감안하여 이용자가 원활하게 학습자료를 이용할 수 있도록 서버다운, 기술적 오류 등에 대비한 설비를 구축하고 필요한 조치를
        취합니다.<br/><br/>2. 회사는 학습자료계약에서 발생하는 이용자의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 체계(시스템 등)를 구비합니다.<br/><br/>3. 회사는
        동일 또는 유사한 이용자피해가 계속하여 발생하고 있는 사실을 인식한 경우 추가적인 이용자피해를 예방하기 위하여 홈페이지의 초기화면 등에서 그 피해발생사실과 피해예방을 위한 이용자의 조치사항에
        대하여공지합니다.<br/><br/>제29조 [분쟁의 해결 등]<br/><br/>1. “회사”는 “이용자가”가 제기하는 의견이나 불만에 대하여 적절하고 신속하게 처리하고, 그 결과를 통지합니다. 다만,
        신속한 처리가 곤란한 경우에 “회사”는 “이용자”에게 그 사유와 처리일정을통보합니다.<br/><br/>2. “회사”는 “이용자”가 제기한 의견 등이 정당하지 않음을 이유로 처리하지 않은 경우 이의
        사유를 통보합니다.<br/><br/>3. “회사”와 “이용자” 사이에 분쟁이 발생한 경우 “회사”또는 “이용자”는「콘텐츠산업진흥법」제 29조에서 정하고 있는 콘텐츠분쟁조정위원회에 분쟁조정을 신청할 수
        있습니다.<br/><br/>제32조 [재판관할] “회사"와 "이용자"간의 "학습자료"이용계약에 관한 소송에 관한 관할법원은『민사소송법』에 따라 정한다.<br/><br/>[부칙] 본 약관은 2020년
        04월 20일부터 시행됩니다.<br/>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
</body>
</html>