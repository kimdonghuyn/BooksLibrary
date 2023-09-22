<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*"%>
<%@ include file="DBconnection.jsp"%>
<%
	String id = null; // id를 null로 초기화
	
	if((session.getAttribute("id") == null) || 
	(!((String)session.getAttribute("id")).equals("master"))){
		//세션에서 가져온 id 속성값이 null 이거나
		//세션에서 가져온 id 속성값이 master가 아니면
		
		out.println("<script>");
		out.println("location.href='index.jsp'");
		out.println("</script>");
		
	}
	
	String info_id = request.getParameter("id");
	if(info_id != null){
		id = info_id;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		pstmt = conn.prepareStatement("select * from membership where id =?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
		
	}catch(Exception e){
		e.printStackTrace();
	}




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align=center>
	<form name="updateform" action="member_updatePro.jsp" method="post">
	<table border=1 align="center">
		<tr align=center>
			<td>아이디</td>
			<td><input type="text" id="id" name="id" value="<%= rs.getString("id") %>"></td>
		</tr>
		<tr align=center>
			<td>비밀번호</td>
			<td><input type="text" id="password" name="passwd" value="<%= rs.getString("password") %>"></td>
		</tr>
		<tr align=center>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="<%= rs.getString("name") %>"></td>
		</tr>
		<tr align=center>
			<td>나이</td>
			<td><input type="text" id="age" name="age" value="<%= rs.getString("age") %>"></td>
		</tr>
		<tr align=center>
			<td>성별</td>
			<td><input type="text" id="gender" name="gender" value="<%= rs.getString("gender") %>"></td>
		</tr>
		<tr align=center>
			<td>이메일 주소</td>
			<td><input type="text" id="email" name="email" value="<%= rs.getString("email") %>"></td>
		</tr>
	</table>
	<br>
	<input type="button" value="리스트로 돌아가기" onclick="location.href='books_member_list.jsp'" class="btn">
	<input type="hidden" name = "id" value= "<%= rs.getString("id") %>">
	<input type="submit" value="수정하기" class="btn">
	</form>
</body>
</html>