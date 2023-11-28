<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%! 
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection connection = null;

        try {
            // JDBC 드라이버 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            String url = "jdbc:mysql://localhost:3306/christmassyDB?serverTimezone=UTC";
            String username = "root";
            String password = "1234";
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return connection;
    }
%>
