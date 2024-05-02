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
<title>Artist Management</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
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
							<p class="text-dark m-0 fw-bold me-auto">Artist List</p>
							
							
							<button type="button" class="btn btn-primary "
										onclick="location.href ='artistaddform';"
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
										<th scope="col">Name</th>
										<th scope="col">Update</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<tbody>



									<c:forEach items="${artistList}" var="list" varStatus="i">

										<tr>
											<td>${i.index+1}</td>
											<td><img class="rounded-circle me-2" width="60"
												height="60" src="images/${list.image}"></td>
											<td>${list.name}</td>							<td><a class="btn btn-primary mb-3"
												href="artistupdateform/${list.id}">Update</a></td>

											<td><button type="button" class="btn btn-danger"
													data-toggle="modal"
													data-target="#confirmationModal-${list.id}">Delete</button></td>


										</tr>
										<div class="modal fade" id="confirmationModal-${list.id}"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content" style="background-color: white;">
													<div class="modal-header">
														<h5 class="modal-title text-danger" id="exampleModalLabel">Confirmation</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body ">Are you sure to delete this
														record?
														<div>If you delete, <span class="text-danger">album(s) and song(s) related to this artist</span> will be <span class="text-danger">deleted</span>.</div>
														</div>
														
													<div class="modal-footer">
														<button type="button" class="btn btn-success"
															data-dismiss="modal">No</button>

														<a class="btn btn-danger text-white"
															href="deleteartist/${list.id}">Yes</a>
														<!-- <button type="button" class="btn btn-warning">
													
												</button> -->
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</tbody>
								<!-- <tfoot>
										<tr></tr>
									</tfoot> -->
							</table>

						</div>


					</div>
				</div>
			</div>
		</div>


		<%-- <jsp:include page="layouts/adminfooter.jsp"></jsp:include> --%>

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