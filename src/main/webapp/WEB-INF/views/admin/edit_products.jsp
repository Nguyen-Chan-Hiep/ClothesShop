<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Edit Product</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

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
	href="<c:url value='/resources/admin_resources/jquery-ui-datepicker/jquery-ui.min.css'/>"
	type="text/css" />
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>

	<%@ include file="/WEB-INF/views/admin/Navbar.jsp"%>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Edit Product</h2>
						</div>
					</div>
					<form action="changeProduct" method="post"
						class="tm-edit-product-form">
						<div class="form-group">
							<label for="name">Product Name </label> <input id="name"
								name="name" type="text" value="${product.name }"
								class="form-control validate" /> <input id="pid" name="pid"
								type="hidden" value="${product.id }"
								class="form-control validate" />
						</div>
						<div class="form-group ">
							<label for="description">Description</label>
							<textarea class="form-control validate tm-small" rows="5"
								name="description" required>${product.description}</textarea>
						</div>
						<div class="form-group">
							<label for="category">Gender</label><input id="gender"
								name="gender" readonly value="${product.gender }"
								class="form-control validate" />
						</div>
						<div class="form-group ">
							<label for="price">Price</label> <input id="price" name="price"
								type="number" value="${product.price }"
								class="form-control validate" />
						</div>
						<div class="row">
							<div class="form-group  mb-3 col-xs-12 col-sm-6">
								<label for="sold">Units Sold </label> <input id="sold"
									name="sold" type="number" value="${psizecolor.soluongdaban }"
									class="form-control validate" />
							</div>
							<div class="form-group mb-3 col-xs-12 col-sm-6">
								<label for="stock">Units In Stock </label> <input id="stock"
									name="stock" type="number"
									value="${psizecolor.soluongtrongkho }"
									class="form-control validate" />
							</div>
						</div>
						<div class="row">
							<div class="form-group  mb-3 col-xs-12 col-sm-6">
								<label for="size">Size </label> <input id="size" name="size"
									type="number" value="${psizecolor.size_id }"
									class="form-control validate" />
							</div>
							<div class="form-group mb-3 col-xs-12 col-sm-6">
								<label for="color">Color </label> <input id="color" name="color"
									type="number" value="${psizecolor.idcolor_id }"
									class="form-control validate" />
							</div>
						</div>
						<div class="form-group">
							<label for="image">Product Image </label> <input id="image"
								name="image" type="text" value="${product.image }"
								class="form-control validate" />
						</div>
				</div>
				<div class="col-12">
					<button type="submit"
						class="btn btn-primary btn-block text-uppercase">Update
						Now</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/Footer.jsp"%>

	<script
		src="<c:url value='/resources/admin_resources/js/jquery-3.3.1.min.js'/>"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<c:url value='/resources/admin_resources/jquery-ui-datepicker/jquery-ui.min.js'/>"></script>
	<!-- https://jqueryui.com/download/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>
