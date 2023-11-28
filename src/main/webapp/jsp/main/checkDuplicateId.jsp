<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Duplicate ID</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body onload="pValue()">

    <h1>아이디 중복 확인</h1>

    <form id="checkDuplicateIdForm">
        <label for="checkId">아이디:</label>
        <input type="text" id="checkId" name="checkId" required>
        <button type="button" onclick="checkDuplicateId()">중복 확인</button>
    </form>

    <div id="result"></div>

    <script>
    	function pValue(){
    		document.getElementById("checkId").value = opener.document.registerForm.id.value;
    	}
    	
        function checkDuplicateId() {
            var checkId = $('#checkId').val();
            
            if (!checkId.trim()) {
                alert('아이디를 입력하세요.');
                return;
            }

            // Validate if the ID contains only letters and numbers
            var idRegex = /^[a-zA-Z0-9]+$/;
            if (!idRegex.test(checkId)) {
                alert('아이디는 영어와 숫자만 가능합니다.');
                return;
            }

            $.ajax({
                url: 'checkDuplicateIdProcess.jsp',
                method: 'POST',
                data: { checkId: checkId },
                success: function(data) {
                    $('#result').html(data);
                    if (data.indexOf("사용 가능한 아이디입니다.") !== -1) {
                        $('#result').append('<input type="button" value="사용" onclick="useId()">');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                }
            });
        }
        
        function useId() {
            var checkId = $('#checkId').val();
            
            // 부모 창으로 아이디 전달
            window.opener.document.registerForm.id.value = checkId;
            
            // 현재 창 닫기
            window.close();
        }
    </script>

</body>
</html>
