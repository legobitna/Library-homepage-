<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>카피정보입력</title>
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
            .form-control{
                display:block;
                width:90%;height:34px;
                padding:6px 12px;
                font-size:14px;
                line-height:1.42857143;
                color:#555;background-color:#fff;background-image:none;
                border:1px solid #ccc;border-radius:4px;
                -webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow:inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}
            .btn-default{
                width:90%;height:34px;padding:10px 12px 10px;margin-top: 20px;
                font-size:14px;line-height:1.42857143;
                color:#fff;background-color:#105ea6;border-color:#ccc}

        </style>
    </head>
    <body>
        <%
        String userId = (String) session.getAttribute("insert");

        %>
        <h1 class="t">DKU | 단국대학교</h1>
        <div class="login">
            <form class="form-horizontal"method="post" action="23_returnBook.jsp">
               
                사용자 ID:<input class="form-control" type="text" name="userId" value=<%=userId%> ><br>
                책 copy 번호:<input class="form-control" type="text" name="bookID" ><br>
               
                <input class="btn btn-default" type="submit" value="반납하기">
            </form>
        </div>
                     <footer>
            <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
                Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
        </footer>
    </body>
</html>