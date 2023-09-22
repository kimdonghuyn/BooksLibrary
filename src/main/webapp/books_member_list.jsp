<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ include file="DBconnection.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = null;
	
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("master"))) {
		// 로그인 하지 않았거나, 관리자가 아니면
		out.println("<script>");
		out.println("location.href='loginForm.jsp'"); // 로그인 폼으로 보냄
		out.println("</script>");
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		pstmt = conn.prepareStatement("SELECT * FROM membership");
		rs = pstmt.executeQuery();
		
	} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align=center>
	<div class="container">
	<table border="1" align="center">
		<h4>회원 목록</h4>
		<%while(rs.next()){%>
		<tr align=center>
			<td><a href="books_member_list.jsp?id=<%=rs.getString("id") %>">
			<%=rs.getString("id") %></a></td>
			<td><a href="member_updateForm.jsp?id=<%=rs.getString("id") %>">수정</a></td>
			<td>
			<%if(rs.getString("id").equals("master")){ //id가 master라면%>
			관리자
			<%}else{ %>
			<a href="member_deleteForm.jsp?id=<%=rs.getString("id") %>">삭제</a></td>
			<%} %>
		</tr>
		<%} %>
	</table>
	<br>
	<a href="books_loginMain.jsp">뒤로 돌아가기</a>
	</div>
</body>
</html>