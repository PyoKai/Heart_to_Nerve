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
<title>Artist Add</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"> -->
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/fonts/fontawesome5-overrides.min.css">
</head>
<Style>
.errorart {
	color: red;
	font-size: 15px;
}

.text-secondary-reg{
	color: black;
}
</Style>
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
									<h4 class="text-secondary-reg m-3" align="center">Artist
										Registration</h4>
								</div>
								
							</div>
						</div>
						
						<div class="card-body">

							<form:form action="artistregister" method="post"
								modelAttribute="artist" enctype="multipart/form-data">

								<p class="text-danger text-center">${error}</p>

								<div
									class="image d-flex flex-column justify-content-center align-items-center">
									<img id="selectedPhoto" src="resources/images/artist.png"
										alt="Selected Photo" class="rounded-circle me-2" height="100"
										width="100" onclick="openFileInput()">
								</div>

								<input type="file" class="custom-file-input" id="photoInput"
									name="image" accept="image/*" style="display: none;">
								<div class="custom-file-label" style="cursor: pointer;"
									align="center">Artist Image</div>
									<span id="errorMessage" style="color: red;"></span>
									
									<p></p>


								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label"> Name</label>
									<div class="col-md-4">
										<form:input type="text" class="form-control" path="name" />
										<form:errors path="name" cssClass="errorart"></form:errors>
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="email" class="col-md-2 col-form-label">
										Email</label>
									<div class="col-md-4">
										<form:input type="email" class="form-control" path="email" />
										<form:errors path="email" cssClass="errorart"></form:errors>
										<div style="color:red;">${erroremail}</div>
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="description" class="col-md-2 col-form-label">
										Description</label>
									<div class="col-md-4">
										<form:textarea type="text" class="form-control"
											path="description" cssStyle="height:150px" />
										<form:errors path="description" cssClass="errorart"></form:errors>
									</div>
								</div>

								<!-- <div
									class="image d-flex flex-column justify-content-center align-items-center">
									<img id="selectedPhoto" src="images/profile_image.png" alt="Selected Photo"
									class="rounded-circle me-2"	height="100" width="100" onclick="openFileInput">
								</div>
								
								<input type="file" class="custom-file-input" id="photoInput"
									name="photo" accept="image/*" >
								<div class="custom-file-label" style="cursor: pointer;">Student
									Photo</div> -->




								<%-- <form:input type="hidden" class="form-control" path="id" />
								<form:input type="hidden" class="form-control" path="image" /> --%>


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
	<script>
		function openFileInput() {
			const photoInput = document.getElementById("photoInput");
			photoInput.click();
		}

		const photoInput = document.getElementById("photoInput");
		const selectedPhoto = document.getElementById("selectedPhoto");
		const customFileLabel = document.querySelector(".custom-file-label");

		photoInput.addEventListener("change", function myfunction() {
			const file = this.files[0];
			if (file) {
				const reader = new FileReader();
				reader.onload = function(e) {
					selectedPhoto.src = e.target.result;
				};
				reader.readAsDataURL(file);
				customFileLabel.textContent = file.name;
			} else {
				selectedPhoto.src = "";
				customFileLabel.textContent = "Click to choose file";
			}
		});
	</script>
	
	
<script>
    function openFileInput() {
        document.getElementById('photoInput').click();
    }

    // Add an event listener to the file input
    document.getElementById('photoInput').addEventListener('change', function () {
        const selectedFile = this.files[0];
        const imageInputLabel = document.getElementById('imageInputLabel');
        const errorMessage = document.getElementById('errorMessage');

        if (selectedFile) {
            // If a file is selected, update the label text (display the file name)
            imageInputLabel.textContent = selectedFile.name;
            errorMessage.textContent = ''; // Clear any previous error message
        } else {
            // If no file is selected, display the error message
            imageInputLabel.textContent = 'Artist Image';
            errorMessage.textContent = 'Image is required';
        }
    });
</script>
</body>

</html>