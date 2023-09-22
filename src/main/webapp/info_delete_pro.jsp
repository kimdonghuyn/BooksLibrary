<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
    
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String isbn = request.getParameter("isbn");
	
		String sql = "select isbn from books_info where isbn = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,isbn);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String risbn = rs.getString("isbn");
				
			if(isbn.equals(risbn)){
				sql = "delete from books_info where isbn = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,isbn);
				pstmt.executeUpdate();
			%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 정보 삭제 페이지</title>
</head>
<link rel="stylesheet" href="library.css">
<body align="center">
    도서 정보가 삭제되었습니다.
    <%
    } else {
        out.println("도서 번호가 틀렸습니다.");
    }
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null)
        try {
            rs.close();
        } catch (SQLException sqle) {
        }
    if (pstmt != null)
        try {
            pstmt.close();
        } catch (SQLException sqle) {
        }
    if (conn != null)
        try {
            conn.close();
        } catch (SQLException sqle) {
        }
}
%>
<input type="button" value="메인으로" onclick="location.href='information.jsp'" class="btn">
</body>
</html>