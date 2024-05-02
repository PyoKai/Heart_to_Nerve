`1	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Admin Profile</title>
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

		#sub_content{
		text-align:center;
	}

</style>

<body id="page-top">
	<div id="wrapper">

		<jsp:include page="layouts/adminsidebar.jsp"></jsp:include>

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<jsp:include page="layouts/adminheader.jsp"></jsp:include>

				<!-- content start  -->
				<div class="container-sm">
					<div class="card shadow">
						<div class="card-header py-3">
							<div class="row">
								<div class="col-md-9">
									<h4 class="text-secondary-reg m-3" align="center">Admin
										Profile</h4>
								</div>
								
							</div>
						</div>
						
						<div class="card-body">

								<p class="text-danger text-center">${error}</p>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> 
										</label>
									<div class="col-md-4">
										<label for="name" class="col-md-2 col-form-label">
											<img src="assets/img/avatars/profile1.jpg" alt="Centered Image" class="rounded-circle me-2" height="100">
    									</label>
									</div>
								</div>


								<!-- <div class="row mb-6">
									<div class="col-md-3"></div>
									<label for="name" class="col-md-2 col-form-label">
									
        								<img src="assets/img/avatars/profile.jpg" alt="Centered Image" class="mx-auto" style="width:100px; height:100px;">
    								
    								</label>
									<div><img alt="profile" src="assets/img/avatars/profile.jpg" class="col-md-6 offset-md-2 mb-5 mt-4" style="width:100px; height:100px">
									</div>
								</div> -->
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> 
										Name</label>
									<div class="col-md-4">
										<label for="name" class="col col-form-label">
										${adminbean.name}</label>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> Email</label>
									<div class="col-md-4">
										<label for="name" class="col col-form-label">
										${adminbean.email}</label>
									</div>
								</div>	
							
								
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="description" class="col-md-2 col-form-label">
										</label>
									<div class="col-md-4">
										
										<!-- <button type="submit" class="btn btn-primary">Update</button> -->
										<a href="adminUpdate/${adminId}" ><button class="btn btn-primary">Edit Profile</button></a> 
										
									</div>
								</div>
								
								<%-- <div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="userRole" class="col-md-2 col-form-label">User
										Role</label>
									<div class="col-md-4">
										<form:select name="role" class="form-select" aria-label="role"
											id="role">
											<form:option value="Admin">Admin</form:option>
											<form:option value="User">User</form:option>
										</form:select>
									</div>
								</div> --%>
								<!-- <div class="row mb-4">
									<div class="col-md-3">
										<button type="submit" class="btn btn-secondary col-md-2 ">Add</button>
									</div>	
								</div> -->
							
						</div>
					</div>
				</div>
				<!--  content end  -->

				<%-- <jsp:include page="layouts/adminfooter.jsp"></jsp:include> --%>

			</div>
			<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
				class="fas fa-angle-up"></i></a>
		</div>
	</div>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/theme.js"></script>
	<!-- <script src="assets/js/dropdown.js"></script> -->
</body>

</html>