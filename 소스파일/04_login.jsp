<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>단국대학교(Login)</title>
        <style type="text/css">
            body{
                background-color : #e7eaef;
                margin:10px auto;
            }
            h1.t{
                margin-top: 0px;margin-left: 0px;
                padding-left: 10px;padding-top: 10px;padding-bottom: 10px;
                background-color: #105ea6;
                color:white;
            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="t">DKU | 단국대학교</h1>
        <%
            String insertId = request.getParameter("insert");
            String pass = request.getParameter("psw");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                String dbId = "root";
                String dbPass = "1234";

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                String sql = "select password, administer,name,userId from UserInfo where id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, insertId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String userid=Integer.toString(rs.getInt("userId")); 
                    String passw = rs.getString("password");
                    boolean b = rs.getBoolean("administer");
                    String name = rs.getString("name");
                    if (pass.equals(passw)) {
                        session.setAttribute("name", name);
                        session.setAttribute("insert", insertId);
                        session.setAttribute("userId", userid);
        %>
        <script type="text/javascript">
            alert("정상적으로 로그인 되었습니다.");
        </script>
        <%
                if (b == true) {%>
        <script type="text/javascript">
            location.href = "05_adminPage.jsp";
        </script>

        <% } else {%> 
        <script type="text/javascript">
            location.href = "12_Main.jsp";
        </script>
        <%} %>

        <%
        } else {
        %>
        <script type="text/javascript">
            alert("비밀번호를 다시 입력해주십시오.");
           location.href = "loginView.html";
        </script><%
            }
        } else {
        %>
        <script type="text/javascript">
            alert("id가 존재하지 않습니다.");
            location.href = "loginView.html";
        </script><%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                //rs!=null : 기억장소가 확보되어 있다는 뜻
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException ex) {
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                    }
                }
            }
        %>	
    </body>
</html>