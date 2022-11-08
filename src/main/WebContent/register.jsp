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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="asset\\css\\style.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="navbar.jsp" />  
	
	<form name="register" action="doRegister.jsp" method="post" class="h-100 py-10" >
	
	  <div class="container py-5 h-100">
	  
	    <div class="row d-flex justify-content-center align-items-center h-100" >
	      <div class="col-12 py-5">
	        <div class="card card-registration card-registration-2 text-white" style="border-radius: 15px; background-color: #2b6054" >
	          <div class="card-body p-0">
	            <div class="row g-0">
	              <div class="col-lg-6">
	                <div class="p-5">
	                  <h3 class="fw-normal mb-4" style="color: white;">General Information</h3>
					<div class="row">
	                    <div class="col-md-12 mb-2 pb-2 mb-md-0 pb-md-0">
	                      <div class="form-outline">
	                        <input type="text" name="username" value="${mb.getUsername()}" class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplev5">Username</label>
	                      </div>
	                    </div>
	                  </div>
	                  
	                  <div class="row">
	                    <div class="col-md-6 mb-2 pb-2">
	                      <div class="form-outline">
	                        <input type="text" name="password" value="${mb.getPassword()}" class="form-control form-control-lg" />
	                        <label class="form-label">Password</label>
	                      </div>
	                    </div>
	
	                    <div class="col-md-6 mb-2 pb-2">
	
	                      <div class="form-outline">
	                        <input type="password" name="rePassword"  class="form-control form-control-lg" />
	                        <label class="form-label">Re-Password</label>
	                      </div>
	
	                    </div>
	                  </div>
	
	                  <div class="row">
	                    <div class="col-md-12 mb-2 pb-2 mb-md-0 pb-md-0">
	                      <div class="form-outline">
	                        <input type="text" name="name" value="${mb.getName()}" class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplev5">Full Name</label>
	                      </div>
	                    </div>
	                  </div>
	
	                  <div class="row">
	                    <div class="col-md-6 mb-2 pb-2">
	
	                      <div class="form-outline">
	                        <input type="date" name="dob" value="${mb.getDob()}" class="form-control form-control-lg" placeholder=" "/>
	                        <label class="form-label" for="form3Examplev2">Date of Birth</label>
	                      </div>
	
	                    </div>
	                    <div class="col-md-6 mb-2 pb-2">
	
	                      <div class="form-outline">
	                        <input type="text" name="tel" value="${mb.getTel()}"class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplev3">Tel</label>
	                      </div>
	
	                    </div>
	                  </div>
	
	                  <div class="row">
	                    <div class="col-md-12 mb-2 pb-2 mb-md-0 pb-md-0">
	                      <div class="form-outline">
	                        <input type="text" name="address" value="${mb.getAddress()}"class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplev5">Address</label>
	                      </div>
	                    </div>
	                  </div>
	
	                  <div class="row">
	                    <div class="col-md-12 mb-2 pb-2 mb-md-0 pb-md-0">
	                      <div class="form-outline">
	                        <input type="email" name="email" value="${mb.getEmail()}" class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplev5">Email</label>
	                      </div>
	                    </div>
	                  </div>
	
	                  
	
	                </div>
	              </div>
	              <div class="col-lg-6 text-white" style="background-color: #2b6054;">
	                <div class="p-5">
	                  <h3 class="fw-normal mb-4">Payment Information</h3>
	
	                  <div class="mb-2 pb-2">
	                    <div class="form-outline form-white">
	                      <input type="text" name="cardNumber" value="${pc.getCardNumber()}" class="form-control form-control-lg" />
	                      <label class="form-label" for="form3Examplea2">Card Number</label>
	                    </div>
	                  </div>
	
	                  <div class="mb-2 pb-2">
	                    <div class="form-outline form-white">
	                      <input type="text" name="cardName" value="${pc.getCardName()}" class="form-control form-control-lg" />
	                      <label class="form-label" for="form3Examplea3">Card Name</label>
	                    </div>
	                  </div>
	
	                  <div class="row">
	                    <div class="col-md-5 mb-2 pb-2">
	
	                      <div class="form-outline form-white">
	                        <input type="text" name="cardCVV" value="${pc.getCardCVV()}" class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplea7">CVV</label>
	                      </div>
	
	                    </div>
	                    <div class="col-md-7 mb-2 pb-2">
	
	                      <div class="form-outline form-white">
	                        <input type="date" name="cardOutDate" value="${pc.getCardOutDate()}" class="form-control form-control-lg" />
	                        <label class="form-label" for="form3Examplea8">Out Date</label>
	                      </div>
	
	                    </div>
	                  </div>
	
	                  <button type="submit" class="btn btn-light btn-success">Register
	                  </button>
	                  
						<c:if test="${mess!= null }">
							<h5> ${mess} </h5>
						</c:if>
											
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</form>
</body>
</html>