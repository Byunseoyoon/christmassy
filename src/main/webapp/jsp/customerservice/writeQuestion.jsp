<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <title>고객센터</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  
  <div class="container mt-5">
    <h2>글쓰기</h2>
    <form action="saveQuestion.jsp" method="post">
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" id="title" name="title" required>
      </div>
      <div class="form-group">
        <label for="contents">내용:</label>
        <textarea class="form-control" id="contents" name="contents" rows="4" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">글 올리기</button>
    </form>
  </div>

  <jsp:include page="../frame/footer.jsp" />
</body>
</html>