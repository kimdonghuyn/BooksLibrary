<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ include file="DBconnection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");


	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		pstmt=conn.prepareStatement("Insert into membership values (?,?,?,?,?,?)");
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setInt(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,email);
		
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
			}else{
			out.println("<script>");
			out.println("location.href='joinForm.jsp'");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 - 회원가입 처리 페이지</title>
</head>

<link rel="stylesheet" href="library_index.css">
<body align = "center">
	<div class = "container">
		<h4>[ <%=id %> ]님 반갑습니다^^</h4>
		<h4>회원가입이 성공적으로 처리되었습니다!</h4>
		<input type="button" value="로그인 화면으로 돌아가기" onclick = "location.href='index.jsp'" class="btn">
	</div>
</body>
</html>