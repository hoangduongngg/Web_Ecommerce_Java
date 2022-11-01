<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%
   
   String txtSearch = request.getParameter("txtSearch");     //Noi dung nhap vao
   ProductDAO productDAO = new ProductDAO();
   List <Product> listP = productDAO.getProductbyName(txtSearch);
   
   request.setAttribute("listP", listP);
	request.getRequestDispatcher("CustomerHome.jsp").forward(request, response);
   
   %>