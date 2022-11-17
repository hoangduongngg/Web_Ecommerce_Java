<%@page import="dao.MemberDAO"%>
<%@page import="dao.ShipperDAO"%>
<%@page import="model.Shipper"%>
<%@page import="model.WareHouseStaff"%>
<%@page import="model.PaymentCard"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.OrderDetailDAO"%>
<%@page import="model.Customer"%>
<%@page import="model.Order"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
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
<title>Web E-commerce Java</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
         <link href="../asset/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<jsp:include page="../navbar.jsp" /> 
	<h1> :</h1>

		<div class="container">
		
		<!-- Search and Cart -->
		
		<%	
			WareHouseStaff warehousestaff = (WareHouseStaff) session.getAttribute("warehousestaff");
			if (warehousestaff == null) {
				response.sendRedirect("../");
			}
 			else {
 				Order order = new Order();
				if (request.getParameter("orderID") != null) { 
					int orderID = Integer.parseInt(request.getParameter("orderID"));
					OrderDAO orderDAO = new OrderDAO();
					order = orderDAO.getOrderByID(orderID);
 				}
				else if (session.getAttribute("order") != null) {
					order = (Order) request.getAttribute("order");
				}
				
				request.setAttribute("order", order);
			}
			
		%>
		<!-- Cart -->
		<div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card">
          <div class="card-body p-4">

			<!-- Danh sach mat hang -->
            <div class="row">

              <div class="col-lg-8">
                <div class="d-flex justify-content-between align-items-center mb-4">
                  <div>
                  
 					<h3 class="my-4">Cancel Order:</h3>
 					
					
					<table class="table">
					  <tbody>

					    <tr>
					      <th scope="row"> ID </th>
					      <td colspan="2"> ${order.id }</td>
					    </tr>
					    <tr>
					    	<th scope="row"> Order status</th>
					    	<td style="color: teal"> ${order.statusOrder}</td>
					    </tr>
					    
					    <tr>
					    	<th scope="row"> Delivery status</th>
					    	<td style="color: teal"> ${order.statusDelivery}</td>
					    </tr>
					    
					    

					  </tbody>
					</table>
										    
					    <tr>
					    	<form action = "doCancelOrder.jsp?orderID=${order.id}" method="post" >
					    		<div class="form-outline mb-3">
					    		  <h6 class="mx-2" style="color:gray;">Time cancel:</h6> 
								  <input class="form-control" type="date" name="timeCancel" value = "${order.cancelDate}">
								  
								</div>
								
								<div class="form-outline mb-3 ">
								  <h6 class="mx-2" style="color:gray;">Reason cancel:</h6> 
								  <input  class="form-control" type="text"
								  	name="reasonCancel"  value = "${order.reasonCancel}" >
								</div>
								
								
								
							
								
								<button style="background-color: #2b6054;" type="submit" class="btn btn-primary btn-sm">
									 Save 
								</button>
								
								
					    	</form>
					    </tr>
					    
					   
					   <hr>
						<a href="OrderInfo.jsp?orderID=${order.id}">
							<button style="background-color: #2b6054;" type="button" class="btn btn-primary btn-sm">
										 Back to Order Info 
							</button>
						</a>

					

                  </div>

                </div>
			
              </div>
              


            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
		<!-- End of cart -->
		
	</div>
</body>
</html>