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
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<div class="" id="home">
		<%@ include file="/WEB-INF/views/admin/Navbar.jsp"%>
		<div class="container mt-5">
			<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
						<h2 class="tm-block-title">List of Accounts</h2>
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">ACCOUNTS USERNAME</th>
									<th scope="col">ACCOUNTS FIRST NAME</th>
									<th scope="col">ACCOUNTS LAST NAME</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listCus }" var="listCus">
									<tr>
										<th></th>
										<td><a href="edit_customer?aid=${listCus.id }"  style="color: white">${listCus.username }</a></td>
										<td><a href="edit_customer?aid=${listCus.id }" style="color: white">${listCus.firstname }</a></td>
										<td><a href="edit_customer?aid=${listCus.id }" style="color: white">${listCus.lastname }</a></td>
										<td><a href="delCustomers?aid=${listCus.id }"
											class="tm-product-delete-link" style="color: white"> <i
												class="far fa-trash-alt tm-product-delete-icon"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
