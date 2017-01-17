<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>등급정보 표시 </title>
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
            }
            td{
                border-bottom: black solid 1px;
                border-right: black solid 1px;
            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="t">DKU | 단국대학교</h1>
        <h3 class="red">도서대출</h3>
        <p>
            우리 도서관의 모든 자료실은 개가제 방식으로 운영되므로 이용자가 목록검색 후에 자료를 찾아 대출실에서 대출하며 그 방법은 다음과 같다.
        </p>
        <ul>
            <li>신분별 대출 가능 책수 및 대출 가능 권수</li><br>
            <table>
                <thead>
                    <tr>
                        <td width="100">등급 이름</td>
                        <td width="150">대출 가능 권수</td>
                        <td width="150">대출 가능 일자 </td>
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

                        String sql = "select * from level";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String name = rs.getString("name");
                            int num = rs.getInt("possirentnum");
                            int period = rs.getInt("possiperiod");

                %>
                <tr>
                    <td width="100"><%=name%></td>
                    <td width="150"><%=num%></td>
                    <td width="150"><%=period%></td>
                </tr>
                <% }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </ul>
    <footer>
        <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
            Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
    </footer>
</body>
</html>