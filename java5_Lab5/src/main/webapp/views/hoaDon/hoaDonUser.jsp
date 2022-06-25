<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đơn hàng</title>
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
        		<div class="text-center"><h3>Đơn hàng</h3></div>
        		
        		<table class="table" style="vertical-align: middle;">
        			<thead class="text-while ">
        				<tr>
        					<th>Tên</th>
        					<th>Địa chỉ</th>
        					<th>Tổng tiền</th>
        					<th>Trạng thái</th>
        					<th></th>
        				</tr>
        			</thead>
        			
        			<tbody >
        			
        				<c:forEach items="${listHD }" var="hd">
        				<c:set var="sum" scope = "session" value="${0 }"></c:set>
        					<tr>
        						<td>${hd.key.user.fullname }</td>
        						<td>${hd.key.address }</td>
        						
        						 <c:forEach var="orderDetai" items="${hd.value }">
        							<c:set var="sum" value="${sum+orderDetai.quatity*orderDetai.price}"></c:set>
        						 </c:forEach>
        						 <td>${ sum }VND</td>
        						 <td>
        						 	<%-- User--%>
        						 	<c:choose>
        						 		<c:when test="${ hd.key.giaoHang==2 }"> Đang giao hàng</c:when>
        						 		<c:when test="${ hd.key.giaoHang==1  } "> Đang gói hàng</c:when>
        						 		<c:when test="${ hd.key.giaoHang==3 }"> Đã nhận </c:when>
        						 		<c:when  test="${ hd.key.giaoHang==-3 }"> Đang yêu cầu hoàn trả </c:when>
        						 		<c:when test="${ hd.key.giaoHang==-2 }"> Hoàn trả</c:when>
        						 	</c:choose>
        						 	
        						 </td>
        							
        							<td  class="border-start-0 col-2">
	        						
	        						 <c:if test="${ hd.key.giaoHang==1 }"><a href="/java5_Lab5/hoaDon/trangthaigiaohang/huydon/${hd.key.id }" class="btn btn-danger">Hủy đơn</a></c:if>
	        						 <c:if test="${ hd.key.giaoHang==2 }"><a href="/java5_Lab5/hoaDon/trangthaigiaohang/ycHoanTra/${hd.key.id }" class="btn btn-warning my-2">Yêu cầu hoàn đơn</a></c:if>
	        						 <c:if test="${ hd.key.giaoHang==2 }"><a href="/java5_Lab5/hoaDon/trangthaigiaohang/danhan/${hd.key.id }" class="btn btn-primary">Đã nhận</a></c:if>
	        						
	        						<%-- Admin --%>
		        						
	        						</td>
        					</tr>
        					<tr>
        						<td colspan="4">
        							<div class="row">
        								<c:forEach var="orderDetai" items="${hd.value }">
							        		<div class="col-2 ">
							        			<div class="card mb-3 ">
								        			<img alt="" class="card-img-top" src="/java5_Lab5/img/${ orderDetai.product.image }">
								        			<p class="text-truncate ms-1">${orderDetai.product.name }</p>
								        			<p class="text-truncate ms-1">SL: ${orderDetai.quatity }</p>
							        			</div>
							        		</div>
							        	</c:forEach>
        							</div>
        						</td>
        					</tr>
        				</c:forEach>
        				
        			 </tbody>
        			 
        		</table>
        		
        		
        </div>
        <!-- Footer-->
       
       
    </body>
<script src="/java5_Lab5/bootstrap/js/jquery.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/popper.min.js"></script>
<script src="/java5_Lab5/bootstrap/js/bootstrap.min.js"></script>
</html>