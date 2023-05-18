<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manager</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/manager.css" rel="stylesheet" type="text/css" />
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Manage <b>Orders</b>
						</h2>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover" id="order">
				<thead>
					<tr>
						<th><h3>Customer</h3></th>
						<th><h3>Actions</h3></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOrder.keySet()}" var="o">
						<tr>
							<td>${o}</td>
							<td><a href="#addEmployeeModal" class="delete"
								data-toggle="modal"><i class="btn btn-success">Xem chi
										tiết</i></a>
								<div id="addEmployeeModal" class="modal fade">
									<div class="modal-dialog" style="width: 500px;">
										<div class="modal-content">
											<table class="table table-striped table-hover">
												<thead>
													<tr>
														<th>Product Name</th>
														<th>Số Lượng</th>
														<th>Đơn Giá</th>
														<th>Thành tiền</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${listOrder.get(o)}" var="s">
														<tr>
															<td>${s.productname }</td>
															<td>${s.soluong }</td>
															<td>${s.dongia }</td>
															<td>${s.thanhtien }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
var stompClient = null;
var privateStompClient = null;

/* var socket = new SockJS('/SpringMVCSecurity/ws');
stompClient = Stomp.over(socket);
stompClient.connect({}, function(frame) {
    console.log(frame);
    stompClient.subscribe('/all/messages', function(result) {
        show(JSON.parse(result.body));
    });
}); */

socket = new SockJS('/BTLLTUDWeb/ws');
privateStompClient = Stomp.over(socket);
privateStompClient.connect({}, function(frame) {
        console.log(frame);
        privateStompClient.subscribe('/user/specific', function(result) {
        console.log(result.body)
            show();
        });
    });


/* function sendMessage() {
    var text = document.getElementById('text').value;
    stompClient.send("/app/application", {},
      JSON.stringify({'text':text}));
} */

	 function sendPrivateMessage() {
	    
	    var to = document.getElementById('to').value;
	    privateStompClient.send("/app/private");
	}
		var num = 0;
	function show() {
	
		/* num++;
	    var response = document.getElementById('messages');
	    var p = document.createElement('p');
	    p.innerHTML= "message: "  + message.text;
	    var soluong = document.getElementById('soluong');
	    soluong.innerHTML = num;
	    response.appendChild(p); */
	    alert("da vao day");
	}
</script>
</html>