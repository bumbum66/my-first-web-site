<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales order insert</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String order_num = request.getParameter("order_num");
	String cust_id = request.getParameter("cust_id");
	String cust_name = request.getParameter("cust_name");
	String cust_address = request.getParameter("cust_address");
	String product_id = request.getParameter("product_id");
	String product_name = request.getParameter("product_name");
	String quantity = request.getParameter("quantity");
	String order_date = request.getParameter("order_date");
	String requst_date = request.getParameter("requst_date");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO SALES_ORDER(ORDER_NUM, CUST_ID, CUST_NAME, CUST_ADDRESS, PRODUCT_ID, PRODUCT_NAME, QUANTITY, ORDER_DATE, REQUST_DATE) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.247.78:1522:orcl", "semi_project1", "123451");
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(order_num));
		pstmt.setInt(2, Integer.parseInt(cust_id));
		pstmt.setString(3, cust_name);
		pstmt.setString(4, cust_address);
		pstmt.setInt(5, Integer.parseInt(product_id));
		pstmt.setString(6, product_name);
		pstmt.setInt(7, Integer.parseInt(quantity));
		pstmt.setString(8, (order_date));
		pstmt.setString(9, (requst_date));
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<h3>입력이 완료되었습니다</h3>
<a href="salesOrder_select.jsp">확인하기</a>
</body>
</html>