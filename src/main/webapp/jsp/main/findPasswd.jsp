<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../frame/header.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Password</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }
    .login-heading {
        font-size: 30px; 
        font-weight: bold;
        margin-bottom: 30px;
        margin-top : 30px; 
        text-align: center;
        color: #115A5B;
    }
    #findPasswordForm {
        text-align: center;
        max-width: 400px;
        width: 100%;
    }

    #findPasswordForm label {
        display: block;
        margin-bottom: 5px;
        color: #115A5B;
        font-weight: bold;
    }

    #findPasswordForm input {
        width: 300px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        background-color: rgba(17, 90, 91, 0.5);
        border-radius: 5px;
        box-sizing: border-box;
    }

    #findPasswordForm button {
        width: 100px;
        background-color: #115A5B;
        border-radius: 5px;
        color: white;
        border: 1px solid #ccc;
        padding: 8px;
        cursor: pointer;
    }

    #result {
        text-align: center;
        margin-top: 20px;
    }
 </style>
<body>

    <div class="center-content">
    	<h1 class="login-heading">비밀번호 찾기</h1>

	    <form id="findPasswordForm">
	    	<label for="name">이름</label>
	        <input type="text" id="name" name="name" required>
	        <label for="id">아이디</label>
	        <input type="text" id="id" name="id" required>
	        <p><button type="button" onclick="findPassword()">검색</button></p>
	    </form>

   		<div id="result"></div>
   	</div>

    <script>
        function findPassword() {
            var id = $('#id').val();
            var name = $('#name').val();
            
            if (!id.trim()) {
                alert('아이디를 입력하세요.');
                return;
            }
            
            if (!name.trim()) {
                alert('이름을 입력하세요.');
                return;
            }

            $.ajax({
                url: 'findPasswdProcess.jsp',
                method: 'POST',
                data: { id: id , name: name},
                success: function(data) {
                    $('#result').html(data);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                }
            });
        }
    </script>

</body>
</html>


