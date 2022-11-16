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
    int orderID = 0;
    String customer_Username = "";
    if (request.getParameter("orderID") != null) {
    	orderID = Integer.parseInt(request.getParameter("orderID"));
    }
    if (request.getParameter("customer_Username") != null) {
    	customer_Username = request.getParameter("customer_Username");
    }

    MemberDAO memberDAO = new MemberDAO();
    Member mb = memberDAO.getMemberByUsername(customer_Username);
    CustomerDAO customerDAO = new CustomerDAO();
    Customer customer = customerDAO.getCustomerByID(mb);
    
    System.out.println(customer);
    
    Order orderSearch = new Order();
    orderSearch.setId(orderID);
    orderSearch.setCustomer(customer);
    
    OrderDAO orderDAO = new OrderDAO();
	List <Order> listO = orderDAO.getListOrderByOrder(orderSearch);
	
	session.setAttribute("orderSearch", orderSearch);
	session.setAttribute("listO", listO);
    
	response.sendRedirect("ListOrder.jsp");
    
    %>