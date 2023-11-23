<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <title>Login</title>
    <style>
        .center-content {
            text-align: center; /* 내용 가운데 정렬 */
            margin-top: 20px; /* 상단 여백 조절 */
        }
        .center-form {
            max-width: 300px; /* 폼의 최대 너비 조절 */
            margin: 0 auto; /* 가운데 정렬 */
            text-align: left; /* 입력 필드 왼쪽 정렬 */
        }
    </style>
</head>
<body>
    <jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-1">회원가입</h1>
        </div>
    </div>

    <div class="center-content">
        <form method="post" action="registerProcess.jsp" class="center-form">
            <p> 번호 : <input type="text" name="midx"></p>
            <p> 아이디 : <input type="text" name="id"></p>
            <p> 비밀번호 : <input type="text" name="pw"></p>
            <p> 이름 : <input type="text" name="name"></p>
            <p> 휴대폰 : <input type="text" name="phone"></p>
            <p> 주소 : <input type="text" name="address"></p>
            <p> 가입 날짜 : <input type="text" name="date"></p>
            <p><input type="submit" value="회원가입"></p>
        </form>
    </div>
</body>
</html>
