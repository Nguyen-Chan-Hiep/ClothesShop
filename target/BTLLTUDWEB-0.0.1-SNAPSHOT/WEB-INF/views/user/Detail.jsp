<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shop Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<c:url value='/resources/images/icons/favicon.png'/>" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
			</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Men <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Lightweight Jacket </span>
		</div>
	</div>


	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
							<div class="wrap-pic-w pos-relative">
								<img id="img"
									src="<c:url value='/resources/images/${p.image }'/>"
									alt="IMG-PRODUCT" height="500px" width="500px">
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">${p.name }</h4>

						<span class="mtext-106 cl2"> $${p.price }</span>

						<p class="stext-102 cl3 p-t-23">${p.description }</p>

						<!--  -->
						<div class="p-t-33">
							<div class="alert alert-warning" id="alertSize" role="alert"
								style="text-align: center; display: none; margin-left: 105px">Choose
								Size !!</div>
							<div class="flex-w flex-r-m p-b-10">

								<div class="size-203 flex-c-m respon6">Size</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" id="size">
											<option>Choose an option</option>
											<option>Size S</option>
											<option>Size M</option>
											<option>Size L</option>
											<option>Size XL</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="alert alert-warning" id="alertColor" role="alert"
								style="text-align: center; display: none; margin-left: 105px">
								Choose Color !!</div>
							<div class="flex-w flex-r-m p-b-10">

								<div class="size-203 flex-c-m respon6">Color</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" id="color">
											<option>Choose an option</option>
											<option>Black</option>
											<option>White</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product" id="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<button
										class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										Add to cart</button>
								</div>
							</div>
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
									data-tooltip="Add to Wishlist"> <i
									class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10"><a class="nav-link active"
							data-toggle="tab" href="#description" role="tab">Description</a>
						</li>

						<li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#information" role="tab">Additional
								information</a></li>

						<li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#reviews" role="tab">Reviews</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description"
							role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">Aenean sit amet gravida nisi. Nam
									fermentum est felis, quis feugiat nunc fringilla sit amet. Ut
									in blandit ipsum. Quisque luctus dui at ante aliquet, in
									hendrerit lectus interdum. Morbi elementum sapien rhoncus
									pretium maximus. Nulla lectus enim, cursus et elementum sed,
									sodales vitae eros. Ut ex quam, porta consequat interdum in,
									faucibus eu velit. Quisque rhoncus ex ac libero varius
									molestie. Aenean tempor sit amet orci nec iaculis. Cras sit
									amet nulla libero. Curabitur dignissim, nunc nec laoreet
									consequat, purus nunc porta lacus, vel efficitur tellus augue
									in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non
									tempor erat. Duis in egestas nunc.</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Weight </span> <span
											class="stext-102 cl6 size-206"> 0.79 kg </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Dimensions </span> <span
											class="stext-102 cl6 size-206"> 110 x 33 x 100 cm </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Materials </span> <span
											class="stext-102 cl6 size-206"> 60% cotton </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Color </span> <span
											class="stext-102 cl6 size-206"> Black, Blue, Grey,
												Green, Red, White </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> Size </span> <span
											class="stext-102 cl6 size-206"> XL, L, M, S </span></li>
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm" id="rv">
									</div>
									<!-- Add review -->
										<div class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">Add a review</h5>
											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<textarea
														class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
														id="review" name="review"></textarea>
												</div>
											</div>

											<button id="sendMessage" onclick="sendMessage(document.getElementById('u').value);"
												class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit</button>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25"> SKU: JAK-01 </span> <span
				class="stext-107 cl6 p-lr-25"> Categories: Jacket, Men </span>
		</div>
	</section>
	<input value="${user.lastname} ${user.firstname}" id="u" hidden="true">
	
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
	<script src="<c:url value='/resources/vendor/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/select2/select2.min.js'/>"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/daterangepicker/moment.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/slick/slick.min.js'/>"></script>
	<script src="<c:url value='/resources/js/slick-custom.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/parallax100/parallax100.js'/>"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js'/>"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/isotope/isotope.pkgd.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/sweetalert/sweetalert.min.js'/>"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					
					$(this).on('click', function() {
						
						if(${user != null}){
			    			
			                var size = document.getElementById("size");
			                var color = document.getElementById("color");
			                if(size.options[size.selectedIndex].text == "Choose an option"){
			                	document.getElementById("alertSize").style.display = "inline-block";
			                	
			                }
			                else{
			                	document.getElementById("alertSize").style.display = "none";
			                	if(color.options[color.selectedIndex].text == "Choose an option"){
			                		document.getElementById("alertColor").style.display = "inline-block";
			                	}
			                	else{
			                		var data = document.getElementById("cart");
			                		var total = document.getElementById("total");
			                		var numcart = document.getElementById("lblCartCount");
			                		document.getElementById("alertColor").style.display = "none";
			                		var co = size.selectedIndex;
			                        var mau = color.selectedIndex;
			                        
			                       	$.ajax({
			                			type: "POST",
			                	        data:{
			                	        	quantity: $(".num-product").val(),
			                	        	co: co+1,
			                	        	mau: mau,
			                	        	pid: ${p.id}
			                	        },
			                	        url: "http://localhost:5332/BTLLTUDWEB/add",
			                	        success: function(res) {
			                	        	 
			                	        	 if(res != ""){
			                	 	        		var tam = "";
			                	 	        		res = res.substr(0, res.length - 1);
			                	 		            var str = res.split(":");
			                	 		            total.innerHTML = "Total: $"+str[str.length-2];
			                	        			for(let stringg of str){
			                	        				if(stringg != str[str.length-2] && stringg != str[str.length-1] ){
			                	        					var pro = stringg.split(",");
				                	 		            	tam +="<li class=\"header-cart-item flex-w flex-t m-b-12\">\r\n"
				                	 		           		+ "					<div class=\"header-cart-item-img\">\r\n"
					                	 		       		+ "						<img src=\"<c:url value='/resources/images/"+pro[0]+"'/>\"\r\n"
					                	 		       		+ "							alt=\"IMG\">\r\n"
					                	 		       		+ "					</div>\r\n"
					                	 		       		+ "\r\n"
					                	 		       		+ "					<div class=\"header-cart-item-txt p-t-8\">\r\n"
					                	 		       		+ "						<a href=\"#\" class=\"header-cart-item-name m-b-18 hov-cl1 trans-04\">\r\n"
					                	 		       		+ "							"+pro[1]+" </a>"
					                	 		       		+"<span class=\"header-cart-item-info\">\r\n"
					                	 					+ "									"+pro[4]+" - "+pro[5]+" </span>"
					                	 		       		+" <span class=\"header-cart-item-info\"> "+pro[2]+"\r\n"
					                	 		       		+ "							x $"+pro[3]+" </span>\r\n"
					                	 		       		+ "					</div>\r\n"
					                	 		       		+ "				</li>";
			                	        				}
			                	 		            	
			                	 		            }
			                	        			data.innerHTML = tam;
			                	        			numcart.innerHTML ="<span class='badge badge-warning' id='lblCartCount'>"+str[str.length-1]+"</span>";
			                	 	        	}
			                	        	 swal(nameProduct, "is added to cart !" + $(".num-product").val(), "success");
			                	    	}, 
			                			error: function(xhr){
			                				alert("Loi");
			                			}
			                		}); 
			                        
			                        
			                	}
			                }
			                
			    		}
			    		else{
			    			window.location="http://localhost:5532/BTLLTUDWEB/login/dangnhap";
			    		}
					});
				});
		
		$(".btn-num-product-down").click(function(){
			
			var sl = parseInt(document.getElementById("num-product").value);
			sl = sl-1;
			document.getElementById("num-product").value = sl.toString(10);
			
		});
		
		$(".btn-num-product-up").click(function(){
			var sl = parseInt(document.getElementById("num-product").value);
			sl = sl+1;
			document.getElementById("num-product").value = sl.toString(10);
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script>
		$('.js-pscroll').each(function() {
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
		});
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
    <script type="text/javascript">
            var stompClient = null;
            var privateStompClient = null;

            var socket = new SockJS('/BTLLTUDWEB/ws');
            stompClient = Stomp.over(socket);
            
            stompClient.connect({}, function(frame) {
                console.log(frame);
                stompClient.subscribe('/all/messages-'+${cid}, function(result) {
                    show(JSON.parse(result.body));
                });
            });

           /*  privateStompClient = Stomp.over(socket);
            privateStompClient.connect({}, function(frame) {
                    console.log(frame);
                    privateStompClient.subscribe('/user/specific', function(result) {
                    console.log(result.body)
                        show(JSON.parse(result.body));
                    });
                }); */


            function sendMessage(u) {
            	
                var text = document.getElementById('review').value;
                stompClient.send("/app/application/"+${cid}, {},
                  JSON.stringify({'text':text, 'from': u}));
                document.getElementById('review').value = "";
            }

             /* function sendPrivateMessage() {
                var text = document.getElementById('privateText').value;
                var to = document.getElementById('to').value;
                stompClient.send("/app/private", {},
                  JSON.stringify({'text':text, 'to':to}));
            } */

            function show(message) {
            	var response = document.getElementById('rv');
                response.innerHTML += "<div class=\"flex-w flex-t p-b-68\">\r\n"
                	+ "											<div class=\"wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6\">\r\n"
                	+ "												<img src=\"images/avatar-01.jpg\" alt=\"AVATAR\">\r\n"
                	+ "											</div>\r\n"
                	+ "\r\n"
                	+ "											<div class=\"size-207\">\r\n"
                	+ "												<div class=\"flex-w flex-sb-m p-b-17\">\r\n"
                	+ "													<span class=\"mtext-107 cl2 p-r-20\"> "+message.from+" </span> <span\r\n"
                	+ "														class=\"fs-18 cl11\"> <i class=\"zmdi zmdi-star\"></i>\r\n"
                	+ "														<i class=\"zmdi zmdi-star\"></i> <i class=\"zmdi zmdi-star\"></i>\r\n"
                	+ "														<i class=\"zmdi zmdi-star\"></i> <i\r\n"
                	+ "														class=\"zmdi zmdi-star-half\"></i>\r\n"
                	+ "													</span>\r\n"
                	+ "												</div>\r\n"
                	+ "\r\n"
                	+ "												<p class=\"stext-102 cl6\">"+message.text+"</p>\r\n"
                	+ "											</div>\r\n"
                	+ "										</div>\r\n";

            }
        </script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/js/main.js'/>"></script>

</body>

</html>