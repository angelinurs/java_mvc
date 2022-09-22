<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="sb" class="use.bean.ShopBean" scope="session" />
<jsp:useBean id="cart" class="use.bean.Cart" scope="session" />
<%
	String pnum = request.getParameter( "p_num" );
	String q = request.getParameter( "quant" );	

	cart.changeProduct( pnum, Integer.parseInt( q ) );
	
	response.sendRedirect( "cartList.jsp" );
%>