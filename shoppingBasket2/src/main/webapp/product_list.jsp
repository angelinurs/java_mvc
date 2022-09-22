<%@page import="shoppingBasket.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/style.css" />
		
	</head>
	<body>
	
		<jsp:include page="menu.jsp" />
		<%
			request.setCharacterEncoding( "utf-8" );
		%>
		
		<jsp:useBean id="sb" class="use.bean.ShopBean" scope="session" />
		<jsp:setProperty property="category" name="sb" param="category"/>
		
		<%
			sb.searchProduct();
			ProductVO[] p_list =  sb.getP_list();
		%>
		
		
		<table align="center" width="600" border="1" 
		 style="border-collapse:collapse;font-size:8pt" bordercolor="navy"  
		 cellpadding="4" cellspacing="0">
		    <tr bgcolor="#dedede">
		        <th width="10%">제품번호</th>
		        <th width="10%">이미지</th>
		        <th width="35%">제품명</th>
		        <th width="20%">제품가격</th>
		        <th width="25%">비고</th>
		    </tr>
		    
		    <%
		    	if( p_list != null ) {
		    		for( ProductVO pvo : p_list ) {
   			%>
   			
		    <tr align="center">
		        <td><%=pvo.getP_num() %></td>
		        <td><img src="images/<%=pvo.getP_image_s() %>" width="100" height="95"></td>
		        <td>
		            <a href="product_content.jsp?prod_num=<%=pvo.getP_num() %>">
		                <%=pvo.getP_name() %>
		            </a>
		        </td>
		        <td>
		            할인가 : <%=pvo.getP_saleprice() %>원<br>
		            <font color="red">(<%=pvo.getPercent() %>%)</font>
		        </td>
		        <td>
		            시중 가격 : <%=pvo.getP_price() %>원
		        </td>
		    </tr>
		   
		   <%
		    		}
		    	}
		    %>
		    
		</table>
	
	</body>
</html>