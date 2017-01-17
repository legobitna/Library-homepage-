<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>단국대학교도서관(Menu)</title>
        <style type="text/css">
            body{
                background-color : #e7eaef;
            }
            h1.t{
                margin-top: 0px;margin-left: 0px;
                padding-left: 10px;padding-top: 10px;padding-bottom: 10px;
                background-color: #105ea6;
                color:white;
            }
            header{
                text-align: center;
            }
            footer{
                margin-top: 0px;
                font-weight: normal;
                text-align: center;
                padding-top: 525px;
            }
            nav ul{
                padding-top:10px;
                text-align: center;
            }
            nav ul li{
                display:inline;
                border-left:1px solid;
                font: bold 12px Dotum;
                padding: 0 10px;

            }
        </style>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="t"> DKU | 단국대학교 </h1>
        <header>
        <h1> 단국대학교도서관에 오신것을 환영합니다. </h1>
        </header>
        <nav>
            <ul>
                <li>
                     <a href="02_showLevel.jsp">등급 정보</a>
                </li>
                <li>
                     <a href="03_loginView.html">로그인하기</a>
                </li>
                <li>
                     <a href="20_rentBookView.jsp">대출하기</a>
                </li>
                <li>
                     <a href="22_returnBookView.jsp">반납하기</a>
                </li>
            </ul>
        </nav>
         <footer>
            <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
                Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
        </footer>
    </body>
</html>