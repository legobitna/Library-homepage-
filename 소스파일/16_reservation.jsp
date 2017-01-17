<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>책 반납하기</title>
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
            int cnt = 0;
            String bookid2 = (String) session.getAttribute("bookId");
            String id = (String) session.getAttribute("insert");
            
            int bookid = Integer.parseInt(bookid2);
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
            String dbId = "root";
            String dbPass = "1234";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

            String sql = "select password,userid,administer from userinfo";//사용자 id확인
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            int userid;
            
            if (rs.next()) {
                
                userid=rs.getInt("userID");
                
                sql = "select * from copy";//책 id 확인
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                int copyid;
                if (rs.next()) {
                    
                    copyid=rs.getInt("copyId");
                    
                    sql="insert into reserveBook(copyId, userID, rsvDate) values('"+copyid+"','"+userid+"', now())";
                    
                    pstmt = conn.prepareStatement(sql);
                    cnt = pstmt.executeUpdate(sql);
        %>
        <script type="text/javascript">
            alert("예약이 완료되었습니다.  ");
            location.href = "12_Main.jsp";
        </script>
        <%
        } else {
        %>
        <script type="text/javascript">
            alert("일치하는 책이 없습니다. 다시입력해주세요  ");
            location.href = "16_reservation.jsp";
        </script>
        <%
            }
        } else {
        %>
        <script type="text/javascript">
            alert("일치하는 아이디가 없습니다 다시입력해주세요  ");
            location.href = "16_reservation.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>