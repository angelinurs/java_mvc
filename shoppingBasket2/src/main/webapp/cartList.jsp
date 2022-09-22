<%@page import="shoppingBasket.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css">
		
	</head>
	<body>
		<jsp:include page="menu.jsp" />
		
		<table id="t2" width="600" border="1" align="center" 
		       style="border-collapse:collapse;font-size:8pt" 
		       cellspacing="0" cellpadding="4">
		       <thead>
			       <tr>
	                   <td colspan="6">:: 장바구니 내용</td>
	               </tr>
	               <tr bgcolor="#dedede">
	                   <th>제품번호</th>
	                   <th width="25%">제품명</th>
	                   <th>단가</th>
	                   <th>수량</th>
	                   <th>금액</th>
	                   <th>삭제</th>
	               </tr>
		       </thead>
		       <tbody>
		       <jsp:useBean id="cart" class="use.bean.Cart" scope="session" />
		       <%
		       		// 총 결제 금액
		       		int total = 0;
		       
		       		ProductVO[] parr = cart.getList();
		       		
		       		if( parr != null ) {
		       			for( ProductVO pvo : parr ) {
		       %>
		       		<tr align="center">
		                <td><%=pvo.getP_num() %></td>
		                <td><%=pvo.getP_name() %></td>
		                <td>
		                    정가:<%=pvo.getP_price() %><br>
		                    <font color="red">
		                        세일가격:<%=pvo.getP_saleprice() %> 원
		                    </font>
		                </td>
		                <td>
		                    <!-- 수량 조정 폼 -->
		                    <form action="changeCount.jsp" method="post">
		                    	<input type="hidden" value="<%=pvo.getP_num() %>" name="p_num" />
		                    	<input type="number" value="<%=pvo.getQuant() %>" name="quant" size="2" />
		                    	<input type="submit" value="변경" />
		                    </form>
		                    <!------------------>
		                </td>
		                <td><span><%=pvo.getTotalPrice() %></span>원</td>
		                <td>
		                    <input type="button" value="삭제" 
				                    style="border:1 solid black; cursor:pointer" 
									onclick="javascript:location.href='delProduct.jsp?p_num=<%=pvo.getP_num() %>'">
		                </td>
		            </tr>
				<%
		       			}
					} else { 
				%>
		
		            <tr align="center">
		                <td colspan="6">
		                    <b>장바구니가 비었습니다.</b>
		                </td>
		            </tr>
		            
				<% } %>
		            
		            <tr>
		                <td colspan="5" align="right">총 결재액 : </td>
		                <td></td>
		            </tr>
		       </tbody>
               

            
        </table>
		
	
	</body>
</html>