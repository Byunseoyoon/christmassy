<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <jsp:include page="../frame/header.jsp"></jsp:include>
    <style>
        .center-content {
            text-align: center; /* 텍스트 가운데 정렬 */
            margin-top: 20px; /* 상단 여백 조절 */
        }
        .center-content a {
	        text-decoration: none; /* 밑줄 제거 */
	        color: #115A5B;
	    }
	    #userLinks {
    	    margin-top: 25px; /* 간격 조절 */
	    }
	
	    #userLinks a {
	    	font-weight: bold;
	        margin-right: 10px; /* 링크 간격 조절 */
	        margin-left: 10px;
	    }
	    .center-content p {
	        color: #115A5B;
	    }
	    .login-heading {
            font-size: 50px; 
            font-weight: bold;
            margin-bottom: 50px;
            margin-top : 80px; 
            text-align: center;
            color: #115A5B;
        }
        .center-form label{
	        margin-bottom: 10px;
	        color: #115A5B;
	        font-weight: bold;
	    }
       
		.center-form input[type="text"],
	    .center-form input[type="password"] {
	        width: 450px;
	        padding: 8px;
	        margin-bottom: 20px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        background-color: rgba(17, 90, 91, 0.5);
	        box-sizing: border-box;
	    }
	
	    .center-form input[type="submit"] {
	    	width: 200px;
	    	font-weight: bold;
	        background-color: #115A5B;
	        margin-left: auto;
	        margin-top: 10px;
	        border-radius: 5px; 
	        color: white;
	        border: 1px solid #ccc; /* 테두리를 설정하여 입력란을 강조 */
	        padding: 8px; /* 내부 여백을 설정하여 텍스트와 입력란의 간격을 조절 */
	    }
	
	    .center-form input[type="submit"]:hover {
	        background-color: #0056b3; /* 버튼에 호버 효과를 추가하여 마우스를 올렸을 때 색상 변경 */
	    }
    </style>
</head>
<body>
    <jsp:include page="../frame/menu.jsp" />

    <div class="center-content">
    	<h1 class="login-heading">Log In</h1>
    	
        <form method="post" action="loginProcess.jsp" class="center-form" name="loginForm">
            <label for="id"> ID </label><br> <input type="text" name="id"><br>
            <label for="pw"> PASSWORD </label><br> <input type="password" name="pw">
            <p><input type="submit" value="로그인"></p>
        </form>

        <div id="userLinks">
            <a href="register.jsp">회원가입</a> |
            <a href="findID.jsp" id="findIdLink">아이디 찾기</a> |
            <a href="findPasswd.jsp" id="findPasswdLink">비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>

<script>
    document.getElementById('findIdLink').addEventListener('click', function(event) {
        // 링크의 기본 동작을 막음
        event.preventDefault();

        // 창의 가로, 세로 크기
        var windowWidth = 500;
        var windowHeight = 400;

        // 창의 가로, 세로 중앙 위치 계산
        var left = (window.innerWidth - windowWidth) / 2;
        var top = (window.innerHeight - windowHeight) / 2 + 100;;

        // 창 속성 정의
        var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',left=' + left + ',top=' + top;

        // 새 창 열기
        window.open('findID.jsp', '_blank', windowFeatures);
    });
    
    document.getElementById('findPasswdLink').addEventListener('click', function(event) {
        // 링크의 기본 동작을 막음
        event.preventDefault();

     	// 창의 가로, 세로 크기
        var windowWidth = 500;
        var windowHeight = 400;

        // 창의 가로, 세로 중앙 위치 계산
        var left = (window.innerWidth - windowWidth) / 2;
        var top = (window.innerHeight - windowHeight) / 2 + 100;

        // 창 속성 정의
        var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',left=' + left + ',top=' + top;

        // 새 창 열기
        window.open('findPasswd.jsp', '_blank', windowFeatures);
    });
</script>
