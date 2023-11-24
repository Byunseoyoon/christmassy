<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	
	// 각자 사용
	String url = "jdbc:mysql://localhost:3306/christmassyDB?serverTimezone=UTC";
	String user = "root";
	String password = "1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
%>