<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ include file="DBconnection.jsp"%>
<%
	String id = null; //id null로 초기화..
	if ((session.getAttribute("id")==null) ||
			(!((String)session.getAttribute("id")).equals("master"))) {
				// 세션에서 id 속성을 가져와서 master가 아니거나 id 속성이 없는 경우, 로그인 폼으로 이동시킴.
				out.println("<script>");
				out.println("location.href='loginForm.jsp'");
				out.println("</script>");
			}
			
			// HTTP 요청 파라미터 중 "id"에 해당하는 값을 가져오기 위해 사용되는 변수
			String info_id = request.getParameter("id");
			
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				
				pstmt=conn.prepareStatement("SELECT * FROM membership WHERE id=?");
				pstmt.setString(1,info_id);
				rs=pstmt.executeQuery();
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
	<form action="member_deletePro.jsp" method = "post">
	<table border=1 width=300 align="center">
		<tr align=center>
			<td>아이디</td>
			<td><%=rs.getString("id") %></td>
		</tr>
		<tr align=center>
			<td>비밀번호</td>
			<td><%=rs.getString("password") %></td>
		</tr>
		<tr align=center>
			<td>이름</td>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr align=center>
			<td>나이</td>
			<td><%=rs.getString("age") %></td>
		</tr>
		<tr align=center>
			<td>성별</td>
			<td><%=rs.getString("gender") %></td>
		</tr>
		<tr align=center>
			<td>이메일 주소</td>
			<td><%=rs.getString("email") %></td>
		</tr>
	</table>
	<br>
	<input type="button" value="리스트로 돌아가기" onclick="location.href='books_member_list.jsp'" class="btn">
	<input type="hidden" name = "id" value= "<%= rs.getString("id") %>">
	<input type="submit" value="삭제하기" class="btn">
	</form>
	
</body>
</html>