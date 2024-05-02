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
<title>Album Update</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"> -->
<link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../assets/fonts/fontawesome5-overrides.min.css">
</head>
<Style>
.error {
	color: red;
	font-size: 15px;
}
</Style>
<body id="page-top">
	<div id="wrapper">

		<jsp:include page="layouts/newadminsidebar.jsp"></jsp:include>

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<jsp:include page="layouts/newadminheader.jsp"></jsp:include>

				<div class="container-sm">
					<div class="card shadow">
						<div class="card-header py-3">
							<div class="row">
								<div class="col-md-9">
									<h3 class="text-secondary-up m-3" align="center">Album Update</h3>
								</div>
								
							</div>
						</div>

						<div class="card-body">
							<form:form action="album_update" method="post"
								modelAttribute="updatealbum" enctype="multipart/form-data">

								<h3 style="color: red;" align="center">${error}</h3>

								<form:input type="text" class="form-contorl" path="id"
									hidden="true" />

								<div
									class="image d-flex flex-column justify-content-center align-items-center">
									<img id="selectedPhoto"
										src="<c:url value='/albumImages/${updatealbum.image}'/>"
										alt="Selected Photo" class="rounded-circle me-2" height="100"
										width="100" onclick="openFileInput()">
								</div>

								<input type="file" class="custom-file-input" id="photoInput"
									name="newImage" accept="image/*" style="display: none;">
								<div class="custom-file-label" style="cursor: pointer;"
									align="center">Album Image</div>
									
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label">Album
										Title</label>
									<div class="col-md-4">
										<form:input type="name" class="form-control" path="name" />
										<form:errors path="name" cssClass="error"></form:errors>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="artist_name" class="col-md-2 col-form-label">
										Artist Name</label>
									<div class="col-md-4">
										<form:input type="artist_name" class="form-control"
											path="artist_name" readonly="true" />
										<form:errors path="artist_name" cssClass="error"></form:errors>
										<%-- <form:select path="artist_id" id="artistSelect"
											class="form-select form-select-md mb-3 custom-select2"
											aria-label=".form-select-lg example" disabled="true">
											<c:forEach items="${ArtistNameList}" var="list">
												<form:option value="${list.id }">${list.name}</form:option>
											</c:forEach>
										</form:select> --%>
									</div>
								</div>




								<div class="row mb-4">
									<div class="col-md-4"></div>

									<div class="col-md-6">

										<button type="submit" class="btn btn-primary col-md-2">Update</button>


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
	<script>
		$(document).ready(function() {
			$('#artistSelect').select2({
				width : '100%',
				placeholder : 'Search for an artist',
				allowClear : true
			// Optional: allows clearing the selection
			});
		});
	</script>
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
</body>

</html>