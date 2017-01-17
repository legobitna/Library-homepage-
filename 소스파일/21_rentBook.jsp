<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%
    //Scriptlet

    // 파라메터 부(한글 인코딩 필요 없음)
    String uid = request.getParameter("insert");
    String cid2 = request.getParameter("copyid");
    int cid = Integer.parseInt(cid2);
    // 데이터베이스 부
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = null;
    ResultSet rs = null;
    PreparedStatement pstmt2 = null;
    String sql2 = null;
    ResultSet rs2 = null;
    int cnt = 0;// insert 문 수행결과
    PreparedStatement pstmt3 = null;
    String sql3 = null;
    ResultSet rs3 = null;
    PreparedStatement pstmt4 = null;
    String sql4 = null;
    ResultSet rs4 = null;
    PreparedStatement pstmt5 = null;
    String sql5 = null;
    ResultSet rs5 = null;
    int cnt2 = 0;
    int cnt3 = 0;
    String sql6 = null;
    ResultSet rs6 = null;
    PreparedStatement pstmt6 = null;

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        String dbId = "root";
        String dbPass = "1234";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        sql = "select * from UserInfo where id=?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uid);

        rs = pstmt.executeQuery();

        String id;
        int userid;
        int rentnum;
        int levelid;
        int copyid;

        if (rs.next()) {
            userid = rs.getInt("userID");
            id = rs.getString("id");
            rentnum = rs.getInt("rentNum");
            levelid = rs.getInt("levelID");

            sql = "select copyid, rent from copy where copyid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cid);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                copyid = rs.getInt("copyid");
                boolean rent = rs.getBoolean("rent");

                sql = "select levelID,possirentnum,possiPeriod from level where levelID=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, levelid);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    int possiperiod = rs.getInt("possiPeriod");
                    int possirentnum = rs.getInt("possirentnum");

                    if (possirentnum == rentnum) {
%>
<script type="text/javascript">
    alert("대출 가능권수를 초과했습니다. ");
</script>
<%
} else {
    sql = "update copy set rent=true where copyid='" + cid + "'";//책 rent 업데이트
    pstmt = conn.prepareStatement(sql);
    cnt = pstmt.executeUpdate(sql);

    sql = "update UserINFO set rentnum=rentnum+1 where id='" + uid + "'";//사용자 테이블 rentnum ++
    pstmt = conn.prepareStatement(sql);
    cnt = pstmt.executeUpdate(sql);

    sql = "insert into Lend(userID,copyId,dueDate,returnDate) values('" + userid + "','" + Integer.valueOf(cid) + "',DATE_ADD(now(),INTERVAL '" + possiperiod + "' DAY),Null)";//lend 테이블 업데이트 
    pstmt = conn.prepareStatement(sql);
    cnt = pstmt.executeUpdate(sql);

%>
<script type="text/javascript">
    alert("대출이 완료되었습니다  ");
    location.href = "01_Menu.jsp";
</script>
<%                                        }

    }

} else {
%>
<script type="text/javascript">
    alert("일치하는 책 정보가 없습니다 다시입력해주세요  ");
    location.href = "20_rentBookView.jsp";
</script>
<%
    }

} else {
%>
<script type="text/javascript">
    alert("일치하는 아이디가 없습니다 다시입력해주세요  ");
    location.href = "20_rentBookView.jsp";
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        //rs!=null : 기억장소가 확보되어 있다는 뜻
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ex) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }
%>