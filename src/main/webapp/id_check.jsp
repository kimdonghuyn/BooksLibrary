<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null; //아이디 널값인지 물어보는거
	
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}else{
		out.println("<script>");
		out.println("location.href='index.jsp");
		out.println("</script>");
	}
%>