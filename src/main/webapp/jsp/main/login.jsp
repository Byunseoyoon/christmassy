<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <title>Login</title>
    <style>
        .center-content {
            text-align: center; /* 텍스트 가운데 정렬 */
            margin-top: 20px; /* 상단 여백 조절 */
        }
        .center-form {
            max-width: 300px; /* 폼의 최대 너비 조절 */
            margin: 0 auto; /* 가운데 정렬 */
        }
    </style>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		var username = form.id.value;
		if (!/^[a-z0-9]+$/.test(username)) {
            alert("아이디는 영문 소문자와 숫자만 입력 가능합니다!");
			form.id.focus();
			return false;
        
		form.submit();
	}	
</script>
<body>
    <jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-1">로그인</h1>
        </div>
    </div>

    <div class="center-content">
        <form method="post" action="loginProcess.jsp" class="center-form" name="loginForm">
            <p> 아이디 : <input type="text" name="id"></p>
            <p> 비밀번호 : <input type="text" name="pw"></p>
            <p><input type="submit" value="로그인"></p>
        </form>

        <a href="register.jsp">회원가입</a> |
        <a href="findID.jsp" id="findIdLink">아이디 찾기</a> |
        <a href="findPasswd.jsp" id="findPasswdLink">비밀번호 찾기</a>
    </div>
</body>
</html>

<script>
    document.getElementById('findIdLink').addEventListener('click', function(event) {
        // 링크의 기본 동작을 막음
        event.preventDefault();

        // 창 속성 정의 (너비, 높이 등)
        var windowFeatures = 'width=400,height=300';

        // 새 창 열기
        window.open('findID.jsp', '_blank', windowFeatures);
    });
    
    document.getElementById('findPasswdLink').addEventListener('click', function(event) {
        // 링크의 기본 동작을 막음
        event.preventDefault();

        // 창 속성 정의 (너비, 높이 등)
        var windowFeatures = 'width=400,height=300';

        // 새 창 열기
        window.open('findPasswd.jsp', '_blank', windowFeatures);
    });
</script>
