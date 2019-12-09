<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 HttpSession Session = request.getSession(false);
 if(Session==null){
   request.getRequestDispatcher("login.jsp").forward(request,response);
 }else{
     String userType =(String)Session.getAttribute("userType");
     //营业员
     if(userType.equals("1")){
     
     }else if(userType.equals("2")){ //管理员
     
     }
 }
 %>
