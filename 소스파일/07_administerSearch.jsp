<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>관리자 찾기</title>
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

        <%
            String booktitle2 = request.getParameter("booktitle");
            String bookauthor2 = request.getParameter("bookauthor");

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ResultSet rs2 = null;
            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                String dbId = "root";
                String dbPass = "1234";

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                String sql = "select bookId, title, author from Book ";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                boolean b = false;
                boolean b2 = false;
                while (rs.next()) {
                    String title = rs.getString("title");
                    String author = rs.getString("author");

                    session.setAttribute("title", booktitle2);
                    session.setAttribute("author", bookauthor2);
                    if (booktitle2.equals(title)) {
                        b = true;
                        if (bookauthor2.equals(author)) {
                            b2 = true;
                            int bookId = rs.getInt("bookId");
                            String idinfo = String.valueOf(bookId);
                            session.setAttribute("bookId", idinfo);
        %>
        <script type="text/javascript">
            alert("이미 등록되었습니다. Copy등록 페이지로 이동합니다");
            location.href = "10_registerCopyInfo.jsp";
        </script><%
                        break;
                    }
                }
            }
            if (b2 == false) {
        %>
        <script type="text/javascript">
            alert("새로운 도서 정보가 등록되었습니다. ");
            location.href = "08_registerBookInfo.jsp"
        </script><%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <script type="text/css">
            alert("Error!");
        </script>
        <%
            }
        %>	
    </body>
</html>