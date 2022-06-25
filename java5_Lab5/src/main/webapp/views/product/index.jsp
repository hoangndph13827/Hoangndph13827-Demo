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
<div class="container">
	  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">LOGO</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/java5_Lab5/trangChu/index">Home</a></li>
                        <li class="nav-item"> <c:if test="${ sessionScope.user!=null }"><a class="nav-link"  href="/java5_Lab5/gioHang/index">Giỏ hàng</a></c:if> </li>
							
                        <c:if test="${ sessionScope.user.admin==1}">
                        	<li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                <li><a class="dropdown-item" href="/java5_Lab5/account/index">Account </a></li>
	                                <li><hr class="dropdown-divider" /></li>
	                                <li><a class="dropdown-item" href="/java5_Lab5/product/index">Product</a></li>
	                                <li><a class="dropdown-item" href="/java5_Lab5/category/index">Category</a></li>
	                                <li><a class="dropdown-item" href="/java5_Lab5/hoaDon/index">Đơn hàng</a></li>
	                            </ul>
                       		</li>
                        </c:if>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                     </form>
                     <div class="ms-2">
                     	<c:if test="${ sessionScope.user!=null}">${user.fullname } <a href="/java5_Lab5/trangChu/dangXuat">Đăng xuất</a> </c:if>
                  	   <c:if test="${ sessionScope.user==null}"><a class="btn btn-info mx-3"  data-bs-toggle="modal" data-bs-target="#login"> Đăng nhập</a></c:if>
                     </div>
                </div>
            </div>
        </nav>

	<h2>Product</h2>
<form:form action="/java5_Lab5/product/add" method="post" modelAttribute="product">
	<div class="row">
		<div class="col-sm-9">
		<div>
		<label>Name</label>
		<form:input cssClass="form-control" path="name"/>
		<form:errors element="i" cssClass="text-danger" path="name"> </form:errors>
	</div>
	
	<div>
		<label>Price</label>
		<form:input cssClass="form-control" path="price"/>
		<form:errors element="i" cssClass="text-danger" path="price"> </form:errors>
	</div>
	<div>
		<label>Số lượng</label>
		<form:input cssClass="form-control" path="available"/>
		<form:errors element="i" cssClass="text-danger" path="available"> </form:errors>
	</div>
	<div>
		<label>Category</label>
		<form:select path="category">
			<c:forEach var="ctg" items="${ctgs}">
				<form:option value="${ctg }" label="${ctg.name }" />
			</c:forEach>
		</form:select>
	</div>
	
	</div>
	<div class="col-3">
		<div class="text-center">
		<label >Image</label>
		<br>
		<img alt="" class="col-3" src="/java5_Lab5/img/${ product.image }">
		<input  type="file"  name="image"/>
		<form:errors element="i" cssClass="text-danger" path="image"> </form:errors>
	</div>
	</div>
	
	</div>
	<hr>
	<button class="btn-primary">Create</button>
	<button class="btn-warning" formaction="/java5_Lab5/product/update/${product.id}">Update</button>
	<button class="btn-danger" formaction="/java5_Lab5/product/delete/${product.id}">Delete</button>
</form:form>
<hr>
	<table class="table" >
		<thead>
			<tr>
				<th>IMG</th>
				<th>Name</th>
				<th>Price</th>
				<th>Available</th>
				<th>Category</th>
				<th>Create Date</th>
			</tr>
			
		</thead>
		<tbody>
			<c:forEach var="ctg" items="${prds }">
				<tr>
					<td class="col-2">  <img alt="" class="col-4" src="/java5_Lab5/img/${ctg.image }"> </td>
					<td>${ctg.name }</td>
					<td>${ctg.price }</td>
					<td>${ctg.available }</td>
					<td>${ctg.category.name }</td>
					<td>${ctg.createdDate }</td>
					<td><a href="/java5_Lab5/product/edit/${ctg.id}">edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>