<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%! //변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
    String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String password = "980426";
%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<style>
  :root {
		  --main-box-height: 90vh;
	}
  div{ 
  	color: #194F35;
  }
  .mypage-container{
  	border-style: solid;
  	border-width : 1.5px;
  	border-color: #194F35;
  	border-radius: 5px;
  	width: var(--main-box-width);		  
	margin-top: calc((100vh - var(--main-box-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
  	margin-left : 260px;
  	margin-right : 40px;
  	padding: 50px;
  }
  
  .box{
  	border-bottom-width : 1px;
  	border-bottom-style: solid;
  	margin: 20px;
  }
  .box-item{
  	margin-left:35%;
  }
  .item{
  	display: inline-block;
  	margin-left:5%;
  }
   
  .box-title{
  	font-size: 1rem;
  	text-align: center;
  	font-weight:bold;
  }
  
</style>
</head>
<body>
	<%
	   try {
	      // JDBC 드라이버 로딩 (MySQL 드라이버)
	      Class.forName("com.mysql.cj.jdbc.Driver");
	      
	      // 데이터베이스 연결
	      conn = DriverManager.getConnection(url, user, password);
	
	      // SQL 쿼리 (MySQL 쿼리)  //세션에 사용자 정보 저장하고 where 값 받아오기
	      String sql = "SELECT * FROM members WHERE midx = '1'";
	      
	      // 쿼리 실행
	      stmt = conn.createStatement();
	      rs = stmt.executeQuery(sql);
	      
	      if (rs.next()) {
	    	    
	    	} else {
	    	    out.println("데이터가 없습니다.");
	    	}
	%>
	<jsp:include page="../frame/menu.jsp" />
	<jsp:include page="../frame/myPageMenu.jsp" />
	<div class="main-box">
		<div class="mypage-container">
			<div class="box-title">회원정보</div>
			<div class="box-title"><img src="/Christmassy/src/main/webapp/resources/images/profile.jpg" alt="profile"></div>
			<div class="box"><div class=" box-item">이름 : <div class="item"><%= rs.getString("name") %></div></div></div>
			<div class="box"><div class="box-item">아이디 : <div class="item"><%= rs.getString("id") %></div></div></div>
			<div class="box"><div class="box-item">phone : <div class="item"><%= rs.getString("phone") %></div></div></div>
			<div class="box"><div class="box-item">주소 : <div class="item"><%= rs.getString("address") %></div></div></div>
			<div class="box"><div class="box-item">가입 날짜 : <div class="item"><%= rs.getString("mdate") %></div></div></div> 

<%
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      // 자원 해제
      if (rs != null) try { rs.close(); } catch(Exception e) {}
      if (stmt != null) try { stmt.close(); } catch(Exception e) {}
      if (conn != null) try { conn.close(); } catch(Exception e) {}
   }
%>
	</div>
</div>
		
	<jsp:include page="../frame/footer.jsp" />
</body>
</html> 