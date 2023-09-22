<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 리스트</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align = "center">
	<div class="container">
        <h2>도서 정보 리스트</h2>
        <table>
            <tr>
                <th>ISBN</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Price</th>
                <th>Category</th>
                <th>Description</th>
            </tr>
			<%
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        
            String isbn = "";
            String title = "";
            String author = "";
            String publisher = "";
            int price = 0;
            String category = "";
            String description = "";
            
            try {
                String sql = "select * from books_info";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                	isbn = rs.getString("isbn");
                	title = rs.getString("title");
                	author = rs.getString("author");
                	publisher = rs.getString("publisher");
                	price = Integer.parseInt(rs.getString("price"));
                	category = rs.getString("category");
                	description = rs.getString("description");
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
        
            } catch (Exception e) {
                e.printStackTrace();
        
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException sqle) {
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException sqle) {
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException sqle) {
                    }
                }
            }
        %>
		</table>
        <form action="info_search.jsp" method="post">
            <select name="select">
                <option>Title</option>
                <option>Category</option>
                <option>Publisher</option>
            </select>
            <input type="search" name="search">
            <input type="submit" value="Search" class="btn">
            <input type="button" value="List All" onclick="location.href='info_list.jsp'" class="btn">
            <br><br>
            <input type="button" value="메인으로" onclick="location.href='books_loginMain.jsp'" class="btn">
        </form>
    </div>
</body>
</html>