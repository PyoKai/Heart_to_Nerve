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
<title>Song Add</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

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
.error1 {
	color: red;
	font-size: 15px;
}

/* .err{
	text-align: center;
	font-size: 18px;
} */

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
									<h4 class="text-secondary-reg m-3" align="center">Song 
										Add</h4>
								</div>
								
							</div>
						</div>
						
						<div class="card-body">
							<form:form action="songadded" method="post" modelAttribute="song" enctype="multipart/form-data">

								
 
								<div
									class="image d-flex flex-column justify-content-center align-items-center">
									<img id="selectedPhoto" src="resources/images/song.jpg"
										alt="SONG Photo" class="rounded-circle me-2" height="100"
										width="100">
								</div>
								
								

								<!-- <input type="file" class="custom-file-input" id="photoInput"
									name="image" accept="image/*" style="display: none;"> -->
								<!-- <div class="custom-file-label" style="cursor: pointer;"
									align="center">Song Image</div> -->
								<p></p>

								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label">Song
										Title</label>
									<div class="col-md-4">
										<form:input type="text" class="form-control" path="name" />
										<%-- <form:errors path="name" cssClass="error1"></form:errors> --%>
										<div style="color:red;" class="err">${errortitle}</div>
									</div>
									
								</div>

								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="albumArtistId" class="col-md-2 col-form-label">
										Artist Name</label>
									<div class="col-md-4">
										<form:select path="albumArtistId" id="artistSelect"
											class="form-select form-select-md mb-3 custom-select2"
											aria-label=".form-select-lg example" required="true">
											<c:forEach items="${ArtistNameList}" var="list">
												<form:option value="${list.id }">${list.name}</form:option>
											</c:forEach>
										</form:select>
										
									</div>
									
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="artist_name" class="col-md-2 col-form-label">
										Album Title</label>
									<div class="col-md-4">
										<form:select path="albumId" id="albumSelect"
											class="form-select form-select-md mb-3 custom-select2"
											aria-label=".form-select-lg example" required="true">
											<c:forEach items="${AlbumList}" var="list">
												<form:option value="${list.id }">${list.name}</form:option>
											</c:forEach>
										</form:select>
										
									</div>
									
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label">Song File
										</label>
									<div class="col-md-4">
										<input type="file" class="form-control" name="song" />
										<%-- <form:errors path="songFile" cssClass="error1"></form:errors> --%>
										<div style="color:red;" class="err">${errorfile}</div>
									</div>
									
								</div>
								
									<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="artist_name" class="col-md-2 col-form-label">
										Genre</label>
									<div class="col-md-4">
										<form:select path="genreId" 
											class="form-select form-select-md mb-3 custom-select2"
											aria-label=".form-select-lg example" required="true">
											<c:forEach items="${GenreNameList}" var="list">
												<form:option value="${list.id }">${list.genreName}</form:option>
											</c:forEach>
										</form:select>
										
									</div>
									
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label">Duration
										</label>
									<div class="col-md-4">
										<form:input type="text" class="form-control" path="duration" />
										<%-- <form:errors path="duration" cssClass="error1"></form:errors> --%>
										<div style="color:red;" class="err">${errorduration}</div>
									</div>
									
								</div>
								
								<div class="row mb-4">
									<div class="col-md-2"></div>
									<label for="name" class="col-md-2 col-form-label">Role
										</label>
									<div class="col-md-4">
										<form:select path="role" class="form-select form-select-md mb-3 custom-select2"
											aria-label=".form-select-lg example" required="true">
											<option value="Normal">Normal</option>
											<option value="Premium">Premium</option>
										</form:select>
										</div>
									
								</div>

								<div class="row mb-4">
									<div class="col-md-4"></div>

									<div class="col-md-6">

										<button type="submit" class="btn btn-primary col-md-2" onsubmit="return validateForm()">Add</button>


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
        $(document).ready(function() {
            // Attach a change event listener to the first select box
            $("#artistSelect").change(function() {
                var selectedValue = $(this).val();
                
                // Make an Ajax call to fetch data for the second select box
                $.ajax({
                    type: "GET",
                    url: '/HeartToNerve/getoptions',  // URL mapped to your Spring controller
                    data: { selectedValue: selectedValue },
                    success: function(data) {
                    	console.log(data)
                        // Clear and populate the second select box with the returned data
                         var albumSelect = $("#albumSelect");
                        albumSelect.empty();
                        for (var i = 0; i < data.length; i++) {
                        	 var option = $("<option>").val(data[i].id).text(data[i].name);
                        	albumSelect.append(option);
                        	
                        } 
                    },
                    error: function(data) {
                    	console.log(data)
                        alert("An error occurred while fetching data.");
                    }
                });
            });
        });
    </script>
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
	
	<!-- Add this script block at the end of your HTML body -->

	
</body>

</html>