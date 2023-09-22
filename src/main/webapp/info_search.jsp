<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconnection.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 검색 페이지</title>
</head>
<link rel="stylesheet" href="library.css">
<body align = "center">
	<div class="container">
        <h2>Book Information List Search</h2>
        <form action="info_search.jsp" method="post">
            <table>
                <tr class="table-header">
                    <td>ISBN</td>
                    <td>Title</td>
                    <td>Author</td>
                    <td>Publisher</td>
                    <td>Price</td>
                    <td>Category</td>
                    <td>Description</td>
                </tr>
			<%
        
            String select = request.getParameter("select");
        	String search = request.getParameter("search");
        	
        	PreparedStatement pstmt = null;
        	ResultSet rs = null;
            String str = "";
            String sql = "";
            
            try {
        		switch(select) {
        		case "Title":
        			sql = "select * from books_info where title like ?";
        			pstmt = conn.prepareStatement(sql);
        			pstmt.setString(1, "%" + search + "%");
        			rs = pstmt.executeQuery(); 
        			break;
        		case "Category":
        			sql =  "select * from books_info where category like ?";
        			pstmt = conn.prepareStatement(sql);
        			pstmt.setString(1, "%" + search + "%");
        			rs = pstmt.executeQuery();
        			break;
        		case "Publisher":
        			sql =  "select * from books_info where publisher like ?";
        			pstmt = conn.prepareStatement(sql);
        			pstmt.setString(1, "%" + search + "%");
        			rs = pstmt.executeQuery();
        			break;
        		}
        		while(rs.next()) {
        			String isbn = rs.getString("isbn");
        			String title = rs.getString("title");
        			String author = rs.getString("author");
        			String publisher = rs.getString("publisher");
        			int price = Integer.parseInt(rs.getString("price"));
        			String category = rs.getString("category");
        			String description = rs.getString("description");
       		 %>
	         <tr align = "center">
	            <td><%=isbn%></td>
	            <td><%=title%></td>
	            <td><%=author%></td>
	            <td><%=publisher%></td>
	            <td><%=price%></td>
	            <td><%=category%></td>
	            <td><%=description%></td>
	        </tr>
	        <%
			} 
			}catch (Exception e) {
				str = "데이터 조회에 실패했습니다.";
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
			%>
		</table>
            <%= str %>
            <p>
            <input type="button" value="List All" onclick="location.href='info_list.jsp'" class="btn">
        </form>
        <br>
        <input type="button" value="메인으로" onclick="location.href='information.jsp'" class="btn">
    </div>
</body>
</html>