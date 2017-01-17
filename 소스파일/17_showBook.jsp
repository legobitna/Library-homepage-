<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>전체도서정보표시 </title>
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
                padding-top: 350px;
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
        <%
            // 세션값 가져오기 id
            // Object형에서 String으로 형변환
            String id = (String) session.getAttribute("name");
            String userId = (String) session.getAttribute("insert");
            if (id == null) {
                response.sendRedirect("sessionForm.jsp");
            }
        %>
        <div class="adjust">
            <h2>전체도서보기</h2>
            <table>
                <thead>
                    <tr>
                        <td width="200">도서제목</td>
                        <td width="150">저자</td>
                        <td width="150">출판사</td>
                        <td width="100">참고도서</td>
                    </tr>
                </thead>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                        String dbId = "root";
                        String dbPass = "1234";

                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                        String sql = "select * from book";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String title = rs.getString("title");
                            String author = rs.getString("author");
                            String publisher = rs.getString("publisher");
                            boolean ref = rs.getBoolean("reference");
                %>
                <tr>
                    <td width="100"><%=title%></td>
                    <td width="150"><%=author%></td>
                    <td width="150"><%=publisher%></td>
                    <td width="100"><%=ref%></td>
                </tr>
                <% }
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
