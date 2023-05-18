<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Admin</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/fontawesome.min.css'/>">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/bootstrap.min.css'/>">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/templatemo-style.css'/>">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->

</head>

<body id="reportsPage">
	<div class="" id="home">
		<%@include file="/WEB-INF/views/admin/Navbar.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="text-white mt-5 mb-5">
						Welcome back, <b>${employee.firstname } ${employee.lastname}</b>
					</p>
				</div>
			</div>
			<!-- row -->
			<div class="col-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
					<h2 class="tm-block-title">Orders List</h2>
					<table class="table">
						<thead style="text-align: center;">
							<tr>
								<th scope="col">Khách hàng</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col">Trạng thái</th>
								<th scope="col">Xem chi tiết</th>
							</tr>
						</thead>
						<tbody  style="text-align: center;" class="text-black">
						<c:forEach var="s" items="${listOrders.keySet()}">
					
							<tr>
								<td><b>${listOrders.get(s).customers.firstname} ${listOrders.get(s).customers.lastname}</b></td>
								<td><b>${listOrders.get(s).customers_info.address1}</b></td>
								<c:if test="${listOrders.get(s).list.get(0).status == 0 }">
									<td id="${s+1000}">
										<div><i class="fas fa-window-close" style="color: red; font-size: 20px; margin-top: 3px;"></i> Đang chờ duyệt đơn</div>
									</td>
								</c:if>
								<c:if test="${listOrders.get(s).list.get(0).status == 1 }">
									<td id="${s + 1000 }">
										<div style="margin-right: 10px;"><i class="fas fa-check-square" style="font-size: 20px; color: #33FF4F; margin-right: 10px;"></i> Đã duyệt đơn</div>
									</td>
								</c:if>
								<td>
									<button onclick="test(${s})" type="button" class="btn btn-success" id="btn" data-toggle="modal">Xem chi tiết</button>
								</td>
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModalCenter"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Chi tiết đơn hàng</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <table style="border: 1px ; width: 50%">
	        	<tr>
	        		<th>Product Name</th>
	        		<th>Size-Màu sắc</th>
	        		<th>Số lượng</th>
	        		<th>Đơn giá</th>
	        	</tr>
	        </table>
	      </div>
	      <div class="modal-footer" id="xx">
	        <button onclick="testt(x)" id="x" type="button" class="btn btn-success text-red" data-dismiss="modal">Duyệt đơn</button>
	      </div>
	    </div>
	  </div>
	</div>
	<%@ include file="/WEB-INF/views/admin/Footer.jsp"%>
	

	<script
		src="<c:url value='/resources/admin_resources/js/jquery-3.3.1.min.js'/>"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/moment.min.js'/>"></script>
	<!-- https://momentjs.com/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/Chart.min.js'/>"></script>
	<!-- http://www.chartjs.org/docs/latest/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/tooplate-scripts.js'/>"></script>
	<script>
		Chart.defaults.global.defaultFontColor = 'white';
		let ctxLine, ctxBar, ctxPie, optionsLine, optionsBar, optionsPie, configLine, configBar, configPie, lineChart;
		barChart, pieChart;
		// DOM is ready
		$(function() {
			drawLineChart(); // Line Chart
			drawBarChart(); // Bar Chart
			drawPieChart(); // Pie Chart

			$(window).resize(function() {
				updateLineChart();
				updateBarChart();
			});
		})
		function test(x){
			$.ajax({
		        type: "POST",
		        data:{
		        	query: x
		        },
		        url: "http://localhost:8080/BTLLTUDWEB/chitiet",
	 	        success: function(res) {
	 	        	$("#exampleModalCenter").html(res);
			            $("#exampleModalCenter").modal();
		    	},
				error: function(xhr){
					alert("Loi");
				}
		    	
			});
			
		}
		function testt(y){
			$.ajax({
		        type: "POST",
		        data:{
		        	status: y
		        },
		        url: "http://localhost:8080/BTLLTUDWEB/duyetdon",
	 	        success: function(res) {
	 	        	var idd = y + 1000;
	 	        	var status = document.getElementById(idd);
	 	        	status.innerHTML = res;
	 	        	var x = document.getElementById("x");
	 	        	x.innerHTML = res;
	 	        	
		    	}, 
				error: function(xhr){
					alert("Loi");
				}
		    	
			});
			
		}
	</script>
</body>

</html>