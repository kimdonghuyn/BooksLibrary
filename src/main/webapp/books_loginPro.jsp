<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
			pstmt = conn.prepareStatement("select * from membership where id =?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(passwd.equals(rs.getString("password"))){
					session.setAttribute("id",id); // 일치하면 세션에 id 저장
					
					out.println("<script>");
					out.println("location.href='books_loginMain.jsp'"); // 로그인 된 상태로 이동
					out.println("</script>");
				}
			}
				out.println("<script>");
				out.println("location.href='index.jsp'"); // 로그인 실패했으니 다시 로그인 페이지로 이동
				out.println("</script>");
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>