<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
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
                padding-top: 525px;
            }
            h3.red{
                padding-left: 10px;
                color:#f15441;
            }
            p{
                 padding-right:20px;
                font-weight: bold;
                text-align: right;
                color:#f15441;
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
            <p><a href="01_Menu.jsp">HOME</a></p>
            <h2>도서정보보기</h2>
            <table border="1">
                <tr>
                    <td width="100">카피ID</td>
                    <td width="150">구매일자</td>
                    <td width="150">대출가능 상태</td>
                    <td width="100">비고</td>
                </tr>
                <%

                    String booknum = (String) session.getAttribute("bookId");
                    int num = Integer.valueOf(booknum);

                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String b = "";
                    try {
                        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                        String dbId = "root";
                        String dbPass = "1234";
                        String bookIdd = "";
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
                       
                        String sql = "select * from Copy";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        

                        while (rs.next()) {
                            int bookid = rs.getInt("bookId");

                            if (num == bookid) {

                                int copyid = rs.getInt("copyId");
                                
                                String cid = Integer.toString(copyid);
                                session.setAttribute("copyId", cid);
                                
                                Date purchaseDate = rs.getDate("purchaseDate");
                                boolean rentstate = rs.getBoolean("rent");
                                if (rentstate == false) {
                                    b = "대출가능";
                                } else if (rentstate == true) {
                                    b = "대출 불가능";
                                }
                %><tr>
                    <td width="100"><%=copyid%></td>
                    <td width="150"><%=purchaseDate%></td>
                    <td width="150"><%=b%></td>
                    <%
                        if (rentstate == true) {
                    %><td width="100"><a href="16_reservation.jsp">예약하기</a></td><%
                        }
                        else
                        {
                     %><td width="100"> </td><%
                        }   
                    %>
                        
                </tr> <%                             }
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