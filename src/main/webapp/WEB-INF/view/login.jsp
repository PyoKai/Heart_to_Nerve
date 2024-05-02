<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900">
<link href="<c:url value="/resources/fonts/icomoon/style.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/magnific-popup.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/owl.carousel.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/owl.theme.default.min.css" />"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">

<link href="<c:url value="/resources/css/aos.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/bs-brain@2.0.2/components/logins/login-8/assets/css/login-8.css" />

<script>
        function validateLoginForm() {
            var email = document.getElementById("form3Example3c").value;
            var password = document.getElementById("form3Example4c").value;
            var isValid = true;

            // Simple validation for demonstration purposes
            if (email.trim() === "") {
                document.getElementById("emailError").innerText = "Email is required";
                isValid = false;
            } else {
                document.getElementById("emailError").innerText = "";
            }

            if (password.trim() === "") {
                document.getElementById("passwordError").innerText = "Password is required";
                isValid = false;
            } else {
                document.getElementById("passwordError").innerText = "";
            }

            return isValid;
        }
    </script>
</head>

<style>
.error {
	color: red;
}

.img-fluid {
	size: 30px;
}
</style>

<body>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

	<jsp:include page="layouts/homeheader.jsp"></jsp:include>
	

		<section class="vh-100" style="background-color: white;">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">
						<div class="card text-black" style="border-radius: 25px;">
							<div class="card-body p-md-5">
								<div class="row justify-content-center">
									<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

										<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>

										<form:form class="mx-1 mx-md-4" method="post" action="login"
											modelAttribute="userbean"
											onsubmit="return validateLoginForm();">
											

											<div class="d-flex flex-row align-items-center mb-4">
												<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<label class="form-label" for="form3Example3c">Your
														Email</label>
													<form:input type="email" id="form3Example3c"
														class="form-control" path="email" />
													<div id="emailError" class="error"></div>
													<div style="color: red;">${erroremail}</div>
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<label class="form-label" for="form3Example4c">Password</label>
													<form:input type="password" id="form3Example4c"
														class="form-control" path="password" />
													<div id="passwordError" class="error"></div>
													<div style="color: red;">${errorpass}</div>
													
												</div>
											</div>
											
											<div class="form-check d-flex justify-content-center mb-5">
												<label class="form-check-label" for="form2Example3">
													<a href="register">Not Register?.Create Account</a>
												</label>
											</div>

											<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
												<input type="submit" class="btn btn-primary btn-lg"
													value="Login" />
											</div>

										</form:form>

									</div>
									<div 
										class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

										<img
											src="resources/images/m1.jpg"
											class="img-fluid" alt="Sample image" >

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</section>



		<script src="resources/js/jquery-3.3.1.min.js"></script>
		<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="resources/js/jquery-ui.js"></script>
		<script src="resources/js/popper.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/owl.carousel.min.js"></script>
		<script src="resources/js/jquery.stellar.min.js"></script>
		<script src="resources/js/jquery.countdown.min.js"></script>
		<script src="resources/js/jquery.magnific-popup.min.js"></script>
		<script src="resources/js/aos.js"></script>

		<script src="js/mediaelement-and-player.min.js"></script>

		<script>
      document.addEventListener('DOMContentLoaded', function() {
                var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

                for (var i = 0; i < total; i++) {
                    new MediaElementPlayer(mediaElements[i], {
                        pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                        shimScriptAccess: 'always',
                        success: function () {
                            var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                            for (var j = 0; j < targetTotal; j++) {
                                target[j].style.visibility = 'visible';
                            }
                  }
                });
                }
            });
    </script>


		<script src="resources/js/main.js"></script>
</body>
</html>