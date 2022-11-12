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
	<h1 >Customer Home</h1>
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
		
		
		<%
			ProductDAO productDAO = new ProductDAO();
			List <Product> listP = productDAO.getHomeProduct();
			request.setAttribute("listP", listP);
		%>
		
		
		<!-- Product -->
                <div class="row">
                    <div class="col-sm-12">  
                        <!--Product List-->
                        <div class="col-sm-12">
                            <div class="row">
                            <c:forEach items="${listP}" var="p">
                                <div class="col-12 col-md-6 col-lg-4" style="width: 25%; ">
                                
                                    <div class="card">
                                        <img class="card-img-top " src="${p.img}" >

                                        <div class="card-body">
                                            <h4 class="card-title show_txt">
                                                <a href="ProductDetail.jsp?ProductID=${p.id}" style="text-decoration: none; color:#2b6054">${p.name}</a>
                                            </h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p>${p.price} $</p>

                                                </div>
                                                <%-- <div class="col">
                                                    <a href="addtoCart?ProductID=${o.id}" class="btn btn-block" style="background: #000; color: white; border-radius: 0px; ">Add to cart</a>
                                                </div> --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>
		
</body>
</html>