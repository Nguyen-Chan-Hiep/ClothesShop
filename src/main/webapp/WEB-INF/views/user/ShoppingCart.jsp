<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoping Cart</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<c:url value='/resources/images/icons/favicon.png'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/linearicons-v1.0.0/icon-font.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/animate/animate.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/select2/select2.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/perfect-scrollbar/perfect-scrollbar.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/util.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/main.css'/>">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- Cart -->
	<%@ include file="/WEB-INF/views/user/cart.jsp"%>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Shoping Cart </span>
		</div>
	</div>


	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart" id="spCart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
									<th class="column-6">Action</th>
								</tr>
								<c:forEach var="s" items="${cart }">
									<tr class="table_row">
										<td class="column-1">
											<div class="how-itemcart1">
												<img
													src="<c:url value='/resources/images/${s.products.image }'/>"
													alt="IMG">
											</div>
										</td>
										<td class="column-2">${s.products.name }<p id="size">Size:
												${s.product_Size.sizeName }</p>
											<p>Color: ${s.product_Color.colorName }</p></td>
										<td class="column-3">$ ${s.products.price }</td>
										<td class="column-4">
											<div class="wrap-num-product flex-w m-l-auto m-r-0">
												<div
													class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"
													onclick="tru(${s.products.id}, ${s.product_Size.id }, ${s.product_Color.id }, $('#num'+${s.products.id }+${s.product_Size.id }+${s.product_Color.id }).val())">
													<i class="fs-16 zmdi zmdi-minus"></i>
												</div>

												<input
													id="num${s.products.id}${s.product_Size.id }${s.product_Color.id }"
													class="mtext-104 cl3 txt-center num-product" type="number"
													value="${s.soluong }">
												<div
													class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"
													onclick="cong(${s.products.id}, ${s.product_Size.id }, ${s.product_Color.id }, $('#num'+${s.products.id }+${s.product_Size.id }+${s.product_Color.id }).val())">
													<i class="fs-16 zmdi zmdi-plus"></i>
												</div>
											</div>
										</td>
										<td class="column-5"
											id="total${s.products.id}${s.product_Size.id }${s.product_Color.id}">$
											${s.soluong * s.products.price }</td>
										<td class="column-6"><button class="btn btn-danger" onclick="delItemCart(${s.products.id}, ${s.product_Size.id }, ${s.product_Color.id })">Delete</button></td>
									</tr>
								</c:forEach>

							</table>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2"> Shipping: </span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">There are no shipping methods
									available. Please double check your address, or contact us if
									you need any help.</p>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Total: </span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2" id="totall"> $ ${total } </span>
							</div>
						</div>

						<button
							class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Proceed to Checkout</button>
					</div>
				</div>
			</div>
		</div>
	</form>




	<!-- Footer -->
	<%@include file="/WEB-INF/views/user/footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/animsition/js/animsition.min.js'/>"></script>
	<!--===============================================================================================-->
	<%-- <script src="<c:url value='/resources/vendor/bootstrap/js/popper.js'/>"></script> --%>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/select2/select2.min.js'/>"></script>
	<!-- <script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script> -->
	<!--===============================================================================================-->
	<%-- <script
		src="<c:url value='/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script> --%>
	<script>
		/* $('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		}); */

		function tru(pid, co, mau, num){
			var soluong = Number(num);
			var sl = parseInt(document.getElementById("num"+pid+co+mau).value);
			sl = sl -1;
			document.getElementById("num"+pid+co+mau).value = sl;
			if(soluong > 0){
				$.ajax({
	    			type: "POST",
	    	        data:{
	    	        	pid: pid,
	    	        	co: co,
	    	        	mau: mau,
	    	        	soluong: soluong
	    	        },
	    	        url: "http://localhost:8080/BTLLTUDWEB/tru",
	    	         success: function(res) {
	    	        	 var kq = res.split(',');
	    	        	 document.getElementById("total"+pid+co+mau).innerHTML = "$ "+kq[0];
	    	        	 document.getElementById("totall").innerHTML = "$ "+kq[1];
	    	    	},
	    			error: function(xhr){
	    				alert("Loi");
	    			}
	    		});
			}
		}
		
		function cong(pid, co, mau, num){
			var soluong = Number(num);
			var sl = parseInt(document.getElementById("num"+pid+co+mau).value);
			sl = sl +1;
			document.getElementById("num"+pid+co+mau).value = sl;
				$.ajax({
	    			type: "POST",
	    	        data:{
	    	        	pid: pid,
	    	        	co: co,
	    	        	mau: mau,
	    	        	soluong: soluong
	    	        },
	    	        url: "http://localhost:8080/BTLLTUDWEB/cong",
	    	         success: function(res) {
	    	        	 var kq = res.split(',');
	    	        	 document.getElementById("total"+pid+co+mau).innerHTML = "$ "+kq[0];
	    	        	 document.getElementById("totall").innerHTML = "$ "+kq[1];
	    	    	},
	    			error: function(xhr){
	    				alert("Loi");
	    			}
	    		});
		}
		
		function delItemCart(pid, sizeId, colorId){
			
			$.ajax({
    			type: "POST",
    	        data:{
    	        	pid: pid,
    	        	co: sizeId,
    	        	mau: colorId
    	        },
    	        url: "http://localhost:8080/BTLLTUDWEB/delItemCart",
    	         success: function(res) {
    	        	 var data = document.getElementById("spCart");
    	        	 if(res != ""){
    	 	        		var tam = "";
    	 	        		res = res.substr(0, res.length - 1);
    	 		            var str = res.split(":");
    	        			for(let stringg of str){
    	 		            	var pro = stringg.split(",");
    	 		            	data +="<tr class=\"table_row\">\r\n"
    	 		           		+ "										<td class=\"column-1\">\r\n"
    	 		       		+ "											<div class=\"how-itemcart1\">\r\n"
    	 		       		+ "												<img\r\n"
    	 		       		+ "													src=\"<c:url value='/resources/images/"+pro[0]+"'/>\"\r\n"
    	 		       		+ "													alt=\"IMG\">\r\n"
    	 		       		+ "											</div>\r\n"
    	 		       		+ "										</td>\r\n"
    	 		       		+ "										<td class=\"column-2\">"+pro[1]+"<p id=\"size\">Size:\r\n"
    	 		       		+ "												"+pro[5]+"</p>\r\n"
    	 		       		+ "											<p>Color: "+pro[6]+"</p></td>\r\n"
    	 		       		+ "										<td class=\"column-3\">$"+pro[2]+"</td>\r\n"
    	 		       		+ "										<td class=\"column-4\">\r\n"
    	 		       		+ "											<div class=\"wrap-num-product flex-w m-l-auto m-r-0\">\r\n"
    	 		       		+ "												<div\r\n"
    	 		       		+ "													class=\"btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m\"\r\n"
    	 		       		+ "													onclick=\"tru("+pro[4]+", "+pro[5]+", "+pro[6]+", $('#num'+"+pro[4]+"+"+pro[5]+"+"+pro[6]+").val())\">\r\n"
    	 		       		+ "													<i class=\"fs-16 zmdi zmdi-minus\"></i>\r\n"
    	 		       		+ "												</div>\r\n"
    	 		       		+ "\r\n"
    	 		       		+ "												<input\r\n"
    	 		       		+ "													id=\"num${s.products.id}${s.product_Size.id }${s.product_Color.id }\"\r\n"
    	 		       		+ "													class=\"mtext-104 cl3 txt-center num-product\" type=\"number\"\r\n"
    	 		       		+ "													 value=\""+pro[3]+"\">\r\n"
    	 		       		+ "\r\n"
    	 		       		+ "												<div\r\n"
    	 		       		+ "													class=\"btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m\"\r\n"
    	 		       		+ "													onclick=\"cong("+pro[4]+", "+pro[5]+", "+pro[6]+", $('#num'+"+pro[4]+"+"+pro[5]+"+"+pro[6]+").val())\">\r\n"
    	 		       		+ "													<i class=\"fs-16 zmdi zmdi-plus\"></i>\r\n"
    	 		       		+ "												</div>\r\n"
    	 		       		+ "											</div>\r\n"
    	 		       		+ "										</td>\r\n"
    	 		       		+ "										<td class=\"column-5\"\r\n"
    	 		       		+ "											id=\"total"+pro[4]+pro[5]+pro[6]+">$\r\n"
    	 		       		+ "											"+pro[7]+"</td>\r\n"
    	 		       		+ "										<td class=\"column-6\"><button class=\"btn btn-danger\" onclick=\"delItemCart("+pro[4]+", "+pro[5]+", "+pro[6]+")\">Delete</button></td>\r\n"
    	 		       		+ "									</tr>";
    	 		            }
    	        			
    	 	        	}
    	    	},
    			error: function(xhr){
    				alert("Loi");
    			}
    		}); 
		}
	</script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/js/main.js'/>"></script>

</body>
</html>