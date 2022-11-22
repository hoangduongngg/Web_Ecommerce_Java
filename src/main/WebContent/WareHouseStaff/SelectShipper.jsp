<%@page import="model.Shipper"%>
<%@page import="model.Customer"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.WareHouseStaff"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Order</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="../asset/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%
 		WareHouseStaff warehousestaff = (WareHouseStaff) session.getAttribute("warehousestaff");
 		if (warehousestaff == null) {
		response.sendRedirect("../");
 		}
		if (session.getAttribute("list_Shipper") != null) {
			List <Shipper> list_Shipper = (List <Shipper>) session.getAttribute("list_Shipper");
			request.setAttribute("list_Shipper", list_Shipper);
		}
		if (request.getParameter("orderID") != null) {
			int orderID = Integer.parseInt((String) request.getParameter("orderID"));
			OrderDAO orderDAO = new OrderDAO();
			Order order = orderDAO.getOrderByID(orderID);
			
			session.setAttribute("order", order);
		}
		
		
		
		
 	%>
 <jsp:include page="../navbar.jsp" />  
 <p></p> 
	<h1 class = "pb-5">List Order</h1>
	
		<div class="container">
		
		<!-- Search Shipper -->
		<div> 
		<form action="doSearchShipper.jsp" method="post" class="form-inline my-2 my-lg-0">
<%--             <input  name="shipperID" type="text" placeholder="Shipper ID..." class="form-control-sm" value = "${shipperSearch.id }">       
 --%>            <input  name="shipperName" type="text" placeholder="Shipper name..." class="form-control-sm" value = "${shipperSearch.name }">     
			<div class="input-group-append">
                                <button type="submit" class="btn btn-dark btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
             </div>      
        </form>
		</div>

		
		<!-- Shipper -->
		<div>
			<table class="table">
			  <tbody>
			    <tr class="table-active">
			      <th scope="row">ID</th>
			      <td>Username</td>
			      <td colspan="2" class="table-active">Name</td>
			      <td>Tel</td>
			      <td> </td>
			    </tr>
			    
			    <c:forEach items="${list_Shipper}" var = "shipper">	
			    <tr>
			      <th scope="row"> ${shipper.id }</th>
			      <td> ${shipper.username} </td>
			      <td colspan="2"> ${shipper.name}</td>
			      <td> ${shipper.tel}</td>

			      <td><a href="doSelectShipper.jsp?shipperID=${shipper.id}">Select</a></td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		
		
		<!-- EndOrderList -->
        </div> 
		
</body>
</html>