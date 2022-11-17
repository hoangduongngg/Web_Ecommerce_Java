<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("orderID") != null && request.getParameter("statusDelivery")!=null) {
		int orderID = Integer.parseInt( (String) request.getParameter("orderID"));
		OrderDAO orderDAO = new OrderDAO();
		Order order = (Order) orderDAO.getOrderByID(orderID);
		
		String statusDelivery = request.getParameter("statusDelivery");
		
		if (statusDelivery.equals("cancel")) {
			session.setAttribute("order", order);
			response.sendRedirect("CancelOrder.jsp");
		}
		else {
		order.setStatusDelivery(statusDelivery);
		orderDAO.updateOrder(order);
		session.setAttribute("order", order);
 		request.setAttribute("mess", "success");
		response.sendRedirect("UpdateStatusDelivery.jsp");
		}
	}
	else {
		response.sendRedirect("WareHouseStaffHome.jsp");
	}

%>