<!--
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>고객 센터</title>
<style>
  a {
    color: black;
    text-decoration: none;
  }
  table {
    width: 100%;
    border-top: 1px solid #d3d3d3;
    border-collapse: collapse;
  }
  th { 
    background-color: #d3d3d3 ; 
    border-top: 3px solid #727272;
    text-align: center;
  }
  th, td {
    border-bottom: 1px solid #d3d3d3;
    padding: 10px;
    text-align: center;
  }
  .greylist {
    width: 50px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: grey;
    border: solid 2px white;
    border-radius: 5px;
  }
  .gradient {
    width: 80px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: linear-gradient( to bottom, grey, black );
    border: solid 2px white;
    border-radius: 5px;
  }
  .right {float: right;}
  .center {text-align: center;}
</style>
</head>
<body>
	<jsp:include page="../frame/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Q&A</h1>
		</div>
	</div>
  <br>
  <table>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>일시</th>
    </tr>
    <tr>
      <td class="center">1</td>
      <td class="left">게시글 1 입니다.</td>
      <td class="center">김준석</td>
      <td class="center">2022-05-18</td>
    </tr>
     <tr>
        <td class="center">2</td>
        <td class="left">게시글 2 입니다.</td>
        <td class="center">김준석</td>
        <td class="center">2022-05-18</td>
    </tr>
    <tr>
        <td class="center">3</td>
        <td class="left">게시글 3 입니다.</td>
        <td class="center">김준석</td>
        <td class="center">2022-05-18</td> 
    </tr>
  </table>
  <br>
  <span class="right">
    <input type="button" value="글쓰기" class="gradient">
  </span>
	<jsp:include page="../frame/footer.jsp" />
</body>
</html> -->
<!--
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>고객 센터</title>
<style>
  a {
    color: black;
    text-decoration: none;
  }
  table {
    width: 100%;
    border-top: 1px solid #d3d3d3;
    border-collapse: collapse;
  }
  th { 
    background-color: #d3d3d3 ; 
    border-top: 3px solid #727272;
    text-align: center;
  }
  th, td {
    border-bottom: 1px solid #d3d3d3;
    padding: 10px;
    text-align: center;
  }
  .greylist {
    width: 50px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: grey;
    border: solid 2px white;
    border-radius: 5px;
  }
  .gradient {
    width: 80px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: linear-gradient( to bottom, grey, black );
    border: solid 2px white;
    border-radius: 5px;
  }
  .right {float: right;}
  .center {text-align: center;}
</style>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Q&A</h1>
    </div>
  </div>
  <br>
  <table>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>일시</th>
    </tr>
    <tr>
      <td class="center">1</td>
      <td class="left">게시글 1 입니다.</td>
      <td class="center">2022-05-18</td>
    </tr>
    <tr>
      <td class="center">2</td>
      <td class="left">게시글 2 입니다.</td>
      <td class="center">2022-05-18</td>
    </tr>
    <tr>
      <td class="center">3</td>
      <td class="left">게시글 3 입니다.</td>
      <td class="center">2022-05-18</td> 
    </tr>
  </table>
  <br>
  <span class="right">
    <input type="button" value="글쓰기" class="gradient">
  </span>
  <jsp:include page="../frame/footer.jsp" />
</body>
</html> -->
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>고객 센터</title>
<style>
  a {
    color: black;
    text-decoration: none;
  }
  table {
    width: 100%;
    border-top: 1px solid #d3d3d3;
    border-collapse: collapse;
  }
  th { 
    background-color: #d3d3d3 ; 
    border-top: 3px solid #727272;
    text-align: center;
  }
  th, td {
    border-bottom: 1px solid #d3d3d3;
    padding: 10px;
    text-align: center;
  }
  .greylist {
    width: 50px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: grey;
    border: solid 2px white;
    border-radius: 5px;
  }
  .gradient {
    width: 80px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: linear-gradient( to bottom, grey, black );
    border: solid 2px white;
    border-radius: 5px;
  }
  .right {float: right;}
  .center {text-align: center;}
</style>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">Q&A</h1>
    </div>
  </div>
  <br>
  <table>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>일시</th>
    </tr>
<%@ page import="java.sql.*" %>
<%
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;

   try {
      // JDBC 드라이버 로딩 (MySQL 드라이버)
      Class.forName("com.mysql.cj.jdbc.Driver");

      // 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
      String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
      String user = "root";
      String password = "1234";

      // 데이터베이스 연결
      conn = DriverManager.getConnection(url, user, password);

      // SQL 쿼리 (MySQL 쿼리)
      String sql = "SELECT hidx, title, content_date FROM help WHERE midx = 'E1'";
      
      // 쿼리 실행
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      // 결과 처리
      while (rs.next()) {
%>
       <!-- <tr>
          <td class="center"><%= rs.getString("hidx") %></td>
          <td class="left"><%= rs.getString("title") %></td>
          <td class="center"><%= rs.getString("content_date") %></td>
        </tr> -->
        <tr>
  			<td class="center"><%= rs.getString("hidx") %></td>
  			<td class="left"><a href="viewQuestion.jsp?hidx=<%= rs.getString("hidx") %>"><%= rs.getString("title") %></a></td>
  			<td class="center"><%= rs.getString("content_date") %></td>
		</tr>
<%
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      // 자원 해제
      if (rs != null) try { rs.close(); } catch(Exception e) {}
      if (stmt != null) try { stmt.close(); } catch(Exception e) {}
      if (conn != null) try { conn.close(); } catch(Exception e) {}
   }
%>
  </table>
  <br>
  <span class="right">
    <a href="writeQuestion.jsp"><input type="button" value="글쓰기" class="gradient"></a>
  </span>
  <jsp:include page="../frame/footer.jsp" />
</body>
</html>
