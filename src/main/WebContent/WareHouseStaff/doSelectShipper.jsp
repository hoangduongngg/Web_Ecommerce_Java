<%@page import="dao.OrderDAO"%>
<%@page import="model.Shipper"%>
<%@page import="model.Member"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.Order"%>
<%
	int shipperID = 0;
	if (request.getParameter("shipperID") != null) {
		shipperID = Integer.parseInt( (String) request.getParameter("shipperID"));
		MemberDAO memberDAO = new MemberDAO();
		Member mb = memberDAO.getMemberByID(shipperID);
		Shipper shipper = new Shipper(mb);
		
		Order order = (Order) session.getAttribute("order");
		order.setShipper(shipper);
		
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.selectShipper(order);
		
		session.setAttribute("order", order);
		response.sendRedirect("OrderInfo.jsp");
	}
	
	
%>