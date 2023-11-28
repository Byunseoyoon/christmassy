<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<style>
  a {
    color: #115A5B;
    text-decoration: none;
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
  table {
    width: 1500;
    border-top: 1px solid #d3d3d3;
    border-collapse: collapse;
    margin-left:auto; 
    margin-right:auto;
  }
  th { 
    background-color: #d3d3d3 ; 
    border-top: 3px solid #115A5B;
    text-align: center;
    color: white;
    border-bottom: 1px solid #d3d3d3;
    padding: 10px;
    text-align: center;
    color: white;
    background-color: #115A5B;
  }
  td {
    border-bottom: 1px solid #d3d3d3;
    padding: 10px;
    text-align: center;
    color: #115A5B;
  }
  .greylist {
    width: 50px;
    height: 30px;
    font-weight: 900;
    color: white;
    text-align: center;
    background: grey;
    background-color: rgba(255, 255, 255, 0);
    border: solid 2px white;
    border-radius: 5px;
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
  .right {float: right;}
  .center {text-align: center;}
</style>
</head>
<body>
  <jsp:include page="../frame/adminMenu.jsp" />
  <div class="jumbo">
		<h1>회원 목록</h1>
  </div>
  <br>
  <table>
    <tr>
      <th class="center">id</th>
      <th class="center">이름</th>
      <th class="center">전화번호</th>
    </tr>
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

	     String sql = "SELECT id, name, phone " +
                 "FROM members ";
	     stmt = conn.createStatement();
	     rs = stmt.executeQuery(sql);

	     while (rs.next()) {

	   %>
	   <tr>
	   <td class="center"><%= rs.getString("id") %></td>
	   <td class="left"><%= rs.getString("name") %></td>
	   <td class="center"><%= rs.getString("phone") %></td>
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
  <jsp:include page="../frame/footer.jsp" />
</body>
</html>