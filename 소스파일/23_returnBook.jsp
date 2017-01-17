<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>책 반납하기</title>
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
        <h1 class="t">DKU | 단국대학교</h1>
        <%
        	int cnt=0;
            String bookid2 = request.getParameter("bookID");
            String id=request.getParameter("userId");
            int bookid=Integer.parseInt(bookid2);
            
         
           
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            
                String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
                String dbId = "root";
                String dbPass = "1234";

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                String sql="select * from userinfo where id=?";//사용자 id확인
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,id);
                rs=pstmt.executeQuery();
                if(rs.next()){
                	sql="select * from copy where copyid=?";//책 id 확인
                	  pstmt = conn.prepareStatement(sql);
                      pstmt.setInt(1,bookid);
                      rs=pstmt.executeQuery();
                      if(rs.next()){
                    	 sql="update copy set rent=false where copyid='"+bookid+"'";//책 rent 업데이트
                       	pstmt = conn.prepareStatement(sql);
                          cnt= pstmt.executeUpdate(sql);
                          
                          sql="update UserINFO set rentnum=rentnum-1 where id='" + id + "'";//사용자 테이블 rentnum ++
                          pstmt = conn.prepareStatement(sql);
                          cnt= pstmt.executeUpdate(sql);
                          
                          sql="update lend set returnDate=now() where copyid='"+bookid+"'";//반납일을 보여줌 
                          
                          pstmt = conn.prepareStatement(sql);
                          cnt= pstmt.executeUpdate(sql);
                          %>
                			<script type="text/javascript">
                    		alert("반납이 완료되었습니다.  ");
                    		location.href = "01_Menu.jsp";
                			</script>
                			<%
                      }
                      else{
                    	  %>
              			<script type="text/javascript">
                  		alert("일치하는 책이 없습니다. 다시입력해주세요  ");
                  		location.href = "22_returnBookView.jsp";
              			</script>
              			<%
                      }
                }
                else{
                	%>
        			<script type="text/javascript">
            		alert("일치하는 아이디가 없습니다 다시입력해주세요  ");
            		location.href = "22_returnBookView.jsp";
        			</script>
        			<%
                }
                
            
            
                

                %>
    </body>
</html>