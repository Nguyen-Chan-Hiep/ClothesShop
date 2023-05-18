<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/styleDetail.css"/>"
	rel="stylesheet" type="text/css" />
</head>
<style>
#snackbar {
	visibility: hidden;
	width: 350px;
	height: 120px;
	margin-left: -125px;
	text-align: center;
	border-radius: 5px;
	border: 1px solid black;
	padding: 16px;
	position: fixed;
	z-index: 1000;
	left: 50%;
	bottom: 300px;
	font-size: 20px;
	background: #339933;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
</style>
<body>

	<div class="shopping-cart" id="quaylai">
		<div class="px-4 px-lg-0">

			<div class="pb-5">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

							<!-- Shopping cart table -->
							<div class="table-responsive">
								<div
									class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold"
									style="margin-bottom: 10px;">
									Địa chỉ nhận hàng:<br>

								</div>
								<table class="table">
									<thead>
										<tr>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">Size-Màu sắc</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="py-2 text-uppercase">Đơn Giá</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="py-2 text-uppercase">Số Lượng</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="py-2 text-uppercase">Tổng tiền</div>
											</th>
										</tr>
									</thead>
									<tbody id="cartItem" style="text-align: center;">
										<c:forEach var="o" items="${payment }">
											<tr>
												<th scope="row">
													<div class="p-2">
														<img
															src="<c:url value='/resources/img/${o.getProducts().image}'/>"
															alt="" width="70" class="img-fluid rounded shadow-sm">
														<div class="ml-3 d-inline-block align-middle">
															<h5 class="mb-0">
																<a href="#" class="text-dark d-inline-block">${o.getProducts().name}</a>
															</h5>
															<span class="text-muted font-weight-normal font-italic"></span>
														</div>
													</div>
												</th>
												<td class="align-middle">${o.product_Size.sizeName}-${o.product_Color.colorName }</td>
												<td class="align-middle"><input style="border: 0px"
													id="price" name="price" value="${o.getProducts().price}"
													readonly="readonly"></td>
												<td class="align-middle">${o.soluong}</td>
												<td class="align-middle">${o.soluong * o.getProducts().price}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!-- End -->
						</div>
					</div>
					<div class="col-lg-6">
						<div class="p-4">
							<b>Total: ${tongcong } $</b>
						</div>
						<div class="p-4">

							<button onclick="sendPrivateMessage()" style="margin-left: 340px"
								class="btn btn-dark rounded-pill py-2 btn-block">Đặt
								hàng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-success text-white" id="snackbar">
		<div>
			<i class="fa fa-check-circle"></i>
		</div>
		<strong>Đặt hàng thành công</strong>

	</div>

</body>
<script type="text/javascript">
    /* function buyy(){
    	if()
    	$.ajax({
			type: "POST",
	        url: "http://localhost:8080/BTLLTUDWEB/dathang",
	         success: function(result) {
	        	 var x = document.getElementById("snackbar");
	    		  x.className = "show";	
	    		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 1000);
	    		  var xx = document.getElementById("quaylai");
	    		  xx.innerHTML = "<div>\r\n"
	    				+ "				<div style=\"margin-left: 590px; margin-top: 200px; font-size: 20px; margin-bottom: 10px\"><strong>Cảm ơn đã mua hàng</strong></div>\r\n"
	    				+ "				<a href=\"http://localhost:8080/BTLLTUDWEB/home\"><button class=\"fa fa-arrow-left bg-warning text-white\" style=\"margin-left: 590px ; height: 50px; border-radius: 5px\"> Quay lai trang chủ</button></a>\r\n"
	    				+ "			</div>";
	    			  
	    	},
			error: function(xhr){
				alert("Loi");
			}
		});
	} */
	
    var privateStompClient = null;

    var socket = new SockJS('/BTLLTUDWEB/ws');
    privateStompClient = Stomp.over(socket);
    /* privateStompClient.connect({}, function(frame) {
            console.log(frame);
            privateStompClient.subscribe('/user/specific', function(result) {
            console.log(result.body)
                show(JSON.parse(result.body));
            });
        }); */


     function sendPrivateMessage() {
        
        privateStompClient.send("/app/private", {},
          JSON.stringify({'text':"", 'to':'admin'}));
    }
    </script>
</html>
