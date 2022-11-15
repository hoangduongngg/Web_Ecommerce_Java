<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
    
<%
	String username = (String)request.getParameter("username");
	String password = (String)request.getParameter("password");
	String rePassword = (String)request.getParameter("rePassword");
	String name = (String)request.getParameter("name");
	String address = (String)request.getParameter("address");
	String tel = (String)request.getParameter("tel");
	String email = (String)request.getParameter("email");
	String dob = (String) request.getParameter("dob");
		Date dobDate = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
	    java.sql.Date sqlDate = new java.sql.Date(dobDate.getTime());
		
	String cardNumber = (String)request.getParameter("cardNumber");
	String cardName = (String)request.getParameter("cardName");
	String cardCVV = (String)request.getParameter("cardCVV");
	String cardOutDate_String = (String)request.getParameter("cardOutDate");
		Date util_cardOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(cardOutDate_String);
		java.sql.Date sql_cardOutDate = new java.sql.Date(util_cardOutDate.getTime());
	
	Member mb = new Member();
	mb.setUsername(username);
	mb.setPassword(password);
	mb.setName(name);
	mb.setAddress(address);
	mb.setTel(tel);
	mb.setEmail(email);
	mb.setDob(sqlDate);
	/* mb.setRole("customer"); */
	
	PaymentCard pc = new PaymentCard();
	pc.setCardCVV(cardCVV);
	pc.setCardName(cardName);
	pc.setCardNumber(cardNumber);
	pc.setCardOutDate(sql_cardOutDate);
	
	MemberDAO memberDAO = new MemberDAO();
	
	
	if (!password.equalsIgnoreCase(rePassword)) {
		request.setAttribute("mess", "Check your password and re-password!");
		request.setAttribute("mb", mb);
		request.setAttribute("pc", pc);
        request.getRequestDispatcher("register.jsp").forward(request, response);
	}
	else if (memberDAO.checkMemberExist(mb) == true) {
		request.setAttribute("mess", "Account already exists!");
		request.setAttribute("mb", mb);
		request.setAttribute("pc", pc);
        request.getRequestDispatcher("register.jsp").forward(request, response);
	}
	else {
		memberDAO.addMember(mb);
		memberDAO.checkMemberExist(mb); //cap nhat mb tu DB them id
		
		PaymentCardDAO paymentCardDAO = new PaymentCardDAO();
		paymentCardDAO.addPaymentCard(pc);
		pc = paymentCardDAO.getPaymentCardByCardNumber(pc); //cap nhat mb tu DB them id

		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = new Customer(mb, pc);
		customerDAO.addCustomer(mb, pc);
		
		session.setAttribute("member", mb);
		session.setAttribute("customer", customer); 
        response.sendRedirect("Customer/CustomerHome.jsp");
	}
%>