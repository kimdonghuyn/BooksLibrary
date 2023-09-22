<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ include file="DBconnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body>
	<div class="container">
	<% request.setCharacterEncoding("UTF-8");%>
	<%
	//String id = null;
	String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String email = request.getParameter("demail");

    ResultSet rs = null;
    String str = "";

	//String info_id = request.getParameter("id");
	
    try {
    	 if (!id.equals(null)) { // id 값이 널이 아닐때!
         	String sql = "update membership set password=?, name=?, age=?, gender=?, email=? where id = ?";

            PreparedStatement pstmtUpdate = conn.prepareStatement(sql);
            pstmtUpdate.setString(1, passwd);
            pstmtUpdate.setString(2, name);
            pstmtUpdate.setInt(3, age);
            pstmtUpdate.setString(4, gender);
            pstmtUpdate.setString(5, email);
            pstmtUpdate.setString(6, id );
             
            pstmtUpdate.executeUpdate();
            str = "님의 회원 정보가 수정되었습니다.";
         } else {
             out.println("님의 회원 정보가 없습니다.");
         }
    } catch (Exception e) {
    	out.println(e.getMessage());
        e.printStackTrace();
        str = "님의 회원 정보 수정에 실패하였습니다.";
    } finally {
        // 결과셋 및 PreparedStatement 객체 닫기
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
    }
	%>
	<%=id%>
	<%=str %>
	<br><br>
	<input type="button" value="회원 리스트로 돌아가기" onclick="location.href='books_member_list.jsp'" class="btn">
	</div>
</body>
</html>