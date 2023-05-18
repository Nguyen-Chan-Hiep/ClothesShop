<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/fontawesome.min.css'/>">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/bootstrap.min.css'/>">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="<c:url value='/resources/admin_resources/css/templatemo-style.css'/>">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<%@ include file='/WEB-INF/views/admin/Navbar.jsp'%>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">PRODUCT NAME</th>
									<th scope="col">DESCRIPTION</th>
									<th scope="col">PRICE</th>
									<th scope="col">LINK IMAGE</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listP }" var="listP">
									<tr>
										<th scope="row"></th>
										<td><a href="edit_product?pid=${listP.id }"
											style="color: white">${listP.name }</a></td>
										<td><a href="edit_product?pid=${listP.id }"
											style="color: white">${listP.description }</a></td>
										<td><a href="edit_product?pid=${listP.id }"
											style="color: white">${listP.price }</a></td>
										<td><img src="${listP.image }"
											style="width: 50px; height: 50px; margin-left: 10px"></td>
										<td><a href="delProduct?pid=${listP.id }"
											class="tm-product-delete-link"> <i
												class="far fa-trash-alt tm-product-delete-icon"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="add_product"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						product</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/Footer.jsp"%>

	<script
		src="<c:url value='/resources/admin_resources/js/jquery-3.3.1.min.js'/>"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
	<script type="text/javascript">
		window.addEventListener("load", function() {
			var addMoreButtons = document.querySelectorAll("#add-more1");
			addMoreButtons.forEach(function(button) {
				button.addEventListener("click", function() {
					console.log(button);
					var div = document.createElement("div");
					var text = document.createElement("input");
					text.setAttribute("type", "text");
					text.setAttribute("name", "More");
					text.setAttribute("size", "30");
					div.appendChild(text);
					button.parentElement.appendChild(div);
				});
			});
		});
	</script>
</body>
</html>