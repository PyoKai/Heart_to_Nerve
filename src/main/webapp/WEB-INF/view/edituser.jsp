<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Update Profile</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/cb07d8fa89.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> -->

<link href="<c:url value='/resources/css/styles.css' />"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/audio.css' />" rel="stylesheet" />

<link href="<c:url value='/resources/css/corporate-ui-dashboard.css' />"
	rel="stylesheet" />


</head>
<style>
.profile-details .col-sm-12 {
	text-align: right;
}


.error {
	color: red;
	font-size:15px;
}
</style>


<body>

	<div id="app" class="d-flex flex-column">

		<div id="principal" class="d-flex">


			<nav id="latNav" class="w-100 pt-4 d-flex flex-column">

				<!-- Start of logo -->

				<a href="../systemhomepage" class="d-flex px-4"><img
					src="../resources/images/profile3.jpg" alt="Icon"
					class="rounded-circle me-0" width="40" height="40"> <span
					class="fw-semibold ms-1" style="font-size: 1.3em;">Heart To
						Nerve</span> </a>
				<!-- End of logo -->



				<!-- Start of side bar-->

				<ul class="nav flex-column px-2 my-4">
					<li class="nav-item"><a href="../systemhomepage"
						class="nav-link ativo"><svg role="img" height="24" width="24"
								viewBox="0 0 24 24">
                <path
									d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                </path>
              </svg> Home</a></li>


					<li class="nav-item"><a href="../user-search" class="nav-link"><svg
								role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
									d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                </path>
              </svg> Search</a></li>

				</ul>

				<div id="underList">
					<a href="../userfavouritesong/${userId}"><button>
							<div class="heart_bttn">
								<svg role="img" height="12" width="12" aria-hidden="true"
									viewBox="0 0 16 16">
                <path
										d="M15.724 4.22A4.313 4.313 0 0012.192.814a4.269 4.269 0 00-3.622 1.13.837.837 0 01-1.14 0 4.272 4.272 0 00-6.21 5.855l5.916 7.05a1.128 1.128 0 001.727 0l5.916-7.05a4.228 4.228 0 00.945-3.577z">
                </path>
              </svg>
							</div>
							Liked Songs
						</button></a>
				<!-- Logout button -->
					
				<ul class="nav flex-column px-4 my-4">
				<li class="nav-item"><a href="../logout" class="btn "> <i
							class="fas fa-sign-out-alt me-3"></i> Logout
						</a></li>
              </ul>
              
              </div>

				<!-- End of side bar-->



				
			</nav>

			<div id="feed" class="w-100">

				<!-- menu superior do conteudo -->
				<!-- <nav id="topNav"
					class="d-flex justify-content-between align-items-center px-4 py-2">

					Start of arrows

					<div id="arrowMenu"></div>

					End of arrows

					<div id="btnTopNav" class="d-flex">

						Start of user profile
						<div>
							<button class="btn btn-secondary toggle" type="button"
								id="Button1" data-bs-toggle="dropdown" aria-expanded="false">
								<div class="imgUsuario bg-secondary">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" viewBox="0 0 16 16">
                    <path
											d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                  </svg>
								</div>
							</button>
							<div></div>

						</div>
					</div>
				</nav> -->

				<!-- End of user profile -->
				<header class="masthead">
					<div class="container h-100">
						<div class="row h-100 align-items-center">
							<div class="col-12 text-center">
								<h3 class="fw-dark"></h3>
								<p class="lead"></p>
							</div>
						</div>
					</div>
				</header>

				<div class="container db-social">
					<div class="jumbotron jumbotron-fluid"></div>
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-xl-11">
								<div class="widget head-profile has-shadow">
									<div class="widget-body pb-0">
										<div class="row d-flex align-items-center">
											<div
												class="col-xl-4 col-md-4 d-flex justify-content-lg-start justify-content-md-start justify-content-center">

											</div>
											<div class="col-xl-4 col-md-4 d-flex justify-content-center">
												<div class="image-default">
														<img class="rounded-circle"
															src="../resources/images/p1.jpg"
															alt="...">
													</div>
													
												<div class="infos">
													<h2>Update Profile</h2>
													
													<hr>

												</div>
											</div>
											<div
												class="col-xl-4 col-md-4 d-flex justify-content-lg-end justify-content-md-end ">
												<div class="follow">
													<a class="btn btn-outline-primary" href="../user/${userId}"><i
														class="la la-user-plus"></i>Back</a>

												</div>
											</div>


											<form:form action="updateuser" method="post"
												modelAttribute="user" onsubmit="return ValidateUpdateForm();">
												<div class="profile-container">
													<div class="profile-details mx-auto">
														<div style="color: red">${error}</div>
														<div class="row mb-3">
															<div class="col-sm-3" style="text-align:center;">
																
																<h5 class="mb-0 text-secondary"  >
																	<i class="fa fa-user"></i>
																	
																</h5>
																	
																
															</div>
															<form:input type="text" class="form-control" path="id"
																hidden="true" />
															<div class="col-sm-9 text-secondary">

																<form:input type="text" class="form-control" path="name" />
																<div id="nameError" class="error"></div>

															</div>
														</div>

														<div class="row mb-3">
															<div class="col-sm-3" style="text-align:center;">
																<h5 class="mb-0 text-secondary"  >
																	<i class="fa fa-envelope"></i>
																	
																</h5>
															</div>
															<div class="col-sm-9 text-secondary">
																<form:input type="email" class="form-control"
																	path="email" />
																<div id="emailError" class="error"></div>
																<div style="color: red;">${Erroremailuser}</div>
															</div>
														</div>
														<!-- Add more user details here (e.g., Date of Birth, Country, etc.) -->
														
													<div class="profile-container">
														<div class="profile-details mx-auto">
														
														<hr>
														<div class="row">
															<div class="col" style="text-align: center;">
																<button type="submit" class="btn btn-primary">Update</button>
																
																<a class="btn btn-primary" href="../password/${id}"><i
																	class="la la-user-plus"></i>Change Password</a>
																
															</div>
														</div>
														
														<hr>
													</div>
													</div>


													</div>

												</div>

											</form:form>



										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script>

	var id =${userId};

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
<script src="<c:url value="/resources/js/userfavouritesong.js" />"></script>

</html>
