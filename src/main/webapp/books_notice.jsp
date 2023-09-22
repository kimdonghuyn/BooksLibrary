<%@page import="com.mysql.cj.conf.IntegerProperty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.BoardPage" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ include file="DBconnection.jsp" %>
<%@ include file="id_check.jsp" %>

<% 	request.setCharacterEncoding("UTF-8"); %>
<% 	BoardDAO dao = new BoardDAO(application); // db 연결
	
	//사용자가 입력한 검색 조건을 MAP에 저장
	Map<String, Object> param = new HashMap<String, Object>();
	int totalCount = dao.selectCount(param); //게시물 수 확인
	
	int POSTS_PER_PAGE = 5;
    int PAGES_PER_BLOCK = 3;
    
	//페이징 시작
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount/pageSize); // 전체페이지수
	
	//현재 페이지 확인
	int pageNum = 1; //기본값
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals(""))
		pageNum = Integer.parseInt(pageTemp); // 요청 받은 페이지로 수정
		
	int startIndex = (pageNum - 1) * POSTS_PER_PAGE; // 목록에 표시할 게시글의 시작 인덱스
    int endIndex = startIndex + POSTS_PER_PAGE; // 목록에 표시할 게시글의 마지막 인덱스
		
	// 목록에 출력할 게시물 범위 계산
	int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호
	int end = pageNum * pageSize; // 마지막 게시물 번호
	param.put("start", start);
	param.put("end", end);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
</head>
<link rel="stylesheet" href="library_index.css">
<body align="center">
    <div>
        <h4>[ <%=id %> ]님으로 로그인 중 입니다.</h4>
        <h4>도서 커뮤니티</h4>
        <input style="float:right" type="button" value="글쓰기" onclick="location.href='books_notice_write.jsp'" class="btn">
        <br>
        <h4 style="float:left">목록 보기</h4><br>
        <h4>현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>)</h4>
        <form action="info_search.jsp" method="post" width="800";>
            <select name="select">
                <option>제목</option>
                <option>작성자</option>
            </select>
            <input type="search" name="search">
            <input type="submit" value="Search" class="btn">
        </form>
        <form>
            <table>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>조회수</td>
                    <td>작성일</td>
                </tr>
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String sql = "SELECT * FROM board ORDER BY created_at DESC LIMIT ?, ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, startIndex);
                        pstmt.setInt(2, POSTS_PER_PAGE);
                        rs = pstmt.executeQuery();

                        int number = 1;
                       
                        int countNum = 0;
                        while (rs.next()) {
                            int num = rs.getInt("num");
                            String title = rs.getString("title");
                            String writer = rs.getString("writer");
                            int visitcount = rs.getInt("visitcount");
                            String created_at = rs.getString("created_at");
                            
                            number = totalCount - (((pageNum-1) * pageSize) + countNum++);
                %>
                <tr>
                    <td><input type="hidden" value="<%= num %>"><%= number %></td>
                    <td><a href="notice_info.jsp?num=<%= num %>&title=<%= title %>&writer=<%= writer %>"><%= title %></a></td>
                    <td><%= writer %></td>
                    <td><%= visitcount %></td>
                    <td><%= created_at %></td>
                </tr>
                <%
                			number++; //글 번호 증가
                			
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("게시판 데이터를 가져오는데 오류가 발생했습니다.");
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
                    }
                %>
            </table>
            <br><br>
            <table>
            	<tr align = "center"><!-- 페이징 처리 부분 -->
            		<td>
            		<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
            		</td>
            	</tr>
            </table>
        </form>
        <br><br>
        <input type="button" value="뒤로가기" onclick="location.href='books_loginMain.jsp'" class="btn">
    </div>
</body>
</html>
