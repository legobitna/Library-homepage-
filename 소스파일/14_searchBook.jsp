<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>책 검색하기</title>
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
                padding-top: 390px;
            }
            h3.red{
                padding-left: 10px;
                color:#f15441;
            }
            p{
                margin-left: 25px;
                background-color: lightgray;
                padding-left:20px;padding-top: 10px;padding-bottom: 10px;
                width: 1050px;
            }
            table{
                text-align: center;
                border-top: black solid 1px;
                border-left: black solid 1px;
                padding-left: 50px;
                
            }
            td{
                border-bottom: black solid 1px;
                border-right: black solid 1px;
            }
            .adjust{
                margin-left: 150px;
                padding-left: 150px;
            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="t">DKU | 단국대학교</h1>
        <div class="adjust">
            <h2>검색결과</h2>
            <table border="1">
                <tr>
                    <td width="100">책 ID</td>
                    <td width="150">책 제목</td>
                    <td width="150">책 저자</td>
                    <td width="150">출판사</td>
                    <td width="100">가격</td>
                    <td width="100">참고도서여부</td>
                    <td width="100">비고</td>
                </tr>

                <%
                    String word = request.getParameter("word");
                    String menu = request.getParameter("category");
                    boolean b = false;
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                        String dbId = "root";
                        String dbPass = "1234";
                        String bookIdd = "";
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                        if (menu.equals("booktitle")) {

                            String sql = "select * from Book ";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();
                            while (rs.next()) {

                                int bookId = rs.getInt("bookId");
                                String title = rs.getString("title");
                                String author = rs.getString("author");
                                String publisher = rs.getString("publisher");
                                int price = rs.getInt("price");
                                boolean reference = rs.getBoolean("reference");

                                if (word.equals(title)) {
                                    b = true;
                                    bookIdd = String.valueOf(bookId);

                %>

                <tr>
                    <td width="100"><%=bookId%></td>
                    <td width="150"><%=title%></td>
                    <td width="150"><%=author%></td>
                    <td width="150"><%=publisher%></td>
                    <td width="100"><%=price%>원</td>
                    <td width="100"><%=reference%></td>
                    <td width="100"><a href="15_searchCopy.jsp">책 정보보기</a></td>
                </tr> <%
                        }

                    }
                    session.setAttribute("bookId", bookIdd);
                    if (b == false) {
                %><script type="text/javascript">
                    alert("일치하는책의 졍보가 없습니다");
                    history.back();
                </script><%
                        }

                    }
                    if (menu.equals("bookauthor")) {

                        String sql = "select * from Book ";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();
                        while (rs.next()) {

                            int bookId = rs.getInt("bookId");
                            String title = rs.getString("title");
                            String author = rs.getString("author");
                            String publisher = rs.getString("publisher");
                            int price = rs.getInt("price");
                            boolean reference = rs.getBoolean("reference");

                            if (word.equals(author)) {
                                b = true;
                                bookIdd = String.valueOf(bookId);

                %> <tr>
                    <td width="100"><%=bookId%></td>
                    <td width="150"><%=title%></td>
                    <td width="150"><%=author%></td>
                    <td width="150"><%=publisher%></td>
                    <td width="100"><%=price%>원</td>
                    <td width="100"><%=reference%></td>
                    <td width="100"><a href="searchCopy.jsp">책 정보보기</a></td>
                </tr><%
                        }

                    }
                    session.setAttribute("bookId", bookIdd);
                    if (b == false) {
                %><script type="text/javascript">
                    alert("일치하는책의 졍보가 없습니다");
                    history.back();
                </script><%
                        }
                    }
                    if (menu.equals("bookpublisher")) {

                        String sql = "select * from Book ";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();
                        while (rs.next()) {

                            int bookId = rs.getInt("bookId");
                            String title = rs.getString("title");
                            String author = rs.getString("author");
                            String publisher = rs.getString("publisher");
                            int price = rs.getInt("price");
                            boolean reference = rs.getBoolean("reference");

                            if (word.equals(publisher)) {
                                b = true;
                                bookIdd = String.valueOf(bookId);
                                session.setAttribute("bookId", bookIdd);
                %> <tr>
                    <td width="100"><%=bookId%></td>
                    <td width="150"><%=title%></td>
                    <td width="150"><%=author%></td>
                    <td width="150"><%=publisher%></td>
                    <td width="100"><%=price%>원</td>
                    <td width="100"><%=reference%></td>
                    <td width="100"><a href="searchCopy.jsp">책 정보보기</a></td>
                </tr><%
                        }

                    }

                    session.setAttribute("bookId", bookIdd);
                    if (b == false) {
                %><script type="text/javascript">
                    alert("일치하는책의 졍보가 없습니다");
                    history.back();
                </script><%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();

                    }
                %>

            </table>
        </div>
    <footer>
        <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
            Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
    </footer>
</body>
</html>