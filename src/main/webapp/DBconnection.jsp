<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연동 테스트</title>
</head>
<script type="text/javascript">

	function selectMethod(){
		location.href = "info_list.jsp";
	}// 조회
	function updateMethod(){
		location.href = "info_update.jsp";
	}// 수정
	
	function deleteMethod(){
		location.href = "info_delete.jsp";
	}// 삭제
	
</script>
<body>
	
	<%
	Connection conn = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/sejindb?serverTimezone=UTC&useSSL=false";
		String dbId = "sejin1";
		String dbPass = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		//out.println("DB에 제대로 연결되었습니다.");

	} catch (Exception e) {
		e.printStackTrace();
		out.println("DB 연결에 문제가 발생했습니다.");
	}
	%>
	<!-- 
	<p>
        <button type="button" value = "조회" onclick='selectMethod()'>도서 정보 조회</button>&nbsp;&nbsp;
        <button type="button" value = "수정"  onclick='updateMethod()'>도서 정보 수정</button>&nbsp;&nbsp;
        <button type="button" value = "삭제" onclick='deleteMethod()'>도서 정보 삭제</button>&nbsp;&nbsp;
    </p>
	-->
</body>
</html>