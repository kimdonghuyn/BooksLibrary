<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file = "DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 입력 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align = "center">
	 <div class="container">
        <h2>도서 정보 추가하기</h2>
        <form action="info_act.jsp" method="post">
            <br>
            <div class="label-input">
                <label for="isbn" class="label">ISBN :</label>
                <input type="text" id="isbn" name="isbn" class="input-field">
            </div>

            <div class="label-input">
                <label for="title" class="label">Title :</label>
                <input type="text" id="title" name="title" class="input-field">
            </div>

            <div class="label-input">
                <label for="author" class="label">Author :</label>
                <input type="text" id="author" name="author" class="input-field">
            </div>

            <div class="label-input">
                <label for="publisher" class="label">Publisher :</label>
                <input type="text" id="publisher" name="publisher" class="input-field">
            </div>

            <div class="label-input">
                <label for="price" class="label">Price :</label>
                <input type="text" id="price" name="price" class="input-field">
            </div>

            <div class="label-input">
                <label for="category" class="label">Category :</label>
                <input type="text" id="category" name="category" class="input-field">
            </div>

            <div class="label-input">
                <label for="description" class="label">Description :</label>
                <input type="text" id="description" name="description" class="input-field">
            </div>

            <div class="btn-group">
                <br>
                <input type="submit" value="도서 정보 전송" class="btn">
                <input type="reset" value="정보 작성 취소" class="btn">
               	<br><br>
                <input type="button" value="도서 LIST" onclick="location.href='info_list.jsp'" class="btn">
                <input type="button" value="뒤로가기" onclick="location.href='books_loginMain.jsp'" class="btn">
             	<!-- 
                <input type="button" value="도서 커뮤니티" onclick="location.href='info_comuiti.jsp'" class="btn">
                <input type="button" value="도서 정보 수정" onclick="location.href='info_update.jsp'" class="btn">
                <input type="button" value="도서 정보 삭제" onclick="location.href='info_delete.jsp'" class="btn">
           		-->
            </div>
        </form>
    </div>
</body>
</html>