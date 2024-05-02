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
<title>Song Management</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/fonts/fontawesome5-overrides.min.css">

<link rel="stylesheet" type="text/css" href="resources/pagination.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Include DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>

<body id="page-top">
	<div id="wrapper">

		<jsp:include page="layouts/adminsidebar.jsp"></jsp:include>

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<jsp:include page="layouts/adminheader.jsp"></jsp:include>

				<!-- content start  -->
				<div class="container-fluid">
					<div class="card shadow">
						<div
							class="card-header py-3 d-flex justify-content-between align-items-center">
							<p class="text-dark m-0 fw-bold me-auto">Song List</p>
							
							
							<button type="button" class="btn btn-primary "
										onclick="location.href ='songaddform';"
										style="margin-right: 50px">Add</button>


						</div>
					</div>


					<div class="card-body">
						
						<div class="table-responsive table mt-2" id="dataTable"
							role="grid" aria-describedby="dataTable_info">

							<table id="mytable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Image</th>
										<th scope="col">Song Name</th>
										<th scope="col">Audio</th>
										<th scope="col">Artist Name</th>
										<th scope="col">Album Name</th>
										<th scope="col">Update</th>
									</tr>
								</thead>
								<tbody>



									<c:forEach items="${songList}" var="list" varStatus="i">

										<tr>
											<td>${i.index+1}</td>
											<td><img class="rounded-circle me-2" width="60"
												height="60" src="albumImages/${list.image}"></td>
											<td>${list.name}</td>
											<td><audio controls muted="muted" >
                                                	<source src="${pageContext.request.contextPath}/songFiles/${list.songFile}" type="audio/mpeg">
                                            	</audio>
                                            </td>
											<td>${list.artistName}</td>
											<td>${list.albumName}</td>
											<td><a class="btn btn-primary mb-3"
												href="songupdateform/${list.id}">Update</a></td>
						
										</tr>
									

									</c:forEach>
								</tbody>
								
							</table>

						</div>


					</div>
				</div>
			</div>
		</div>


	</div>
	
	<!-- Include jQuery, Bootstrap JS, and DataTables JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Data Table JS -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

	<script>
		$(document).ready(
				function() {
					const usersTable = $('#mytable').DataTable({
						pagingType : 'full_numbers',
						/* columns : [ null, null, null, null, null ], */
						"lengthMenu" : [ 3, 5, 10, 15, -1 ],
						"pageLength" : 5,
					});

					// Edit user action
					$('#mytable').on('click', '.edit-user', function() {
						const userId = $(this).data('user-id');
						// Construct the URL for the edit page based on the user ID
						const editUrl = 'barchart.html?id=' + userId;
						// Navigate to the edit page
						window.location.href = editUrl;
					});

					// Toggle user status action
					$('#mytable').on(
							'click',
							'.toggle-user',
							function() {
								const userId = $(this).data('user-id');
								const currentStatus = $(this).data('status');
								const newStatus = !currentStatus;

								// Simulate toggling user status (you would replace this with your actual API call)
								console.log('Toggling user', userId,
										'status to', newStatus);

								
							});
				});
	</script>

</body>

</html>