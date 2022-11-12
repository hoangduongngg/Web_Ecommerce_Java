<%@page import="model.Customer"%>
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
	<h1>Product Detail</h1>

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
			int id = Integer.parseInt(request.getParameter("ProductID"));
			ProductDAO productDAO = new ProductDAO();
			Product p = productDAO.getProductbyID(id);
			request.setAttribute("p", p);
		%>
		
		
		<!-- Product -->
                <div class="row">
                    <div class="col-sm-12">  
                        <!--Product List-->
                        <div class="col-sm-12">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-small-wrap">
                                            <div > <a href="#"><img src="${p.img}" style = "width:100%;"></a></div>
                                        </div> <!-- slider-product.// -->
                                        
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${p.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="num" style="color:#2b6054">${p.price} $</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${p.description} </p></dd>
                                        </dl>

                                        <hr>
                                        <a href="addtoCart.jsp?ProductID=${p.id}" class="btn btn-sm btn-outline-primary text-uppercase" style="background-color: #2b6054 ; color: white; "> 
                                        	Add to cart </a>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->

                        
                    </div>
               
                
                
                    </div>

                </div>
            </div>
		
</body>
</html>