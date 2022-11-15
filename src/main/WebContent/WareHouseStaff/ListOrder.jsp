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
		
		if (session.getAttribute("listO") != null) {
			Order order = (Order) session.getAttribute("order");
			Customer customer = order.getCustomer();
			/* List <Order> listO = (List )session.getAttribute("listO"); */
			OrderDAO orderDAO = new OrderDAO();
			List <Order> listO = orderDAO.getListOrderByOrder(order);
			request.setAttribute("listO",listO );
		}
		
	}
 	%>
 <jsp:include page="../navbar.jsp" />  
 <p></p> 
	<h1 class = "pb-5">List Order</h1>
	
		<div class="container">
		
		<!-- Search and Cart -->
		<div> 
		<form action="doSearchOrder.jsp" method="post" class="form-inline my-2 my-lg-0">
            <input  name="orderID" type="text" placeholder="Order ID..." class="form-control-sm" value = "${order.id }">       
            <input  name="customer_Username" type="text" placeholder="Customer username..." class="form-control-sm" value = "${order.customer.username }">     
			<div class="input-group-append">
                                <button type="submit" class="btn btn-dark btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
             </div> 
             
			<div class="container overflow-hidden">
			  <div class="row gx-5">
			    <div class="col-3">
			     <div class="p-3 border bg-light">
					     	<p>Order Status: </p>
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    Cart
						  </label>
						</div>
						
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    Order
						  </label>
						</div>
						
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    Waiting for Payment
						  </label>
						</div>
						
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    Bill
						  </label>
						</div>
			     </div>
			    </div>
			    <div class="col-3">
			      <div class="p-3 border bg-light">
				      <p> Delivery Status: </p>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    Preparing
					  </label>
					</div>
					
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    Delivering
					  </label>
					</div>
					
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    Delivered
					  </label>
					</div>
				
				
			      </div>
			    </div>
			  </div>
			</div>
			<div>
				
			</div>
			
			<div>
				
			</div>
			
			

                       
        </form>
		</div>
		
		
		
		
		
		
		<!-- Order -->
		<div>
			<table class="table">
			  <tbody>
			    <tr class="table-active">
			      <th scope="row">ID Order</th>
			      <td colspan="2" class="table-active">Customer</td>
			      <td>Order status</td>
			      <td>Delivery status</td>
			      <td>Order Date</td>
			      <td>Payment Date</td>
			      <td>Total</td>
			      <td> </td>
			    </tr>
			    
			    <c:forEach items="${listO}" var = "o">	
			    <tr>
			      <th scope="row"> ${o.id }</th>
			      <td colspan="2"> ${o.customer.name}</td>
			      <td>${o.statusOrder} </td>
			      <td> ${o.statusDelivery}</td>
			      <td> ${o.orderDate}</td>
			      <td> ${o.paymentDate}</td>
			      <td> ${o.totalAmount}</td>
			      <td><a href="OrderDetail.jsp?OrderID=${o.id}">Detail</a></td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
		
		
		<!-- EndOrderList -->
        </div> 
		
</body>
</html>