<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>레코드 추가 </title>
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
            .login {
                width:620px;
                background:#fff;
                margin: 100px auto;
                border:1px solid #e5e5e5;
                padding-bottom: 30px;
                -moz-box-shadow: rgba(200,200,200,.7) 0 4px 10px -1px;
                -webkit-box-shadow: rgba(200,200,200,.7) 0 4px 10px -1px;
                box-shadow: rgba(200,200,200,.7) 0 4px 10px -1px;
            }
            .login h1 a {
                background-image:url(images/logo.png);
                background-repeat:no-repeat;
                background-position:center top;
                background-size:189px 47px;
                height:47px;
                margin:0 auto 25px;
                padding:0;
                width:189px;
                text-indent:-9999px;
                overflow:hidden;
                display:block;
            }
            .login h1 a { width:100%;}
            .login form {
                margin:15px auto;
                border:none;						
                margin-top:15px;
                padding-left: 50px ;
                padding-top: 30px;
            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            .btn-default{
                width:90%;height:34px;padding:6px 12px 10px;margin-top: 20px;
                font-size:14px;line-height:1.42857143;
                color:#fff;background-color:#105ea6;border-color:#ccc}
            </style>
        </head>
        <body>
            <h1 class="t">DKU | 단국대학교</h1>
        <%
            int bookid = Integer.valueOf(request.getParameter("bookid"));
            String booktitle = request.getParameter("booktitle");
            String bookauthor = request.getParameter("bookauthor");
            String bookpublisher = request.getParameter("bookpublisher");
            boolean referecnebook = Boolean.valueOf(request.getParameter("referencebook"));
            int bookprice = Integer.valueOf(request.getParameter("bookprice"));

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

                String sql = "insert into Book values(?,?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, bookid);
                pstmt.setString(2, booktitle);
                pstmt.setString(3, bookauthor);
                pstmt.setString(4, bookpublisher);
                pstmt.setBoolean(5, referecnebook);
                pstmt.setInt(6, bookprice);
                pstmt.executeUpdate();
                String bookkey = String.valueOf(bookid);
                session.setAttribute("bookId", bookkey);
                str = "Book 테이블에 새로운 레코드를 추가했습니다";
            } catch (Exception e) {
                e.printStackTrace();
                str = "Book 테이블에 새로운 레코드 추가 실패";
            }


        %>
        <div class="login">
            <form method="post" action="10_registerCopyInfo.jsp">
                <%=str%><br>
                <input class="btn btn-default" type="submit" name="copy등록하기">
            </form>
        </div>

    <footer >
        <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
            Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
    </footer>
</body>
</html>