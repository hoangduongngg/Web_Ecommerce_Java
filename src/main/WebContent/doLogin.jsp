<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
 
<%
 	 String username = (String)request.getParameter("username");
     String password = (String)request.getParameter("password");
     Member mb = new Member();
     mb.setUsername(username);
     mb.setPassword(password);
     Staff st = new Staff();
     st.setUsername(username);
     st.setPassword(password);
     
     
     
     MemberDAO dao = new MemberDAO();
     boolean kq = dao.checkLogin(mb);
      
     // Thoi van nen dung role!!!!!!!!!
     
     if (kq && st.getPosition().equalsIgnoreCase("warehousestaff")) {
    	 response.sendRedirect("WareHouseStaff\\WareHouseStaffHome.jsp");
     }
     else if (kq && st.getPosition().equalsIgnoreCase("shipper")) {
    	 response.sendRedirect("Shipper\\ShipperHome.jsp");
     }
     else if (kq && st.getPosition()== null) {
    	 response.sendRedirect("Customer\\CustomerHome.jsp");
     }
     
     /* if(kq && (mb.getvaitro().equalsIgnoreCase("sinhvien"))){
         session.setAttribute("sinhvien", mb);
         response.sendRedirect("sv\\gdchinhsv.jsp");
        
     }else if(kq &&(mb.getvaitro().equalsIgnoreCase("giangvien"))){
         session.setAttribute("giangvien", mb);
         response.sendRedirect("gv\\gdchinhgv.jsp");
     }else{
         response.sendRedirect("gddangnhap.jsp?err=fail");
     } */
     
 %>