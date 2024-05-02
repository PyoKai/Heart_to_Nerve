<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Admin Add</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
 -->
 <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/fonts/fontawesome5-overrides.min.css">
</head>
<style>
	.error2{
		color:red;
	}
	
	.text-secondary-reg {
         color: black !important;
      }

</style>

<body id="page-top">
	<div id="wrapper">

		<jsp:include page="layouts/adminsidebar.jsp"></jsp:include>

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<jsp:include page="layouts/adminheader.jsp"></jsp:include>

				<div class="container-sm">
					<div class="card shadow">
						<div class="card-header py-3">
							<div class="row">
								<div class="col-md-9">
									<h4 class="text-secondary-reg m-3" align="center">Admin
										Registration</h4>
								</div>
								
							</div>
						</div>
						
						<div class="card-body">
							<form:form action="adminAdded" method="post"
								modelAttribute="admin">
							
							<div style="color: red;">${error}</div>
							
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> 
										Name</label>
									<div class="col-md-4">
										<form:input type="text" class="form-control" id="name"
											path="name" />
										<form:errors path="name" cssClass="error2"></form:errors>
										
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="email" class="col-md-2 col-form-label">
										Email</label>
									<div class="col-md-4">
										<form:input type="email" class="form-control" id="email"
											path="email" />
										<form:errors path="email" cssClass="error2"></form:errors>
										<div style="color: red;">${erroremail}</div>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="Passowrd" class="col-md-2 col-form-label">
										Passowrd</label>
									<div class="col-md-4">
										<form:input type="password" class="form-control" id="password"
											path="password" />
										<form:errors path="password" cssClass="error2"></form:errors>
										
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="confirmPassword" class="col-md-2 col-form-label">Confirm
										Passowrd</label>
									<div class="col-md-4">
										<form:input type="password" class="form-control"
											id="confirmPassword" path="confirmPassword" />
										<form:errors path="confirmPassword" cssClass="error2"></form:errors>
										<div style="color: red;">${errorpass}</div>
									</div>
								</div>
								
								<%-- <div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="userRole" class="col-md-2 col-form-label">User
										Role</label>
									<div class="col-md-4">
										<form:select path="role" class="form-select" aria-label="role"
											id="role">
											<form:option value="Admin">Admin</form:option>
											<form:option value="User">User</form:option>
										</form:select>
									</div>
								</div> --%>
								<div class="row mb-4">
									<div class="col-md-4"></div>

									<div class="col-md-6">

										<button type="submit" class="btn btn-primary col-md-2">Add</button>


									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<!--  content end  -->

			<%-- <jsp:include page="layouts/adminfooter.jsp"></jsp:include> --%>

		</div>
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
			class="fas fa-angle-up"></i></a>
	</div>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/theme.js"></script>
</body>

</html>