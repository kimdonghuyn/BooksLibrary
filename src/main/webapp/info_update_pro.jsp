<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 처리 페이지</title>
</head>
<link rel="stylesheet" href="library.css">
<body align = "center">
	<% request.setCharacterEncoding("UTF-8");%>
	<%
    String isbn = request.getParameter("isbn");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    int price = Integer.parseInt(request.getParameter("price"));
    String category = request.getParameter("category");
    String description = request.getParameter("description");

    ResultSet rs = null;
    String str = "";

    try {
    	 if (!isbn.equals(null)) { // isbn 값이 널이 아닐때!
         	String sql = "update books_info set title=?, author=?, publisher=?, price=?, category=?, description=? where isbn = ?";

            PreparedStatement pstmtUpdate = conn.prepareStatement(sql);
            pstmtUpdate.setString(1, title);
            pstmtUpdate.setString(2, author);
            pstmtUpdate.setString(3, publisher);
            pstmtUpdate.setInt(4, price);
            pstmtUpdate.setString(5, category);
            pstmtUpdate.setString(6, description);
            pstmtUpdate.setString(7, isbn);
             
            pstmtUpdate.executeUpdate();
            str = "도서 정보가 수정되었습니다.";
         } else {
             out.println("도서 정보가 없습니다.");
         }
    } catch (Exception e) {
    	out.println(e.getMessage());
        e.printStackTrace();
        str = "도서 정보 수정에 실패하였습니다.";
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

	<%=str %>
	<br><br>
	<button type="button" value = "메인" onclick="location.href='information.jsp'" class="btn">메인으로</button>&nbsp;&nbsp;
	
</body>
</html>