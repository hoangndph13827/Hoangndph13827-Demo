<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/java5_Lab5/bootstrap/css/bootstrap.css">
</head>
<body>
<h2>Order Detail</h2>
<form:form action="/java5_Lab5/orderDetail/add" method="post" modelAttribute="orderDetail">
	<label>Product</label>
	<form:select path="product">
		<form:options items="${prd }" />
	</form:select>
	<label>Order</label>
	<form:select path="order">
		<form:options items="${od }" />
	</form:select>
	<hr>
	<button class="btn-primary">Create</button>
	<button class="btn-warning" formaction="/java5_Lab5/orderDetail/update/${orderDetail.id}">Update</button>
	<button class="btn-danger" formaction="/java5_Lab5/orderDetail/delete/${orderDetail.id}">Delete</button>
</form:form>
<hr>
	<table class="table" >
		<thead>
			<tr>
				<th>Product</th>
				<th>Price</th>
				<th>Quantity</th>
			</tr>
			
		</thead>
		
	</table>
</body>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>