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
	<p></p>
	<div class = "container pt-5 mx-5">
		<h3 class = "pt-5">Confirm Payment</h3>
		<p>Enter number code from your phone.</p>
		
		<form action="doConfirmPayment.jsp" method = "post">
			<input type="text" name = "confirmCode">
			
			<p></p>
			
			<% if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("wrongCode")){
						          %> <h4>Wrong code!</h4>
						      <% } %>
			<button type="submit" class="btn btn-success" style="background-color: #2b6054;">
				Send Code
			</button>
		</form>
	</div>
</body>
</html>