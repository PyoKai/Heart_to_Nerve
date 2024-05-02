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
<title>User List</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/fonts/fontawesome5-overrides.min.css">
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Include DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
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
							<p class="text-dark m-0 fw-bold me-auto">User List</p>
							
						</div>
					</div>


					<div class="card-body">
						
						<div class="table-responsive table mt-2" id="dataTable"
							role="grid" aria-describedby="dataTable_info">
							
							<table id="mytable" class="display" style="width: 100%">
								<thead>
									<tr>
											<th>#</th>
											<th>Name</th>
											<th>Email</th>
											<th>Role</th>
											<th>Status</th>
											<!-- <th>Details</th> -->
									</tr>
								</thead>
								<tbody>
									<c:set var="itemsPerPage" value="5" />
									<!-- Set the number of items per page -->

									<c:forEach var="list" items="${userList}" varStatus="i">
										
											<tr>
												<td>${i.index + 1}</td>
												<td>${list.name}</td>
												<td>${list.email}</td>
												<td>${list.role}</td>
												<td>Normal</td>
											</tr>
										
									</c:forEach>
								</tbody>

							</table>

						

						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!--  content end  -->
		

	</div>

	

	<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
		class="fas fa-angle-up"></i></a>



	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/theme.js"></script>
	<script src="assets/js/dropdown.js"></script>
	
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