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
<h2>Order</h2>
<form:form action="/java5_Lab5/order/add" method="post" modelAttribute="order">
	<div class="row">
		<div class="col-9">
			<label>User</label>
			<form:select cssClass="form-select" path="user">
				<form:options items="${users}" />
			</form:select>
			<label>Address</label>
			<form:input cssClass="form-control" path="address"/>
			
		</div>
		
		
	</div>
	
	<hr>
	<button class="btn-primary">Create</button>
	<button class="btn-warning" formaction="/java5_Lab5/order/update/${order.id}">Update</button>
	<button class="btn-danger" formaction="/java5_Lab5/order/delete/${order.id}">Delete</button>
</form:form>
<hr>
	<table class="table" >
		<thead>
			<tr>
				<th>Người đặt</th>
				<th>Ngày tạo</th>
				<th>Địa chỉ</th>
			</tr>
			
		</thead>
		<tbody>
			<c:forEach var="ctg" items="${od }">
				<tr>
					<td>${ctg.user.fullname }</td>
					<td>${ctg.createdDate }</td>
					<td>${ctg.address }</td>
					<td><a href="/java5_Lab5/order/edit/${ctg.id}">edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>