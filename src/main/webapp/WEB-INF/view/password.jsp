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
<title>Password Update</title>
<link rel="stylesheet"
	href="../../assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"> -->
<link rel="stylesheet" href="../../assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../../assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../assets/fonts/fontawesome5-overrides.min.css">
</head>
<style>
.error4 {
	color: red;
}

.error-box {
    
	    color: red;
	    padding: 10px; /* Adjust as needed */
	    border: 0px solid red; /* Add 'solid' to specify the border style */
	    max-width: 400px; /* Fixed width */
	    text-align: center;
	    border-radius: 5px;
	    margin: auto; /* Center the error-box horizontally */
	}
      
.text-secondary {
         color: black !important;
      }

</style>

<body id="page-top">
	<div id="wrapper">

		<!-- side start  -->
		<nav
			class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="../../adminhome">
					 <div class="sidebar-brand-icon rounded"> <img src="../../resources/images/profile3.jpg" alt="Icon" 
                    class="rounded-circle me-0" width="40" height="40"></div>
                    <div class="sidebar-brand-text mx-3"><span>Heart to Nerve</span></div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item"><a class="nav-link active" href="../../admin"> <i class="fas fa-regular fa-user"></i><span>Admin Profile</span></a> 
					<a class="nav-link active" href="../../adminAdd"> <i class="fas fa-regular fa-user"></i><span>Admin Register</span></a> 
					<a class="nav-link active" href="../../userlist"> <i class="fas fa-solid fa-users"></i><span>User Management</span></a> 
					<a class="nav-link active" href="../../artistmanagement"><i class="fas fa-user-astronaut"></i><span>Artist Management</span></a>
					<a class="nav-link active" href="../../artistaddform"><i class="fas fa-user-astronaut"></i><span>Artist Register</span></a> 
					<a class="nav-link active" href="../../albummanagement"><i class="fas fa-solid fa-compact-disc"></i><span>Album Management</span></a> 
					<a class="nav-link active" href="../../albumaddform"><i class="fas fa-solid fa-compact-disc"></i><span>Album Register</span></a> 
					<a class="nav-link active" href="../../songmanagement"><i class="fas fa-solid fa-music"></i><span>Song Management</span></a> 
					<a class="nav-link active" href="../../songaddform"><i class="fas fa-solid fa-music"></i><span>Song Register</span></a>
					</li>
				</ul>
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle"
						type="button"></button>
				</div>
			</div>
		</nav>
		<!--  side end  -->


		<div class="d-flex flex-column" id="content-wrapper">

			<div id="content">

				<!-- nav bar start -->
				<nav
					class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle me-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<div class="nav-item dropdown no-arrow">
							<a class="dropdown-toggle nav-link" aria-expanded="false"
								data-bs-toggle="dropdown" href="#"> <img
								class="border rounded-circle img-profile"
								src="../../assets/img/avatars/profile3.jpg"> <span
								class="d-none d-lg-inline me-2 text-gray-600 large"> :
									${adminName}</span>
							</a>

						</div>

						<ul class="navbar-nav flex-nowrap ms-auto">

							<li class="nav-item dropdown no-arrow mx-1"></li>
							<li class="nav-item dropdown no-arrow mx-1">
								<div
									class="shadow dropdown-list dropdown-menu dropdown-menu-end"
									aria-labelledby="alertsDropdown"></div>
							</li>
							<div class="d-none d-sm-block topbar-divider"></div>
							<li class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" href="../../logout"> <i
										class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-green"></i>&nbsp;Logout
									</a>

								</div>
							</li>
						</ul>
					</div>
				</nav>
				<!-- nav bar end  -->

				<!-- content start  -->
					<div class="container-sm">
						<div class="card shadow">
							<div class="card-header py-3">
								<div class="row">
									<div class="col-md-9">
										<h3 class="text-secondary m-3" align="center">Password
											Update</h3>
									</div>
									
									<div class="col-md-3" align="right">
									<a href="../../admin"><button type="submit"
											class="btn btn-outline-primary">Admin Profile</button> </a>
									</div>
									
								</div>
							</div>

							<div class="card-body">
								<div class="error-box" >${error}</div>
							</div>
							
							<form:form method="post" modelAttribute="passbean"
									action="passwordupdated">
									
									<div class="row">

										<div class="row mb-4">
											<div class="col-md-2"></div>
											<label for="name" class="col-md-2 col-form-label">
												Old Password</label>
											<div class="col-md-4">
												<form:input type="password" path="password"
													class="form-control" />
												<form:errors path="password" cssClass="error4"></form:errors>
											</div>
										</div>

										<div class="row mb-4">
											<div class="col-md-2"></div>
											<label for="name" class="col-md-2 col-form-label">
												New Password</label>
											<div class="col-md-4">
												<form:input type="password" path="newPassword"
													class="form-control" />
												<form:errors path="newPassword" cssClass="error4"></form:errors>
											</div>
										</div>

										<div class="row mb-4">
											<div class="col-md-2"></div>
											<label for="name" class="col-md-2 col-form-label">
												Confirm Password</label>
											<div class="col-md-4">
												<form:input type="password" path="confirmPassword"
													class="form-control" />
												<form:errors path="confirmPassword" cssClass="error4"></form:errors>
											</div>
										</div>

										<div class="row mb-4" align="center">
											<div class="col-md-2"></div>

											<div class="col-md-6">
												<button type="submit" class="btn btn-primary col-md-3">Update</button>
											</div>
										</div>
									</div>
								</form:form>
							</div>

							<!--  content end  -->
						</div>
						<%-- <jsp:include page="layouts/adminfooter.jsp"></jsp:include> --%>

					</div>
					<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
			class="fas fa-angle-up"></i></a>
	</div>
	</div>
	
	<script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/js/theme.js"></script>
	<script src="../../assets/js/dropdown.js"></script>
</body>

</html>