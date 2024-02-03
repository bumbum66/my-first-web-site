<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style>
	.header{width:1100px; text-align:center; box-sizing: border-box}
	.container{border:1px solid #666; background-color: gray; width: 1100px; height: 500px;
		padding: 20px; box-sizing: border-box}
	.theader{background-color: darkblue; color: white; margin: 0 auto}
	.order{background-color: white; margin: 0 auto}
	.responsible{background-color: white; margin: 20px }
	.selecter{margin: 20px}
</style>

<title>Sales order insert form</title>
</head>
<body>

<div class="header"><h2>주문서 입력</h2></div>

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
<form action="salesOrder_insert.jsp" method="post">	

	<div class="selecter">
		<input type = "date"> ~ <input type = "date">
		<input type = "button" value="조회">
		<input type = "reset" value="취소">
		<input type = "submit" value="입력">
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
			<td width=117px><input type="date" style="width:95%"></td>
			<td width=117px><input type="date" style="width:95%"></td>		
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
			<td width=117px><input type="date" style="width:95%"></td>
			<td width=117px><input type="date" style="width:95%"></td>		
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
			<td width=117px><input type="date" style="width:90%"></td>
			<td width=117px><input type="date" style="width:90%"></td>		
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
			<td width=117px><input type="date" style="width:95%"></td>
			<td width=117px><input type="date" style="width:95%"></td>		
		</tr>		
	  </tbody>		
	</table>
	</form>
</div>
</body>
</html>