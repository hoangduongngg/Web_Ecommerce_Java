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
		<%
			Customer customer = (Customer) session.getAttribute("customer");
			if (customer == null) {
				response.sendRedirect("../");
			}
		%>
	<jsp:include page="../navbar.jsp" /> 
	<!-- <h1>Cart:</h1> -->
	<%
		if (request.getAttribute("mess") != null && request.getAttribute("mess").equals("empty"))  { %>
		<p style="color: red"> Can't checkout, your cart is empty!</p> 
	<% } %>
		<div class="container">
		
		<!-- Search and Cart -->
		<!-- <div> 
		<form action="doSearchHome.jsp" method="post" class="form-inline my-2 my-lg-0">
                        Search
                        <div class="input-group input-group-sm">
                            <input  name="txtSearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-dark btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        Cart
                        <a class="btn btn-sm ml-3" href="Order.jsp" style="background: #000; color: white; border-radius: 0px; ">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light">0</span>
                        </a>
                        
        </form>
		</div> -->
		<!-- End Search and Cart -->
		
		<%	
			OrderDAO orderDAO = new OrderDAO();
			Order order = orderDAO.getCartByCustomer(customer);
			
			OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
			List<OrderDetail> list_od = orderDetailDAO.getOrderDetailByOrder(order);

			request.setAttribute("customer", customer);
			request.setAttribute("order", order);
			request.setAttribute("list_od", list_od); 
		%>
		<!-- Cart -->
		<div>
		</div>
			<section class="h-100 h-custom">
			  <div class="container h-100 py-5">
			    <div class="row d-flex justify-content-center align-items-center h-100">
			      <div class="col">
					
					<% if (list_od.size() == 0) { %>
						<h1>Cart is empty</h1>
					
					<% } %>
			        <div class="table-responsive">
			          <table class="table">
			            <thead>
			              <tr>
			                <th scope="col" class="h5">Shopping Bag</th>
			                <th scope="col">Quantity</th>
			                <th scope="col">Price</th>
			              </tr>
			            </thead>
			            <tbody>
			            
 			           <c:forEach items="${list_od}" var = "od">				         
				        	 
				        	 
			              <tr>
			                <th scope="row">
			                <a href="ProductDetail.jsp?ProductID=${od.product.id}">
			                  
			                  <div class="d-flex align-items-center">
			                    <img src="${od.product.img}" class="img-fluid rounded-3"
			                      style="width: 120px;" alt="Book">
			                      
			                    <div class="flex-column ms-4">
			                       <p class="mb-2" style="color:#2b6054; text-decoration: none;">${od.product.name}</p>
			                    </div>
			                  </div>
			                </a>
			                </th>

			                <td class="align-middle">
			                  <div class="d-flex flex-row">
			                         
			                    <a href="doIncRecDel.jsp?action=rec&OrderDetailID=${od.id}">
			                    
			                    <button class="btn btn-link px-2"
			                      onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
			                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">
									  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
									</svg>
			                    </button>
			                    	
			                    </a>

			
			                    <input id="form1" min="1" name="quantity" value="${od.quantity}" type="number"
			                      class="form-control form-control-sm" style="width: 50px;" />
								
								<a href="doIncRecDel.jsp?action=inc&OrderDetailID=${od.id}">
				                    <button class="btn btn-link px-2"
				                      onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
				                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
										  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
										</svg>
				                    </button>
								</a>
			                  </div>
			                </td>
			                <td class="align-middle">
			                  <p class="mb-0" style="font-weight: 500;">${od.price} $</p>
			                </td>
			                
			                <td class="align-middle">
			                  <a href="doIncRecDel.jsp?action=del&OrderDetailID=${od.id}">
				                    <button class="btn btn-link px-2"
				                      onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
				                      <svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16" style="color: red;">
										  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
										</svg>
				                    </button>
								</a>
			                </td>
			              </tr>
			              
				      </c:forEach>
			            </tbody>
			          </table>
			        </div>
			
			        <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
			          <div class="card-body p-4">
			
			            <div class="row">
			              <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
			                <form>
			                  
			                  
			                </form>
			              </div>
			             
			              <div class="col-lg-4 col-xl-3">
			                <div class="d-flex justify-content-between" style="font-weight: 500;">
			                  <p class="mb-2">Subtotal</p>
			                  <p class="mb-2"> ${order.totalAmount} $</p>
			                </div>
			
			                <div class="d-flex justify-content-between" style="font-weight: 500;">
			                  <p class="mb-0">Shipping</p>
			                  <p class="mb-0">0 $</p>
			                </div>
			
			                <hr class="my-4">
			
			                <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
			                  <p class="mb-2">Total </p>
			                  <p class="mb-2">${order.totalAmount} $</p>
			                </div>
			
			                <a href="doBuy.jsp">
				                <button type="button" class="btn btn-primary btn-block btn-lg" style="background-color:#2b6054; color: white;">
				                  <div class="d-flex justify-content-between">
				                    <span>Checkout now!</span>
				                    
				                  </div>
				                </button>
			                </a>
			
			              </div>
			            </div>
			
			          </div>
			        </div>
			
			      </div>
			    </div>
			  </div>
			</section>
       </div>
		<!-- End of cart -->
</body>
</html>