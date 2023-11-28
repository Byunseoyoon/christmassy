<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find ID</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

    <h1>아이디 찾기</h1>

    <form id="findIdForm">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
        <button type="button" onclick="findId()">아이디 찾기</button>
    </form>

    <div id="result"></div>

    <script>
        function findId() {
            var name = $('#name').val();

            $.ajax({
                url: 'findIDProcess.jsp',
                method: 'POST',
                data: { name: name },
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
