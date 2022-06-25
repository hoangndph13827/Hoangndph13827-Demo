<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
                     <div class="ms-2">
                     	<c:if test="${ sessionScope.user!=null}">${user.fullname } <a href="/java5_Lab5/trangChu/dangXuat">Đăng xuất</a> </c:if>
                  	   <c:if test="${ sessionScope.user==null}"><a class="btn btn-info mx-3"  data-bs-toggle="modal" data-bs-target="#login"> Đăng nhập</a></c:if>
                     </div>
                </div>
            </div>
        </nav>
       <!-- Modal -->
			<div class="modal fade " id="login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Đăng Nhập</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form:form action="/java5_Lab5/trangChu/login" modelAttribute="account" method="post">
			       		<div class="my-2 row" >
			       			<img alt="" class="col-4" src="/java5_Lab5/img/login.png">
			       			<div class="col-8">
				       			<div>
					       			<label>Tài khoản</label>
					       			<form:input cssClass="form-control" path="username"/>
					       			<form:errors element="i" cssClass="text-danger" path="username"> </form:errors>
					       		</div>
					        	<div class="mt-2">
					       			<label>Mật khẩu</label>
					       			<form:password cssClass="form-control" path="password"/>
					       			<form:errors element="i" cssClass="text-danger" path="password"> </form:errors>
					       		</div>
				       		</div>
			       		</div>
			       		<div class="d-flex flex-row-reverse">
			       			<button  class="btn ms-auto btn-primary ">Đăng Nhập </button>
			       		</div>
			       		
			        </form:form>
			      </div>
			      
			    </div>
			  </div>
			</div>
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
        		<div >
        			Category
        		</div>
        		<hr>
        		<div class="card-body">
        			<ul class="list-group list-group-flush">
        			<li class="list-group-item"><a class="nav-link" href="/java5_Lab5/trangChu/allCtg">All</a> </li>
					  <c:forEach var="ctg" items="${ctgs }">
					  	<li class="list-group-item"> <a class="nav-link" href="/java5_Lab5/trangChu/timTheoIdCtg/${ctg.id }">${ctg.name }</a> </li>
					  </c:forEach>
					</ul>
        		</div>
        	</div>
        	<div class="row col-9">
        		<div class="row ">
        		<c:forEach var="pr" items="${prds }">
        		<div class="col-3 ">
        			<div class="card mb-3 ">
        			<a href="/java5_Lab5/product/chiTiet/${pr.id}"><img alt="" class="card-img-top" src="/java5_Lab5/img/${ pr.image }"></a>
        			<p class="text-truncate ms-1">${pr.name }</p>
        			<a href="/java5_Lab5/gioHang/themVaoGio/${pr.id }" class="border-0 btn-primary card-footer btn bg-dark  ">Thêm vào giỏ</a>
        			</div>
        		</div>
        	</c:forEach>
        	</div>
        	</div>
        	</div>
        </div>
        <!-- Footer-->
       
       
    </body>
<script src="/java5_Lab5/bootstrap/js/jquery.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/popper.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>