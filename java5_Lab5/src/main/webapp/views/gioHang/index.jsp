<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/hoangndph13827_Assignment/trangchu">Home</a></li>
                        <li class="nav-item"> <c:if test="${ sessionScope.user!=null }"><a class="nav-link"  href="#">Giỏ hàng</a></c:if> </li>
							
                        <c:if test="${ sessionScope.user.admin==1}">
                        	<li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                <li><a class="dropdown-item" href="/java5_Lab5/account/index">Account </a></li>
	                                <li><hr class="dropdown-divider" /></li>
	                                <li><a class="dropdown-item" href="/java5_Lab5/product/index">Product</a></li>
	                                <li><a class="dropdown-item" href="/java5_Lab5/category/index">Category</a></li>
	                            </ul>
                       		</li>
                        </c:if>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                     </form>
                     <c:if test="${ sessionScope.user!=null}">${sessionScope.user.fullname }</c:if>
                     <c:if test="${ sessionScope.user==null}"><a class="btn btn-info mx-3"  data-bs-toggle="modal" data-bs-target="#login"> Đăng nhập</a></c:if>
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
			       		<div>
			       			<label>Tài khoản</label>
			       			<form:input cssClass="form-control" path="username"/>
			       			<form:errors element="i" cssClass="text-danger" path="username"> </form:errors>
			       		</div>
			        	<div class="mx-2">
			       			<label>Mật khẩu</label>
			       			<form:password cssClass="form-control" path="password"/>
			       			<form:errors element="i" cssClass="text-danger" path="password"> </form:errors>
			       		</div>
			       		<button  class="btn btn-primary">Đăng Nhập</button>
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
        
        
        <div class="container my-5 ">
        	<div class="row"> <a href="/java5_Lab5/gioHang/index" class="nav-item">Giỏ hàng</a>/<a href="/java5_Lab5/hoaDon/user/index" class="nav-item">Đơn hàng</a> / <a href="/java5_Lab5/gioHang/index" class="nav-item">Đơn hoàn thành</a> </div>
        		<div class="text-center"><h3  >Giỏ hàng</h3></div>
        		<table class="table" style="vertical-align: middle;">
        			<thead class="text-while ">
        				<tr>
        					<th></th>
        					<th>Name</th>
        					<th>Giá</th>
        					<th>Số lượng</th>
        					<th></th>
        				</tr>
        			</thead>
        			
        			<tbody >
        			
        				<c:forEach items="${sessionScope.listPrd }" var="prd">
        					<form:form action="/java5_Lab5/gioHang/update/${prd.id }" method="post" modelAttribute="prd">
        						<tr>
		        					<td class="col-2">  <img alt="" class="col-4" src="/java5_Lab5/img/${prd.image }"> </td>
		        					<td>${prd.name }</td>
		        					<td>${prd.price }</td>
		        					<td><input type="number" min="1" name="available" class="w-25" value="${ prd.available }" > </td>
		        					<td>
		        					<button class="btn btn-warning">Cập nhật</button>
		        					<a href="/java5_Lab5/gioHang/delete/${prd.id }" class="btn btn-danger">Xóa</a>
		        					</td>
        						</tr>
        					</form:form>
        				</c:forEach>
        				
        			 </tbody>
        			 
        		</table>
        		<div class="text-center"><c:if test="${sessionScope.listPrd.size()==0}"> <h4 >Chưa có gì</h4> </c:if></div>
        		<hr>
        		<div class="text-left">
        			<h4>Tổng tiền: ${tongTien }</h4>
        			<hr>
        			
					<c:choose>
						<c:when test="${sessionScope.listPrd.size()==0}"><button disabled type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					 		Tạo đơn hàng
							</button>
						</c:when>
						<c:otherwise><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					 	Tạo đơn hàng
					</button></c:otherwise>
					</c:choose>
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form:form action="/java5_Lab5/gioHang/taoDon" method="post" modelAttribute="order">
					        	<label class="mx-2">Địa chỉ</label>
					        	<form:input cssClass="form-control mx-2" path="address"/>
					        	<button class="mt-3 btn btn-primary">Ok</button>
					        </form:form>
					      </div>
					      
					    </div>
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