<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <jsp:include page="../frame/header.jsp"></jsp:include>
  <style>
    .title {
      margin-top: 50;
      margin-right: 20px;
      background-color: rgba(255, 255, 255, 0);
      border: none;
      color: #115A5B;
      font-size: 25px;
      display: inline-block;
      margin-bottom: 10px;
    }

  .title-box {
    background: rgba(250, 98, 98, 0.3);
    height: 35px;
    width: 900px;
    color: black;
    align-items: center;
    padding: 10px;
    border: none;
    border-radius: 5px;
    display: inline-block;
  }
  .title-box input {
    background-color: rgba(0, 0, 0, 0);
    width: 100%;
  	height: 100%;
    border: none;
    outline: none;
  }
  .title-box input:focus {
    box-shadow: none;
  }
  .content {
  	background-color: rgba(17, 90, 91, 0.3);
  	margin-top: 20px;
  	height: 300px;
    width: 1000px;
    color: black;
    border-radius: 5px;
  }
  .content textarea {
    background-color: rgba(0, 0, 0, 0);
    width: 100%;
  	height: 100%;
    border: none;
    outline: none;
  }
  .content textarea:focus {
    box-shadow: none;
  }
  .pic-ch {
  	color: #115A5B;
  	font-weight: bolder;
  }
  .gradient {
    background: #115A5B;  
  	margin-right:100;
    width: 80px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: linear-gradient( to bottom, #115A5B, #115A5B );
    background-color: rgba(255, 255, 255, 0);
    border: solid 2px white;
    border-radius: 5px;
  }
  .btn {
  	margin-left: 500px;
  }
  .pic-ch,
  .pic,
  .btn {
    display: inline-block;
    margin-right: 20px;
    margin-top: 20px;
  }
  </style>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  <div class="container mt-5">
  	<form action="saveQuestion.jsp" method="post" enctype ="multipart/form-data">
  		<span class="title"><strong>제목: </strong></span>
  		<div class="title-box">
  			<input type="text" class="form-control" id="title" name="title" required>
  		</div>
  		<div class="content">
        	<textarea class="form-control" id="contents" name="contents" rows="4" required></textarea>
        </div>
        <span class="pic-ch">사진 : </span>
        <div class="pic">
        	<input type="file" class="form-control-file" id="file" name="file">
      	</div>
      	<div class="btn">
      		<button type="submit" class="gradient">글 작성</button>
      	</div>
  	</form>
  </div>
  <jsp:include page="../frame/footer.jsp" />
</body>
</html> 