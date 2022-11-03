<%@page import="dao.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Customer"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <% 
   // NOTE: In this page, order is cart!!
   	//Get Product
   	int idProduct = Integer.parseInt(request.getParameter("ProductID"));
	ProductDAO productDAO = new ProductDAO();
	Product p = productDAO.getProductbyID(idProduct);
	
	//Get Customer
	Customer customer = (Customer) session.getAttribute("customer");
	
	//Get Cart
	OrderDAO orderDAO = new OrderDAO();
	Order order = orderDAO.getCartByCustomer(customer);
	if (order == null) { //Chua co gio hang -> Khoi tao
		//Set value + Inseart to DB
		order.setStatusOrder("cart");
		order.setCustomer(customer);
		orderDAO.newCart(order);
		//Get from DB to have ID
				//Use method ListOrderByOrder, but result returns a list, so get(0) from list hehee =))))
		order = orderDAO.getListOrderByOrder(order).get(0);
	}
	
	// Get List OrderDetail
/* 	 */

	//Check Product exist? If it alredy exist, increase quantity; else Create new OrderDetail.
	OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
	OrderDetail od = orderDetailDAO.getOrderDetailByOrderandProduct(order, p);
	if (od != null) { 		//alredy exist
		od.setQuantity(od.getQuantity()+1);
		orderDetailDAO.updateQuantityOrderDetail(od);
	}
	else {	// Create new OrderDetail.
		od.setQuantity(1);
		od.setPrice(p.getPrice());
		od.setProduct(p);
		orderDetailDAO.newOrderDetail(od, order);
		//od = orderDetailDAO.getOrderDetailByOrderandProduct(cart, p);	//Cap nhat ID
	}
	
	List<OrderDetail> list_od = orderDetailDAO.getOrderDetailByOrder(order);
   
	session.setAttribute("order", order);
	session.setAttribute("list_od", list_od);
	response.sendRedirect("Order.jsp");
   
   %>