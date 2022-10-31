<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
 
<%
 	 String username = (String)request.getParameter("username");
     String password = (String)request.getParameter("password");
     Member mb = new Member();
     mb.setUsername(username);
     mb.setPassword(password);
     
     
     
     MemberDAO memberDAO = new MemberDAO();
     
     if (memberDAO.checkMemberExist(mb) == null) { //Sai thong tin
    	 response.sendRedirect("login.jsp?err=fail");
     }
     else{	//User
    	 mb = memberDAO.checkMemberExist(mb);
    	 Integer idMember  = mb.getId();
    	 StaffDAO staffDAO = new StaffDAO();
    	 Staff staff = staffDAO.getStaffByID (idMember);
    	 
    	 if (staff != null) { 	//La nhan vien
    		 String position = staff.getPosition();
    		 session.setAttribute("staff", staff);
    	 	if (position.equalsIgnoreCase("warehousestaff")) {
    	 		response.sendRedirect("WareHouseStaff\\WareHouseStaffHome.jsp");
    	 	}
    	 	else if (position.equalsIgnoreCase("shipper")){
    	 		response.sendRedirect("Shipper\\ShipperHome.jsp");
    	 	}
    	 }
    	 else {	//La KH
    		 CustomerDAO customerDAO = new CustomerDAO();
    		 Customer customer = customerDAO.getCustomerByID(idMember);
    		 session.setAttribute("customer", customer);
    		 response.sendRedirect("Customer\\CustomerHome.jsp");
    	 }
     }
     
 %>