<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%
   	int id = Integer.parseInt(request.getParameter("ProductID"));
	ProductDAO productDAO = new ProductDAO();
	Product p = productDAO.getProductbyID(id);
   
	
	response.sendRedirect("Order.jsp");
   
   %>