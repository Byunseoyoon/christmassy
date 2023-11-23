<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>

<%
String categoryDetail = request.getParameter("categoryDetail");
%>



<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <title><%=categoryDetail %></title>
</head>
<body>

    <jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><%=categoryDetail%></h1>
        </div>
    
        <div id="mainContent">
        <jsp:include page="category.jsp" />
         </div>
        
    </div>
    
    
    <%
    
    
        Connection connection = null;
    
    
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // JDBC 드라이버 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            String url = "jdbc:mysql://localhost:3306/christmassyDB?serverTimezone=UTC";
            String username = "root";
            String password = "gyuri127";
            connection = DriverManager.getConnection(url, username, password);

            // SQL 쿼리 동적 
            String query = "SELECT pidx, pname, price, descriptor , image FROM products WHERE categoryDetail = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1,categoryDetail);
           // statement = connection.createStatement();
           System.out.println("실행된 쿼리: " + pstmt.toString());
            resultSet = pstmt.executeQuery();

            // 상품 목록 출력
            while (resultSet.next()) {
            	int pidx = resultSet.getInt("pidx");
                String pname = resultSet.getString("pname");
                int price = resultSet.getInt("price");
                String descriptor = resultSet.getString("descriptor");
                String image = resultSet.getString("image");
                
                
                //System.out.println("pname: " + pname + ", price: " + price + ", descriptor: " + descriptor);
            %>

            <div class="col-md-4">
            
            <img src="image%>" style="width: 100%"; height: 100% />
                <h3><%=pname%></h3>
                <p>가격: <%=price%>원</p>
                <p>설명: <%=descriptor%></p>
                <!-- 추가 필요한 내용 -->
            </div>

            <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    %>

    <div class="container">
        <hr>
    </div>
    <jsp:include page="../frame/footer.jsp" />
</body>
</html>
