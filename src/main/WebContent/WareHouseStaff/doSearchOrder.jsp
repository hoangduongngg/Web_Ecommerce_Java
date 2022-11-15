<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page import="model.Member"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    int orderID = Integer.parseInt(request.getParameter("orderID"));
    String customer_Username = request.getParameter("customer_Username");
    
    MemberDAO memberDAO = new MemberDAO();
    Member mb = memberDAO.getMemberByUsername(customer_Username);
    CustomerDAO customerDAO = new CustomerDAO();
    Customer customer = customerDAO.getCustomerByID(mb);
    
    Order order = new Order();
    order.setId(orderID);
    order.setCustomer(customer);
    
    OrderDAO orderDAO = new OrderDAO();
	List <Order> listO = orderDAO.getListOrderByOrder(order);
	

	session.setAttribute("order", order);
	session.setAttribute("customer", customer);
	session.setAttribute("listO", listO);
    
	response.sendRedirect("ListOrder.jsp");
    
    %>