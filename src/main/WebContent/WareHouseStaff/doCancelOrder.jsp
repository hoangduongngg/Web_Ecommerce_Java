<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String cancelDate = (String) request.getParameter("timeCancel");
		Date dobDate = new SimpleDateFormat("yyyy-MM-dd").parse(cancelDate);
		java.sql.Date cancelDate_sql = new java.sql.Date(dobDate.getTime());
		
	String reasonCancel = request.getParameter("reasonCancel");
	
	int orderID = Integer.parseInt( (String) request.getParameter("orderID"));
	OrderDAO orderDAO = new OrderDAO();
	Order order = (Order) orderDAO.getOrderByID(orderID);
	
	order.setStatusDelivery("cancel");
	order.setReasonCancel(reasonCancel);
	order.setCancelDate(cancelDate_sql);
	
	orderDAO.cancelOrder(order);
	session.setAttribute("order", order);
	
	
	response.sendRedirect("CancelOrder.jsp");
	
%>