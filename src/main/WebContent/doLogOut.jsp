<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	session.setAttribute("member", null);
	session.setAttribute("customer", null);
	
	response.sendRedirect("index.jsp");
%>