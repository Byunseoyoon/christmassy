<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <title>고객센터</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
  <style>
  	body {
      background-image: url('bg.png');
      background-size: 100% auto;
      background-repeat: repeat-y;
      min-height: 100vh;
  	}
  	.jumbo {
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
    	text-align: center;
    	color: #115A5B;
	}
  </style>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  <div class="jumbo">
		<h1>글 쓰기</h1>
	</div>
  <div class="container mt-5">
    <form action="saveQuestion.jsp" method="post" enctype ="multipart/form-data">
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" id="title" name="title" required>
      </div>
      <div class="form-group">
        <label for="contents">내용:</label>
        <textarea class="form-control" id="contents" name="contents" rows="4" required></textarea>
      </div>
      <div class="form-group">
        <label for="file">사진 업로드:</label>
        <input type="file" class="form-control-file" id="file" name="file">
      </div>
      <button type="submit" class="btn btn-primary">글 올리기</button>
    </form>
  </div>
  <jsp:include page="../frame/footer.jsp" />
</body>
</html> 