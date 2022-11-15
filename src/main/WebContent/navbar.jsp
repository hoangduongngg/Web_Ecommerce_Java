<%@page import="model.WareHouseStaff"%>
<%@page import="model.Customer"%>
<%@page import="model.Member"%>

	<%
		Member member = (Member) session.getAttribute("member");
	Customer customer = new Customer();
 	customer = (Customer) session.getAttribute("customer");
 	WareHouseStaff warehousestaff = (WareHouseStaff) session.getAttribute("warehousestaff");
 	%>

<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav" style="background-color: white;">
            <div class="container px-5">
            	<% if (member == null) { %>
            		<a class="navbar-brand fw-bold" href="index.jsp">Super Market</a>
            	<% } 
            	else if (customer !=null ){ %>
            		<a class="navbar-brand fw-bold" href="CustomerHome.jsp">Super Market</a>
            	<% }
            	else if (warehousestaff != null) { %>
            		<a class="navbar-brand fw-bold" href="WareHouseStaffHome.jsp">Super Market</a>
            	<%} %>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="bi-list"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                
                	<% 
                	
                	if (member != null) { %>
	                    <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
	                        <li class="nav-item"><a class="nav-link me-lg-3" href="#">Hello, ${member.name}</a></li>
	                    	<li class="nav-item"><a class="nav-link me-lg-3" href="../doLogOut.jsp" style="opacity: 50%">Logout</a></li>
	                    </ul>
	                   
	                    
                    <% } %>
                    
                    
                    <% if (customer != null) { %>
                    
                    <form action="doSearchHome.jsp" method="post" class="form-inline my-2 my-lg-0">
                        <!--Search-->
                        <div class="input-group input-group-sm">
                            <input  name="txtSearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-dark btn-number rounded me-3" style="background-color: #2b6054">
<!--                                     <i class="fa fa-search"></i>
 -->                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
                                </button>
                            </div>
                        </div>             
        			</form>

                    <a href="Order.jsp" >
                        <button style="background-color: #2b6054;" class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" data-bs-toggle="modal" data-bs-target="#feedbackModal">
                            <span class="d-flex align-items-center" >
                                <!-- <i class="bi-chat-text-fill me-2"></i> -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-dash" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M5.5 10a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
								  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
								</svg>
                                <span class="small ms-2">Cart</span>
                            </span>
                        </button>
                    </a>
                    
                    <% } %>
                </div>
            </div>
        </nav>