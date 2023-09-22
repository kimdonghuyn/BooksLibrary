<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 페이지2</title>
</head>
<link rel="stylesheet" href="library.css">
<body align="center">
    <div class="container">
        <% 
        String isbn = request.getParameter("isbn");
        String title = "";
        String author = "";
        String publisher = "";
        int price = 0;
        String category = "";
        String description = "";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "select * from books_info where isbn = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, isbn);
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
        <form action="info_update_pro.jsp" method="post">
            <h3>ISBN 번호 : <%= isbn %>의 도서 정보를 수정합니다.</h3>
            <input type="hidden" id="isbn" name="isbn" value="<%= isbn %>">
            
            <div class="label-input">
                <label for="title" class="label">제목 :</label>
                <input type="text" id="title" name="title" value="<%= title %>" class="input-field">
            </div>
            
            <div class="label-input">
                <label for="author" class="label">저자 :</label>
                <input type="text" id="author" name="author" value="<%= author %>" class="input-field">
            </div>
            
            <div class="label-input">
                <label for="publisher" class="label">출판사 :</label>
                <input type="text" id="publisher" name="publisher" value="<%= publisher %>" class="input-field">
            </div>
            
            <div class="label-input">
                <label for="price" class="label">가격 :</label>
                <input type="text" id="price" name="price" value="<%= price %>" class="input-field">
            </div>
            
            <div class="label-input">
                <label for="category" class="label">카테고리 :</label>
                <input type="text" id="category" name="category" value="<%= category %>" class="input-field">
            </div>
            
            <div class="label-input">
                <label for="description" class="label">책 설명 :</label>
                <input type="text" id="description" name="description" value="<%= description %>" class="input-field">
            </div>
            
            <br>
            <input type="submit" value="수정하기" class="btn">
            <input type="button" value="뒤로가기" onclick="location.href='info_update.jsp'" class="btn">
        </form>
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
    </div>
</body>
</html>