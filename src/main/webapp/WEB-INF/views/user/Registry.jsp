<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Registry Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="<c:url value='/resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css'/>">

<!-- STYLE CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/styleRegistry.css'/>">
</head>

<body>

	<div class="wrapper"
		style="background-image: url(<c:url value='/resources/images/bg-registration-form-2.jpg'/>)">
		<div class="inner">
			<form:form action="checkRegistry" modelAttribute="c" method="post">
				<h3>Registration Form</h3>
				<div class="form-group">
					<div class="form-wrapper">
						<label for="">First Name</label>
						<form:input type="text" class="form-control" id="firstname"
							path="firstname" onchange='change()' />
					</div>
					<div class="form-wrapper">
						<label for="">Last Name</label>
						<form:input type="text" class="form-control" id="lastname"
							path="lastname" onchange='change()' />
					</div>
				</div>
				<div class="form-wrapper">
					<label for="">Username</label>
					<form:input type="text" class="form-control" onchange='change()'
						id="username" path="username" />
					<c:if test="${exit != null }">
						<b class="fa fa-warning bg-danger text-white">${exit }</b>
					</c:if>
				</div>
				<div class="form-wrapper">
					<label for="">Password</label>
					<form:input type="password" id="password" class="form-control"
						path="password" />
				</div>
				<div class="form-wrapper">
					<label for="">Confirm Password</label> <input type="password"
						class="form-control" id="repassword" name="repass"
						onchange='check()'> <span id='message'
						class="fa bg-danger text-white"></span>
				</div>
				<span id='message1'></span>
				<button>Register Now</button>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		function check() {
			if (document.getElementById('password').value == document
					.getElementById('repassword').value) {
				document.getElementById('message').innerHTML = "Match";
			} else {
				document.getElementById('message').innerHTML = "No Match";
			}
		}
		function change() {
			if (document.getElementById('username').value == ""
					|| document.getElementById('firstname').value == ""
					|| document.getElementById('lastname').value == "") {
				document.getElementById('message1').innerHTML = "Vui lòng nhập đầy đủ thông tin";
			} else {
				document.getElementById('message1').innerHTML = "";
			}
		}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>