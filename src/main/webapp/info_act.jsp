<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 정보 추가 처리 부분</title>
</head>
<link rel="stylesheet" href="library.css">
<body>
    <div class="container">
        <h2>도서 정보 추가 처리 부분</h2>
        <% request.setCharacterEncoding("UTF-8");%>
        <%
            String isbn = request.getParameter("isbn");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            int price = Integer.parseInt(request.getParameter("price"));
            String category = request.getParameter("category");
            String description = request.getParameter("description");

            PreparedStatement pstmt = null;
            String str = "";

            try {
                String sql = "INSERT INTO books_info VALUES (?,?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, isbn);
                pstmt.setString(2, title);
                pstmt.setString(3, author);
                pstmt.setString(4, publisher);
                pstmt.setInt(5, price);
                pstmt.setString(6, category);
                pstmt.setString(7, description);
                pstmt.executeUpdate();

                str = "새로운 도서 정보를 추가했습니다.";
            } catch (Exception e) {
                e.printStackTrace();
                str = "새로운 도서 정보를 추가에 실패했습니다.";
            } finally {
                if (pstmt != null)
                    try {
                        pstmt.close();
                    } catch (SQLException sqle) {
                    }
                if (conn != null)
                    try {
                        conn.close();
                    } catch (SQLException sqle) {
                    }
            }

        %>
        <%=str %><br><br>
        <p>
            <input type="button" value="도서 정보 조회" onclick="selectMethod()" class="btn">
            <input type="button" value="도서 정보 수정" onclick="updateMethod()" class="btn">
            <input type="button" value="도서 정보 삭제" onclick="deleteMethod()" class="btn">
        </p>
    </div>
</body>
</html>
