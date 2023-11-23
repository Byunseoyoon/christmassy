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
<body>
    <jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-1">로그인</h1>
        </div>
    </div>

    <div class="center-content">
        <form method="post" action="loginProcess.jsp" class="center-form">
            <p> 아이디 : <input type="text" name="id"></p>
            <p> 비밀번호 : <input type="text" name="pw"></p>
            <p><input type="submit" value="로그인"></p>
        </form>

        <p><a class="register" href="register.jsp">회원가입 하러 가기</a></p>
    </div>
</body>
</html>
