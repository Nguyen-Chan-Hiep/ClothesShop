<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product</title>
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
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<form action="addP" class="tm-edit-product-form" method="post"
						name="addproduct">
						<div class="form-group">
							<label for="name">Product Name </label> <input id="name"
								name="name" type="text" class="form-control validate" required />
						</div>
						<div class="form-group mb-3">
							<label for="description">Description</label>
							<textarea class="form-control validate" id="description"
								name="description" rows="3" required></textarea>
						</div>
						<div class="form-group">
							<label for="category">Gender</label> <select
								class="custom-select tm-select-accounts" id="gender"
								name="gender">
								<option selected>Men</option>
								<option selected>Women</option>
							</select>
						</div>
						<div class="form-group ">
							<label for="price"> Price </label> <input id="price" name="price"
								type="number" class="form-control validate" required />
						</div>
						<div class="form-group">
							<label for="name">Link Image </label> <input id="image"
								name="image" type="text" class="form-control validate" required />
						</div>
						<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Add
								Product Now</button>
						</div>
					</form>
				</div>
			</div>
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
