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

<script type="text/javascript">
	function checkDuplicateId() {
		window.open("checkDuplicateId.jsp", "CheckDuplicateIdResult", "width=400, height=200");
	}
	
	function checkRegister() {
		var form = document.registerForm;
		var username = form.id.value;
		if (!/^[a-z0-9]+$/.test(username)) {
	        alert("아이디는 영문 소문자와 숫자만 입력 가능합니다");
			form.id.focus();
			return false;
		}
		
		var password = form.pw.value;
		
	    if (!/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])/.test(password)) {
	        alert("비밀번호는 영문 소문자, 숫자, 특수 기호를 포함해야 합니다");
	        form.pw.focus();
	        return false;
	    }
	    
	    var phoneNumber = form.phone.value;
	    
	    if (!/^\d{3}-\d{4}-\d{4}$/.test(phoneNumber)) {
	        alert("휴대폰 번호는 010-1234-5678 형식으로 입력해주세요");
	        form.phone.select();
	        return;
	    }
	    
	    var confirmPassword = form.pw_repeat.value;
	    if(confirmPassword !== password){
	    	alert("비밀번호가 일치하지 않습니다.");
	    	return false;
	    }
	    
		form.submit();
	}
</script>

<body>
	<jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-1">회원가입</h1>
        </div>
    </div>
    

    <div class="center-content">
        <form method="post" action="registerProcess.jsp" class="center-form" name="registerForm">
            <p> 아이디 : <input type="text" name="id"><input type="button" value="아이디 중복 검사" onclick="checkDuplicateId()">
            <p> 비밀번호 : <input type="text" name="pw"></p>
            <p> 비밀번호 확인 : <input type="text" name="pw_repeat"></p>
            <p> 이름 : <input type="text" name="name"></p>
            <p> 휴대폰 : <input type="text" name="phone"></p>
            <p> 주소 : <input type="text" name="address"></p>
            <p><input type="button" value="회원가입" onclick="checkRegister()"></p>
        </form>
    </div>
</body>
</html>



