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
<title>Admin Update</title>
<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
 <!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
 -->
<link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../assets/fonts/fontawesome5-overrides.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/animate.css@3.7.2/animate.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.js"></script>
	
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css"
	rel="stylesheet">


</head>
<script>
        function ValidateUpdateForm() {
            var email = document.getElementById("name").value;
            var password = document.getElementById("email").value;
            var isValid = true;

            // Simple validation for demonstration purposes
            if (email.trim() === "") {
                document.getElementById("nameError").innerText = "Name is required";
                isValid = false;
            } else {
                document.getElementById("nameError").innerText = "";
            }

            if (password.trim() === "") {
                document.getElementById("emailError").innerText = "Email is required";
                isValid = false;
            } else {
                document.getElementById("emailError").innerText = "";
            }

            return isValid;
        }
    </script>
<style>
.error {
	color: red;
	font-size:15px;
}

.text-secondary {
         color: black !important;
      }
      
/* .btn-secondary{
		color:blue;
} */
</style>
<body id="page-top">
	<div id="wrapper">

		<jsp:include page="layouts/newadminsidebar.jsp"></jsp:include>


		<div class="d-flex flex-column" id="content-wrapper">

			<div id="content">

				<jsp:include page="layouts/newadminheader.jsp"></jsp:include>

				<!-- content start  -->
				<div class="container-sm">
					<div class="card shadow">
						<div class="card-header py-3">
							<div class="row">
								<div class="col-md-9">
									<h3 class="text-secondary m-3" align="center">Admin
										Update</h3>
								</div>
								<div class="col-md-3" align="right" >
									<a href="passwordupdate/${adminId}"><button type="submit"
											class="btn btn-outline-primary" >Change Password</button> </a>
								</div>
							</div>
						</div>

						<div class="card-body">

							<form:form class="mx-1 mx-md-4" method="post" 
								action="adminUpdated" modelAttribute="updatebean"  onsubmit="return ValidateUpdateForm();">

								<form:hidden path="id" />
								<div style="color: red">${error}</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> 
										</label>
									<div class="col-md-4">
										<label for="name" class="col-md-2 col-form-label">
											<img src="../assets/img/avatars/profile1.jpg" alt="Centered Image" class="rounded-circle me-2" height="100">
    									</label>
									</div>
								</div>

								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> Name</label>
									<div class="col-md-4">
										<form:input type="text" class="form-control" id="name"
											path="name" />
										<form:errors path="name" cssClass="error3"></form:errors>
										<div id="nameError" class="error"></div>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="email" class="col-md-2 col-form-label">
										Email</label>
									<div class="col-md-4">
										<form:input type="email" class="form-control" id="email"
											path="email" />
										<form:errors path="email" cssClass="error3"></form:errors>
										<div id="emailError" class="error"></div>
										<div style="color: red;">${Erroremail}</div>
									</div>
								</div>
								

								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="description" class="col-md-2 col-form-label">
									</label>
									<div class="col-md-3">
										<button type="submit" class="btn btn-primary">Update</button>
										 
										
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

	<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/js/theme.js"></script>
	<script src="../assets/js/dropdown.js"></script>
	

	
</body>

</html>