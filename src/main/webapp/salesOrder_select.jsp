<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>     
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

	.header{width:1100px; text-align:center; box-sizing: border-box}
	.container{border:1px solid #666; background-color: gray; width: 1100px; height: 500px;
		padding: 20px 0; box-sizing: border-box}
	.theader{background-color: darkblue; color: white; margin: 0 auto}
	.order{background-color: white; margin: 0 auto}
	.responsible{background-color: white; margin: 20px }
	.selecter{margin: 20px}
</style>


<title>Sales order select</title>

</head>
<body>

<div class="header"><h2>주문서 조회</h2></div>

<div class="container">

	<table class="responsible" border=1>
	  <tr>
		<th>담당자 번호</th>
		<th>담당자 명</th>
	  <tr>
	  <tr>
	  	<td><input type="number"></td>
	  	<td><input type="text"></td>
	  </tr>
	</table>
	
	<div class="selecter">
		<input type = "date"> ~ <input type = "date">
		<input type = "button" value="조회">
		<input type = "reset" value="취소">
		<input type = "button" value="입력">
	</div>



	<table class="order" border=1>
	  <thead>
	  	<tr>
			<th width=80px>주문번호</th>
			<th width=80px>고객번호</th>
			<th width=80px>고객명</th>
			<th width=300px>주소</th>
			<th width=80px>제품번호</th>
			<th width=80px>제품명</th>
			<th width=80px>수량</th>
			<th width=120px>주문일</th>
			<th width=120px>요청일</th>		
		</tr>
	  </thead>		

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
	conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.247.78:1522:orcl", "semi_project1", "123451");
	String sql = "SELECT ORDER_NUM , CUST_ID , CUST_NAME , CUST_ADDRESS , PRODUCT_ID , PRODUCT_NAME , QUANTITY , ORDER_DATE , REQUST_DATE FROM SALES_ORDER"; //DB를 조회할 select문
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){ //조회되는 로우(행) 반복
		out.print("<tr>");
		out.print("<td>" + rs.getInt("order_num") + "</td>");
		out.print("<td>" + rs.getInt("cust_id") + "</td>");
		out.print("<td>" + rs.getString("cust_name") + "</td>");
		out.print("<td>" + rs.getString("cust_address") + "</td>");
		out.print("<td>" + rs.getInt("product_id") + "</td>");
		out.print("<td>" + rs.getString("product_name") + "</td>");
		out.print("<td>" + rs.getInt("quantity") + "</td>");
		out.print("<td>" + rs.getDate("order_date") + "</td>");
		out.print("<td>" + rs.getDate("requst_date") + "</td>");
		out.print("</tr>");
	}
	
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
	</table>
</div>
</body>
</html>