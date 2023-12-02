<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <jsp:include page="../frame/header.jsp"></jsp:include>
    <style>
        .center-content {
            text-align: center; /* 내용 가운데 정렬 */
            margin-top: 20px; /* 상단 여백 조절 */
        }
        .login-heading {
            font-size: 50px; 
            font-weight: bold;
            margin-bottom: 50px;
            margin-top : 30px; 
            text-align: center;
            color: #115A5B;
        }
        .center-content p {
	        color: #115A5B;
	        font-weight: bold;
	    }
        .center-form input[type="text"].id {
	        width: 340px; /* 예시로 너비를 조절하였습니다. 필요에 따라 수정하세요. */
	        padding: 8px;
	        margin-bottom: 15px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        background-color: rgba(17, 90, 91, 0.5);
	        box-sizing: border-box;
	    }
   
        .center-form input[type="text"]:not(.id),
	    .center-form input[type="password"] {
	        width: 450px;
	        padding: 8px;
	        margin-bottom: 15px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        background-color: rgba(17, 90, 91, 0.5);
	        box-sizing: border-box;
	    }
	    .center-form input[type="button"].checkButton {
	    	width: 100px;
	        background-color: #115A5B;
	        margin-left: 10px;
	        margin-top: 10px;
	        border-radius: 5px; 
	        color: white;
	        border: 1px solid #ccc; /* 테두리를 설정하여 입력란을 강조 */
	        padding: 8px; /* 내부 여백을 설정하여 텍스트와 입력란의 간격을 조절 */
	    }
	    .center-form input[type="button"].registerButton {
	    	width: 200px;
	        background-color: #115A5B;
	        margin-left: auto;
	        margin-top: 10px;
	        border-radius: 5px; 
	        color: white;
	        border: 1px solid #ccc; /* 테두리를 설정하여 입력란을 강조 */
	        padding: 8px; /* 내부 여백을 설정하여 텍스트와 입력란의 간격을 조절 */
	    }
    </style>
</head>

<script type="text/javascript">
	function checkDuplicateId() {
		var form = document.registerForm;
		var username = form.id.value;
		if (username.trim() === "") {
            alert("아이디를 입력하세요.");
            form.id.focus();
			return false;
		}
		if (!/^[a-z0-9]+$/.test(username)) {
	        alert("아이디는 영문 소문자와 숫자만 입력 가능합니다");
			form.id.focus();
			return false;
		}
		window.open("checkDuplicateId.jsp", "CheckDuplicateIdResult", "width=400, height=300");
	}
	
	function checkRegister() {
		var form = document.registerForm;
		var username = form.id.value;
		if (username.trim() === "") {
            alert("아이디를 입력하세요.");
            form.id.focus();
			return false;
		}

		if (!/^[a-z0-9]+$/.test(username)) {
	        alert("아이디는 영문 소문자와 숫자만 입력 가능합니다");
			form.id.focus();
			return false;
		}
		
		var password = form.pw.value;
		if (password.trim() === "") {
            alert("비밀번호를 입력하세요.");
            form.id.focus();
			return false;
		}
		
	    if (!/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])/.test(password)) {
	        alert("비밀번호는 영문 소문자, 숫자, 특수 기호를 포함해야 합니다");
	        form.pw.focus();
	        return false;
	    }
	    
	    if (form.name.value.trim() === "") {
            alert("이름을 입력하세요.");
            form.id.focus();
			return false;
		}
	    
	    var phoneNumber = form.phone.value;
	    
	    if (phoneNumber.trim() === "") {
            alert("휴대폰 번호를 입력하세요.");
            form.id.focus();
			return false;
		}
	    
	    if (!/^\d{3}-\d{4}-\d{4}$/.test(phoneNumber)) {
	        alert("휴대폰 번호는 010-1234-5678 형식으로 입력해주세요");
	        form.phone.select();
	        return;
	    }
	    
	    if (form.address.value.trim() === "") {
            alert("주소를 입력하세요.");
            form.id.focus();
			return false;
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
    <div class="center-content">
    	<h1 class="login-heading">Sign up</h1>
    
	    <div class="center-content">
	        <form method="post" action="registerProcess.jsp" class="center-form" name="registerForm">
	            <p> 아이디 <br> <input type="text" name="id" class="id"><input type="button" value="중복 검사" class="checkButton" onclick="checkDuplicateId()">
	            <p> 비밀번호 <br> <input type="password" name="pw"></p>
	            <p> 비밀번호 확인 <br> <input type="password" name="pw_repeat"></p>
	            <p> 이름 <br> <input type="text" name="name"></p>
	            <p> 휴대폰 <br> <input type="text" name="phone"></p>
	            <p> 주소 <br> <input type="text" name="address"></p>
	            <p><input type="button" value="회원가입" class="registerButton" onclick="checkRegister()"></p>
	        </form>
	    </div>
	</div>
</body>
</html>



