<%@page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>Welcome</title>
	<style>
        .logout-links {
            margin-right: 20px;
        }
    </style>
</head>
<body>
	<jsp:include page="../frame/menu.jsp" />
	<div class="text-right logout-links"> 
			<a href="logout.jsp" >로그아웃</a>
	</div>

</body>
</html>