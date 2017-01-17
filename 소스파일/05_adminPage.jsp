<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>단국대학교도서관 관리자페이지</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            .lg{
                padding-right:20px;
                font-weight: bold;
                text-align: right;
                color:#f15441;
            }
            nav{
                background-color: #bfa67d;
                padding-left:20px; padding-top:5px; padding-bottom: 5px;
            }
            nav ul{
                text-align:  center;
            }
            nav ul li{
                display:inline;
                width: 150px;
                background-color: #bfa67d;
                padding-left:20px; padding-top:5px; padding-bottom: 5px;
            }
            nav ul li a{
                text-decoration: none;
                color:white;
                font-size: 20px;
            }
            section{
                background-color: white;
                height: 600px;
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
            if (id == null) {
                response.sendRedirect("sessionForm.jsp");
            }
        %>
        <p class="lg">
            <%=id%>님 환영합니다!
            <a href="01_Menu.jsp">HOME</a>
        </p>        
        <nav>
            <ul>
                <li>
                    <a href="02_showLevel.jsp">등급정보</a>
                </li>
                <li>
                    <a href="06_registerBookView.html">도서등록</a>
                </li>
            </ul>
        </nav>
        <section>
            main
        </section>
        <footer>
            <h5>죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116<br> 
                Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</h5>
        </footer>
    </body>
</html>
