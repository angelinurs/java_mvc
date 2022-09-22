<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sb" class="use.bean.ShopBean" scope="session" />
<jsp:useBean id="cart" class="use.bean.Cart" scope="session" />
<%
	String pnum = request.getParameter( "p_num" );

	sb.setP_num(pnum);

	cart.addProduct( sb, pnum );
	
	response.sendRedirect( "product_content.jsp?prod_num=" + pnum );
%>