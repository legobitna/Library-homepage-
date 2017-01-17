<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>카피정보 저장</title>
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
            footer{
                margin-top: 0px;
                font-weight: normal;
                text-align: center;
            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
         <h1 class="t">DKU | 단국대학교</h1>
        <%
            int copyid = Integer.valueOf(request.getParameter("copyid"));
            int bookid = Integer.valueOf(request.getParameter("bookid"));
            Date purchasedate = Date.valueOf(request.getParameter("purchasedate"));
            boolean rentstate = Boolean.valueOf(request.getParameter("rentstate"));

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String str = "";

            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                String dbId = "root";
                String dbPass = "1234";

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                String sql = "insert into Copy values(?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, copyid);
                pstmt.setInt(2, bookid);
                pstmt.setDate(3, purchasedate);
                pstmt.setBoolean(4, rentstate);
                pstmt.executeUpdate();

                str = "Copy 테이블에 새로운 레코드를 추가했습니다";%>
        <script type="text/javascript">
            alert("Copy 테이블에 새로운 레코드를 추가했습니다");
            location.href = "05_adminPage.jsp";
 
        </script>
        <%
            } catch (Exception e) {
                e.printStackTrace();
                str = "Copy 테이블에 새로운 레코드 추가 실패";%>
        <script type="text/javascript">
            alert("Copy 테이블에 새로운 레코드 추가 실패");
            history.back();
        </script>
        <%
            }
        %>
        <%=str%>
    </body>
         <footer>
            <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
                Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
        </footer>
</html>