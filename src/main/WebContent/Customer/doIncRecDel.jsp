<%@page import="dao.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Customer"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
 	String action = request.getParameter("action");
	Integer OrderDetailID = Integer.parseInt(request.getParameter("OrderDetailID"));
	OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
	OrderDetail od = orderDetailDAO.getOrderDetailByID(OrderDetailID);
	
	if (action != null) {
		// tang giam so luong
        if (action.equals("inc")) {
            od.setQuantity(od.getQuantity() + 1);
        } 
        else if (action.equals("rec")){
        	od.setQuantity(od.getQuantity() -1);
        }
        
		// kiem tra neu =0 thi xoa, neu khong thi update
        if (od.getQuantity() == 0 || action.equals("del")) {
        	orderDetailDAO.deleteOrderDetail(od);
        }
        else {
        	orderDetailDAO.updateQuantityOrderDetail(od);
        }
    }
	
	
	Order order = (Order) session.getAttribute("order");
	
	List<OrderDetail> list_od = orderDetailDAO.getOrderDetailByOrder(order);
	session.setAttribute("list_od", list_od);
	session.setAttribute("order", order);
	response.sendRedirect("Order.jsp");
%>