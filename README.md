#Hago Project
\#Web \#maven \#Jsp \#Jstl \#Java \#Tomcat \#HTML/CSS \#Bootstrap

##고려사항
###### File Directory 문제
###### DB Deadlock 어디서 Deadlock 걸렸는지 모름 => profile.do 작성중 발생
###### Profile.do에서 content 길이 및 recent의 GO버튼 추가? 그리고 left-right controls 하는지 여부 => 안함

##양도시 고려사항
###### MailService(SendGrid) id password authkey 양도시 발급 받아야됨
###### DB에서 User_No가 1번인것이 Admin(관리자)라고 가정한다. 따라서 Contents의 User_no=1인것이 관리자가 만든 컨텐츠

###라이브러리
#####commons-dbcp2-2.1.jar
#####commons-logging-1.2.jar
#####commons-pool2-2.4.1.jar
#####cos.jar
#####java-json.jar
#####jstl-1.2.jar
#####mysql-connector-java-5.1.47-bin.jar


##주의사항
#### 1. View(URI) or Ajax 추가시 web.xml(line : 87) 의 excludedUrls => param-value에 uri를 추가시켜야한다. (SessionCheckFilter)
#### 2. 모든 테스트는 DebugHandler에서 구축 및 테스트 한다.
#### 3. script func -> location.href 사용시 body 태그 안에 사용해야 한다.
#### 4. jstl 사용시 library import
#### 5. IE 관련 사항 jquery에 this 사용 금지, GET방식 한글 금지(AJAX 포함)
#### 6. DB에서 User_No가 1번인것이 Admin(관리자)라고 가정한다. 따라서 Contents의 User_no=1인것이 관리자가 만든 컨텐츠
#### 7. 인기 컨텐츠는 Likes에 데이터 있어야 나옴


##수정 해야할 사항

##수정 사항
- [x] detail.jsp ul list changed
- [x] Authenticated Number Regex Inspection
- [x] Profile Image File Selected in Input tags
- [x] Register Agrees
- [x] notice.jsp qna.jsp up-arraow insert
- [x] DB => Comments => Comment_No 없어서 좀 곤란...
- [x] profile.jsp image color change(gray and colorful)
- [x] profile.jsp button click href

##BUG
- [?] main에서 detail로 들어가는 부분이 없음. => 바로 컨텐츠 실행? 할부분 아닌가?
- [?] content edit시 예상치 못한 에러시 Contents_Category 부분이 empty 상태가 됨. => 해결해야 하나? 
- [?] safari -> notice&qna title이 한 줄이면 날짜 레이아웃이 망가짐. profile -> 내 학습 레이아웃 망가짐

