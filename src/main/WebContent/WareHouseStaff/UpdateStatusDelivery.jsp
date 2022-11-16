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
	<h1>Checkout Payment:</h1>

		<div class="container">
		
		<!-- Search and Cart -->
		
		<%	
			WareHouseStaff warehousestaff = (WareHouseStaff) session.getAttribute("warehousestaff");
			if (warehousestaff == null) {
				response.sendRedirect("../");
			}
 			else {
				if (request.getParameter("orderID") != null) { 
					int orderID = Integer.parseInt(request.getParameter("orderID"));
					OrderDAO orderDAO = new OrderDAO();
					Order order = orderDAO.getOrderByID(orderID);
			System.out.println(order);
					
					Customer customer = order.getCustomer();
					PaymentCard paymentCard = customer.getPaymentCard();
				
					OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
					List<OrderDetail> list_od = orderDetailDAO.getOrderDetailByOrder(order);
					
					request.setAttribute("paymentCard", paymentCard);
					request.setAttribute("customer", customer);
					request.setAttribute("order", order);
					request.setAttribute("list_od", list_od);
 				}
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
                  
 					<h3 class="my-4">Order infor:</h3>
 					
					
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
					    
						
					    
					    
					    
					    
					  </tbody>
					</table>
					
					<a href = "UpdateStatusDelivery.jsp?orderID=${order.id }">
							    				<button style="background-color: #2b6054;" type="button" class="btn btn-primary btn-sm">
							 Update delivery status
							    				</button>
							    			
					</a>
					<p></p>
 					<a href = "SelectShipper.jsp?orderID = ${order.id }">
							    				<button style="background-color: #2b6054;" type="button" class="btn btn-primary btn-sm">
							Choose shipper
							    				</button>
							    			
					</a>

                  </div>

                </div>
			<c:forEach items="${list_od}" var = "od">
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="${od.product.img }"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ms-3">
                          <h5>${od.product.name}</h5>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">${od.quantity}</h5>
                        </div>
                        <div style="width: 80px;">
                          <h5 class="mb-0">${od.price}</h5>
                        </div>
                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
 			</c:forEach>
              </div>
              
              <!-- Thong tin   -->
              <div class="col-lg-4">

                <div class="card text-white rounded-3" style="background-color: #2b6054;">
                  <div class="card-body">
                  
                  
                  <!-- Thong tin ca nhan  -->
                  <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="mb-0">Customer Infor</h5>
                    </div>

                    
                    <form class="mt-4">
                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                          value=" ${customer.name}" />
                        <label class="form-label" for="typeName">Full Name</label>
                      </div>

                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                          value="${customer.email}" minlength="19" maxlength="19" />
                        <label class="form-label" for="typeText">Email</label>
                      </div>

                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div class="form-outline form-white mb-4">
	                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
	                          value="${customer.address}" minlength="19" maxlength="19" />
	                        <label class="form-label" for="typeText">Address</label>
                      		</div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-outline form-white mb-4">
	                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
	                          value="${customer.tel}" minlength="19" maxlength="19" />
	                        <label class="form-label" for="typeText">Tel</label>
                      		</div>
                        </div>
                      </div>

                    </form>
                    
                    <!-- Thong tin thanh toan -->
                    
                    
                  <hr class="my-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="mb-0">Card details</h5>
                    </div>

                    
                    <form class="mt-4">
                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                          value=" ${paymentCard.cardName}" />
                          
                        <label class="form-label" for="typeName">Card Name</label>
                      </div>

                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                          value="${paymentCard.cardNumber}" minlength="19" maxlength="19" />
                        <label class="form-label" for="typeText">Card Number</label>
                      </div>

                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="text" id="typeExp" class="form-control form-control-lg"
                              value="${paymentCard.cardOutDate}" size="7" id="exp" minlength="7" maxlength="7" />
                            <label class="form-label" for="typeExp">Expiration</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="password" id="typeText" class="form-control form-control-lg"
                              placeholder="***" size="1" minlength="3" maxlength="3" />
                            <label class="form-label" for="typeText">CVV</label>
                          </div>
                        </div>
                      </div>

                    </form>

                    

                    

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