<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Heart To Nerve</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/cb07d8fa89.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> -->

<link href="<c:url value='/resources/css/styles.css' />"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/audio.css' />" rel="stylesheet" />

<style>
.card {
	backdrop-filter: blur;
	background-color: transparent;
	border: 0cap;
}

.card-img {
	size: 321px;
	width: 321px;
	height: 300px;
}

.table-light-dark {
	background-color: #151515;
	color: #dfd9d9;
}

.table-light-dark th {
	background-color: #1b2228;
}

.table-light-dark tr:hover {
	background-color: rgb(142, 145, 145);
}
</style>


</head>


<body>

	<div id="app" class="d-flex flex-column">

		<div id="principal" class="d-flex">


			<nav id="latNav" class="w-100 pt-4 d-flex flex-column">

				<!-- Start of logo -->

				<a href="../systemhomepage" class="d-flex px-4"><img src="../resources/images/profile3.jpg" alt="Icon" 
                    class="rounded-circle me-0" width="40" height="40"> 
                    <span class="fw-semibold ms-1" style="font-size: 1.3em;">Heart
						To Nerve</span>
				</a>


				<!-- End of logo -->



				<!-- Start of side bar-->

				<ul class="nav flex-column px-2 my-4">
					<li class="nav-item"><a href="../systemhomepage" class="nav-link ativo"><svg
								role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
									d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                </path>
              </svg> Home</a></li>
					<li class="nav-item"><a href="../search" class="nav-link"><svg
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



				<hr class="mx-4 mb-0 mt-2">
			</nav>
			<!-- End of Install App Button-->


			<!-- Main Content -->
			<div id="feed" class="w-100">

				<!-- menu superior do conteudo -->
				<nav id="topNav"
					class="d-flex justify-content-between align-items-center px-4 py-2">

					<!-- Start of arrows -->

					<div id="arrowMenu"></div>

					<!-- End of arrows-->

					<div id="btnTopNav" class="d-flex">

						<!-- Start of user profile -->
						<div>
							<a class="btn btn-secondary toggle" type="button" href="../user/${userId}" 
								id="Button1"  aria-expanded="false">
								<div class="imgUsuario bg-secondary">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" viewBox="0 0 16 16">
                    <path
											d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                  </svg>
								</div>
							</a>
							<div></div>

						</div>
					</div>
				</nav>

				<!-- End of user profile -->
				<div class="card mb-3"
					style="width: 800px; height: 300px; margin-left: 30px">
					<div class="row no-gutters">
						<div class="col-md-5 img">
							<img src="../albumImages/${album.image}" class="card-img"
								alt="...">
						</div>
						<div class="col-md-7">
							<div class="card-body">
								<h1 class="card-title">ALBUM</h1>
								<h1 class="card-text">${album.name}</h1>
								<p class="card-text">
									<small>${album.artist_name}</small>
								</p>
								
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					
					<div class="container">
						<table class="table table-hover table-dark">
							<thead>
								<tr>
									<th>#</th>
									<th>Title</th>
									<th>Duration</th>
									<th>Action</th>
								</tr>
							</thead>
							
							<tbody class="playlistContainer">
								
							</tbody>
						</table>
						<audio src="" class="audioTag">

						</audio>
					</div>
				</div>


				<!-- feed do conteudo principal -->

			</div>
		</div>

		<div id="mobiPlay">
			<button type="button" id="mobibtn">
				<svg role="img" height="24" width="24" viewBox="0 0 24 24">
          <path
						d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z">
          </path>
        </svg>
			</button>
		</div>
		<div id="footer">
			<div id="audioBar" class="p-3 d-flex justify-content-center">

				

				<div id="botomIcon">
					<ul class="nav flex-row px-2 my-4">
						<li class="nav-item"><a href="../systemhomepage"
							class="nav-link ativo d-flex flex-column align-items-center"><svg
									role="img" height="20" width="20" fill="white"
									viewBox="0 0 24 24">
                  <path
										d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                  </path>
                </svg>Home</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link d-flex flex-column align-items-center"><svg
									role="img" height="20" width="20" fill="white"
									viewBox="0 0 24 24">
                  <path
										d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                  </path>
                </svg>Search</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link d-flex flex-column align-items-center"><svg
									role="img" height="20" width="20" fill="white"
									viewBox="0 0 24 24">
                  <path
										d="M14.5 2.134a1 1 0 011 0l6 3.464a1 1 0 01.5.866V21a1 1 0 01-1 1h-6a1 1 0 01-1-1V3a1 1 0 01.5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1zm6 0a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1z">
                  </path>
                </svg>Your Playlist</a></li>
						<li><a href="#"
							class="nav-link d-flex flex-column align-items-center"><svg
									role="img" width="20" height="20" fill="white"
									viewBox="0 3 16 10">
                  <path
										d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.669 11.538a.498.498 0 0 1-.686.165c-1.879-1.147-4.243-1.407-7.028-.77a.499.499 0 0 1-.222-.973c3.048-.696 5.662-.397 7.77.892a.5.5 0 0 1 .166.686zm.979-2.178a.624.624 0 0 1-.858.205c-2.15-1.321-5.428-1.704-7.972-.932a.625.625 0 0 1-.362-1.194c2.905-.881 6.517-.454 8.986 1.063a.624.624 0 0 1 .206.858zm.084-2.268C10.154 5.56 5.9 5.419 3.438 6.166a.748.748 0 1 1-.434-1.432c2.825-.857 7.523-.692 10.492 1.07a.747.747 0 1 1-.764 1.288z">
                  </path>
                </svg>Get App</a></li>
					</ul>
				</div>
				<div id="songInfo" style="color:#b3b3b3;left:20px" class="position-absolute ">
				
				</div>

				<div id="caixaCentral" class="d-flex flex-column align-items-center">

					<div class="container1">
					<div class="currentAndTotalTime">00:00 / 00:00</div>
							<div id="progressBar">
						<div id="currentProgress"></div>
					</div>
					<div class="musicPlayer">
						<i class="fas fa-step-backward controls previousButton"></i>
						<i class="fas fa-play-circle controls playButton"></i>
						<i class="fas fa-pause-circle controls pauseButton"></i>
						<i class="fas fa-step-forward controls nextButton"></i>
					</div>
					<div class="position-absolute heartButton" style="left: 20%">
						
					</div>
					</div>
				</div>



		
			</div>
		</div>
	</div>

	
	 <script>
	 		var id= "${album.id}";
	 		var userId= "${userId}";
	 	</script> 
	 	 <script src="<c:url value="/resources/js/audio.js" />"></script>
</body>

</html>
