<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Password</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

    <h1>비밀번호 찾기</h1>

    <form id="findPasswordForm">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required>
        <button type="button" onclick="findPassword()">비밀번호 찾기</button>
    </form>

    <div id="result"></div>

    <script>
        function findPassword() {
            var id = $('#id').val();

            $.ajax({
                url: 'findPasswdProcess.jsp',
                method: 'POST',
                data: { id: id },
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


