<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 
	Order order = (Order) session.getAttribute("order");
	if (order != null) {
		
		//Set trang thai
		order.setStatusOrder("waitingforpayment");
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.updateOrder(order);
		session.setAttribute("order", order);
		
		//Taoma
		int max = 999999; 
		int min = 100000;
		String confirmCode = Integer.toString((int)(Math.random()*((max-min)+1))+min);
		System.out.println("Confirm Code: " + confirmCode);
		session.setAttribute("confirmCode", confirmCode);
		response.sendRedirect("ConfirmPayment.jsp");
	}
	else {
		
		response.sendRedirect("CheckoutPayment.jsp");
	}
%>