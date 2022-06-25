<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết</title>
<link rel="stylesheet" href="/java5_Lab5/bootstrap/css/bootstrap.min.css">
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
                     
                </div>
            </div>
        </nav>
     	
        <!-- Header-->
        <c:if test="${ !empty sessionScope.msg }">
        	<div class="alert alert-success">
    		${ sessionScope.msg  }
    	</div>
        </c:if>
         <c:if test="${ !empty sessionScope.error }">
        	<div class="alert alert-danger">
    		${ sessionScope.error  }
    	</div>
        </c:if>
    	<c:remove var="msg" scope="session"/>
    	<c:remove var="error" scope="session"/>
        
        <div class="container my-5 h-100">
        	<div class="row">
        	
        		<div class="col-3">
        			<img alt="" class="card-img-top" src="/java5_Lab5/img/${ product.image }">
	        		
        		</div>
	        	<div class="col-8 ms-2">
	        		<h3 class="text-danger mb-3">${product.name }</h3>
	        		<h5> <i>${product.price} VND</i> </h5>
	        		<p>Số lượng: ${product.available }</p>
	        		<p>Thể loại: ${product.category.name } </p>
	        		<button class="btn btn-primary mt-auto">Thêm vào giỏ</button>
	        	</div>
        	
        	</div>
        	<h2 class="mt-3">Sản phẩm tương tự</h2>
        <hr>
        <div class="row">
        	<c:forEach var="pr" items="${sptt }">
        		<div class="col-2 ">
        			<div class="card mb-3 ">
        			<a href="/java5_Lab5/product/chiTiet/${pr.id}"><img alt="" class="card-img-top" src="/java5_Lab5/img/${ pr.image }"></a>
        			<p class="text-truncate ms-1">${pr.name }</p>
        			<a href="/java5_Lab5/gioHang/themVaoGio/${pr.id }" class="border-0 btn-primary card-footer btn bg-dark  ">Thêm vào giỏ</a>
        			</div>
        		</div>
        	</c:forEach>
        </div>
        </div>
        
        <!-- Footer-->
       
       
    </body>
<script src="/java5_Lab5/bootstrap/js/jquery.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/popper.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>