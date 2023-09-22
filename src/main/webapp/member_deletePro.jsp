<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*"%>
<%@ include file="DBconnection.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String id=null;

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String info_id = request.getParameter("id");
	
	try{
		//String id = request.getParameter("id");
	
		String sql = "select id from membership where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,info_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String risbn = rs.getString("id");
				
			if(info_id.equals(risbn)){
				sql = "delete from membership where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,info_id);
				pstmt.executeUpdate();
			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 페이지</title>
</head>
<body align="center">
    회원 정보가 삭제되었습니다.
    
    <%
		    } else {
		        out.println("회원 번호가 틀렸습니다.");
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
<input type="button" value="회원 리스트로 돌아가기" onclick="location.href='books_member_list.jsp'">
</body>
</html>