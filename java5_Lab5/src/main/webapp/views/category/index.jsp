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

<h2>Category</h2>
<form:form action="/java5_Lab5/category/add" method="post" modelAttribute="category">
	<label>Name category</label>
	<form:input cssClass="form-control" path="name"/>
	<form:errors element="i" cssClass="text-danger" path="name"></form:errors>
	<hr>
	<button class="btn-primary">Create</button>
	<button class="btn-warning" formaction="/java5_Lab5/category/update/${category.id}">Update</button>
	<button class="btn-danger" formaction="/java5_Lab5/category/delete/${category.id}">Delete</button>
</form:form>
<hr>
	<table class="table" >
		<thead>
			<tr>
				<th>Id</th>
				<th>name</th>
			</tr>
			
		</thead>
		<tbody>
			<c:forEach var="ctg" items="${ctgs }">
				<tr>
					<td>${ctg.id }</td>
					<td>${ctg.name }</td>
					<td><a href="/java5_Lab5/category/edit/${ctg.id}">edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>