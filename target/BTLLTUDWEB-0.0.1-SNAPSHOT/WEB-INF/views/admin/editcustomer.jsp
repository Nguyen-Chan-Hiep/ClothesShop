<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Accounts - Product Admin</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
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
		<%@ include file="/WEB-INF/views/admin/Navbar.jsp"%>
		<div class="container tm-mt-big tm-mb-big">
			<div class="row">
				<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
						<div class="row">
							<div class="col-12">
								<h2 class="tm-block-title d-inline-block">Edit Customer</h2>
							</div>
						</div>
						<form action="updateCus?cid=${customer.id}" method="post"
							class="tm-edit-product-form">
							<div class="form-group">
								<label for="uname">User Name</label> <input id="uname"
									name="uname" value=" ${customer.username} " type="text"
									class="form-control validate" />
							</div>
							<div class="form-group">
								<label for="fname">First Name</label> <input id="fname"
									name="fname" value=" ${customer.firstname} " type="text"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="lname">Last Name</label> <input id="lname"
									name="lname" value=" ${customer.lastname } " type="text"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="email">Account Email</label> <input id="email"
									name="email" type="email" value="${cusinfo.email }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="password">Password</label> <input id="password"
									name="password" type="password" value="${customer.password }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="password2">Re-enter Password</label> <input
									id="password2" name="password2" type="password"
									value="${customer.password }" class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="phone">Phone</label> <input id="phone" name="phone"
									type="tel" value="${cusinfo.phone }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="address1">Address1</label> <input id="address1"
									name="address1" type="text" value="${cusinfo.address1 }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="address2">Address2</label> <input id="address2"
									name="address2" type="text" value="${cusinfo.address2 }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="city">City</label> <input id="city" name="city"
									type="text" value="${cusinfo.city }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label for="country">Country</label> <input id="country"
									name="country" type="text" value="${cusinfo.country }"
									class="form-control validate" />
							</div>
							<div class="form-group ">
								<label class="tm-hide-sm">&nbsp;</label>
								<button type="submit"
									class="btn btn-primary btn-block text-uppercase">
									Update Your Profile</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/Footer.jsp"%>
	</div>

	<script
		src="<c:url value='/resources/admin_resources/js/jquery-3.3.1.min.js'/>"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<c:url value='/resources/admin_resources/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>
