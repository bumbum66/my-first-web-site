<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

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

<div class="header"><h2>주문서</h2></div>

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
		<input type = "button" value="입력">
		<input type = "button" value="확인">
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
	</table>

<%
	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "semi_project1";
	String PASSWORD = "123451";
	
  	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	
	Exception exception = null;
	
  try {
		// 0.
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT ORDER_NUM , CUST_ID , CUST_NAME , CUST_ADDRESS , PRODUCT_ID , PRODUCT_NAME , QUANTITY , ORDER_DATE , REQUST_DATE FROM SALES_ORDER"); 
	 	// 2-2. SQL 쿼리 실행(줄바꾸면 안됨)
		
	 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	 	while(rs.next()) {
%>
			<table class="order" border=1>
			  <tbody>
			  	<tr>
					<td width=80px><%= rs.getInt("ORDER_NUM") %></td>
					<td width=80px><%= rs.getInt("CUST_ID") %></td>
					<td width=80px><%= rs.getString("CUST_NAME") %></td>
					<td width=300px><%= rs.getString("CUST_ADDRESS") %></td>
					<td width=80px><%= rs.getInt("PRODUCT_ID") %></td>
					<td width=80px><%= rs.getString("PRODUCT_NAME") %></td>
					<td width=80px><%= rs.getInt("QUANTITY") %></td>
					<td width=120px><%= rs.getString("ORDER_DATE").substring(0,10) %></td>
					<td width=120px><%= rs.getString("REQUST_DATE").substring(0,10) %></td>
				</tr>
			  </tbody>				
			</table>

<%
		 	}
	 	
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류:" + e);
	  } finally {
		  if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  }
%>

	<table class="order" border=1>
	  <tbody>
	  	<tr>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=300px><input type="text" style="width:97%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=120px><input type="date" style="width:95%"></td>
			<td width=120px><input type="date" style="width:95%"></td>		
		</tr>		
	  </tbody>		
	</table>
	<table class="order" border=1>
	  <tbody>
	  	<tr>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=300px><input type="text" style="width:97%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=120px><input type="date" style="width:95%"></td>
			<td width=120px><input type="date" style="width:95%"></td>		
		</tr>		
	  </tbody>		
	</table>
	<table class="order" border=1>
	  <tbody>
	  	<tr>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=300px><input type="text" style="width:97%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=120px><input type="date" style="width:95%"></td>
			<td width=120px><input type="date" style="width:95%"></td>		
		</tr>		
	  </tbody>		
	</table>
	<table class="order" border=1>
	  <tbody>
	  	<tr>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=300px><input type="text" style="width:97%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=80px><input type="text" style="width:90%"></td>
			<td width=80px><input type="number" style="width:90%"></td>
			<td width=120px><input type="date" style="width:95%"></td>
			<td width=120px><input type="date" style="width:95%"></td>		
		</tr>		
	  </tbody>		
	</table>	


</div>


</body>
</html>