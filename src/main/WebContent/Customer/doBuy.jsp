<%@page import="model.Customer"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 
	Customer customer = (Customer) session.getAttribute("customer");	
	OrderDAO orderDAO = new OrderDAO();
	Order order = orderDAO.getCartByCustomer(customer);
	if (order != null) {
		
		long millis = System.currentTimeMillis();  
	    java.sql.Date orderDate = new java.sql.Date(millis);  
System.out.println("Order thanh cong luc: " + orderDate);

		order.setStatusOrder("order");
		order.setOrderDate(orderDate);
		orderDAO.updateOrder(order);
System.out.println(order);
		session.setAttribute("order", order);
		response.sendRedirect("CheckoutPayment.jsp");
	}
	
	else {
		request.setAttribute("mess", "empty");
		response.sendRedirect("Order.jsp");
	}
	
	
%>