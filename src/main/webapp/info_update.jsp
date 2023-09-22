<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 페이지</title>
</head>
<link rel="stylesheet" href="library.css">
<body align="center">
    <div class="container">
        <h2>Update book information</h2>
        <form align="center" action="info_update2.jsp" method="post">
            <table align="center" width="800" border="1">
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
                <tr align="center">
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
            수정할 도서 ISBN : <input type="text" name="isbn" class="input-field">
            <br><br>
            <input type="submit" value="수정하기" class="btn">
            <input type="reset" value="수정취소" class="btn">
            <input type="button" value="메인으로" onclick="location.href='information.jsp'" class="btn">
        </form>
    </div>
</body>
</html>