##BUG 해결 사항 및 한번더 확인 사항
- [x] 회원가입 email 중복 가능함. => 중복 불가 이메일을 다시 확인 해주세요 메세지 나옴 해결, 등록 했을때 token 삭제, (MySQL Event Scheduler)차후 스케쥴링에서 token 레코드 생기는 시간에 따라 delete 할 예정
- [x] ID 찾기를 하면 이메일로 가입시 등록했던 email 이 옴. => ID로 오게끔 DAO 수정 해결
- [x] Password 찾기에서 아이디와 이메일 입력하면 password failed 뜸. => form의 Action 문제였음 해결
- [x] post state가 edit일 경우 검색에 도출 됨. => 쿼리에서 제외시킴
- [x] Redepoly시 Image나 코드 미적용 문제 => artifacts의 배포 폴더의 resources 폴더 덮어 쓰기
- [x] Carousel 4개 이상시 Rendering 문제 => 6개로 하면 문제 없다.(이미지 사이즈 문제)
- [x] search시 값이 가장 많이 보이는 곳에 버튼이 세팅되어 있지 않음. => 추가
- [x] profile.do 새로 하나 만들었을 때 원래 있던 contents가 복사되는 버그 => 수정 및 추가
- [x] profile에서 GO 버튼 누르면 수정으로 가기 => 추가
- [x] notice qna 다수 버튼 컨트롤 버그
- [x] content detail comment 부분에서 엔터 인식 안됨
- [x] content detail comment 댓글 등록 후 input 란에 여전히 값 남아있음.
- [x] login 상태에서 register.do 로 이동 가능.
- [x] profile edit 수정시 빈 파일 에러
- [x] profile edit 이메일 중복 체크가 안되어 있어서 이메일 중복 작성이 가능한 듯? (이메일 인증 할 때, 아이디 매칭까지 검사 하도록)
- [x] qna&notice button page 이동시 값 입력 상태로 넘어감.
- [x] profile edit img 에러
- [x] profileconfirm input auto focus
- [x] edit 상태의 content 주소창으로 share 형식과 같게 입력시 detail 화 됨.
- [x] main.do content가 go 버튼이 없음.
- [x] profile.do 수정 or 새로 만들기를 눌렀을때 나오는 사용자 재확인 부분에서 비밀번호 아무렇게나 입력 후 비밀번호 찾기를 갔다가 다시 profile.do 로 오면 비밀번호 없이 접근 가능.
- [x] Script Regex Security
- [x] Register email duplicated check -> email 중복시 token 자체를 생성 안하도록. submit시에 한번 더 확인
- [x] profileEdit email duplicated check -> 위와 동일.

##DB

### DB 수정 사항.
#### comments table attribute change comments_date : date -> datetime

##### 우식
            jdbcdriver=com.mysql.jdbc.Driver
            jdbcUrl=jdbc:mysql://localhost:3306/hago?characterEncoding=UTF-8
            dbUser=root
            dbPass=jjuny1977
            validationQuery=select 1
            minIdle=3
            maxTotal=60
            poolName=HagoProject
            
##### 원석
            jdbcdriver=com.mysql.jdbc.Driver
            jdbcUrl=jdbc:mysql://localhost:3306/HagoProject???characterEncoding=UTF-8
            dbUser=root
            dbPass=skyblue1996
            validationQuery=select 1
            minIdle=3
            maxTotal=60
            poolName=HagoProject

##### 병준
            jdbcdriver=com.mysql.jdbc.Driver
            jdbcUrl=jdbc:mysql://localhost:3306/hago?characterEncoding=UTF-8
            dbUser=root
            dbPass=jjuny1977
            validationQuery=select 1
            minIdle=3
            maxTotal=60
            poolName=HagoProject
            
#호환 작업
##Auth
- [x] /login.do=Auth.command.LoginHandler
- [x] /register.do=Auth.command.RegisterHandler
- [x] /idsearch.do=Auth.command.IDHandler
- [x] /passwordsearch.do=Auth.command.PasswordHandler
- [x] /profile.do=Auth.command.ProfileHandler
- [x] /profileedit.do=Auth.command.ProfileEditHandler
- [x] /profileconfirm.do=Auth.command.ProfileConfirmHandler

##Main
- [x] /main.do=main.command.MainHandler
- [x] /search.do=main.command.SearchHandler

##Detail
- [x] /detail.do=detail.command.DetailHandler
- [x] /detailCreate.do=detail.command.ContentCreateHandler
- [x] /intro.do=detail.command.IntroHandler
- [x] /notice.do=detail.command.NoticeHandler
- [x] /qna.do=detail.command.QnaHandler

##Admin
/admin.do=admin.command.AdminHandler

##DEBUG
/debug.do=debug.command.DebugHandler

##AuthAjax
/auth.ajax=ajax.command.AuthAjaxHandler

##ContentAjax
/content.ajax=ajax.command.ContentAjaxHandler

##QNAAjax
/qna.ajax=ajax.command.QnaAjaxHandler

##NoticeAjax
/notice.ajax=ajax.command.NoticeAjaxHandler

##CommentAjax
/comment.ajax=ajax.command.CommentAjaxHandler

##LikeAjax
/like.ajax=ajax.command.LikeAjaxHandler

