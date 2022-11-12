<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 
	String confirmCode = request.getParameter("confirmCode");

	if (confirmCode.equalsIgnoreCase( (String)session.getAttribute("confirmCode"))) {
		Customer customer = (Customer) session.getAttribute("customer");	
		
		Order order = (Order) session.getAttribute("order");
		if (order != null) {
			
			// Get time now
		    long millis = System.currentTimeMillis();  
		    java.sql.Date paymentDate = new java.sql.Date(millis);  
System.out.println("Payment thanh cong luc: " + paymentDate);
			
		    //Set value
		    order.setStatusOrder("bill");
			order.setStatusDelivery("preparing");
			order.setPaymentType("online");
			order.setPaymentDate(paymentDate);
			// Update
			OrderDAO orderDAO = new OrderDAO();
			orderDAO.updateOrder(order);
			session.setAttribute("order", order);
System.out.println(order);
System.out.println("Thanh cong");
			
			response.sendRedirect("CustomerHome.jsp");
		}

	}
	else {
		response.sendRedirect("ConfirmPayment.jsp?err=wrongCode");
	}
%>