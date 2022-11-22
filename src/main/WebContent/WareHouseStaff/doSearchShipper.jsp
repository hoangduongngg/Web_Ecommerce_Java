<%@page import="dao.ShipperDAO"%>
<%@page import="model.Shipper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String shipperName = "";
/* 	int shipperID = 0;
	if (request.getParameter("shipperID") != null) {
		shipperID = Integer.parseInt(request.getParameter("shipperID"));
	} */
	if (request.getParameter("shipperName") != null) {
		shipperName = request.getParameter("shipperName");
	}
	Shipper shipperSearch = new Shipper();
	shipperSearch.setName(shipperName);
	
	ShipperDAO shipperDAO = new ShipperDAO();
	List <Shipper> list_Shipper = shipperDAO.getShipperByName(shipperName);
	
	session.setAttribute("shipperSearch", shipperSearch);
	session.setAttribute("list_Shipper", list_Shipper);
	
	response.sendRedirect("SelectShipper.jsp");
%>