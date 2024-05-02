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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha384-..." crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/cb07d8fa89.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="<c:url value='/resources/css/styles.css' />"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/audio.css' />" rel="stylesheet" />

</head>


<body>

	<div id="app" class="d-flex flex-column">

		<div id="principal" class="d-flex">


			<nav id="latNav" class="w-100 pt-4 d-flex flex-column">

				<!-- Start of logo -->

				<a href="systemhomepage" class="d-flex px-4"><img
					src="resources/images/profile3.jpg" alt="Icon"
					class="rounded-circle me-0" width="40" height="40"> <span
					class="fw-semibold ms-1" style="font-size: 1.3em;">Heart To
						Nerve</span> </a>
				<!-- End of logo -->



				<!-- Start of side bar-->

				<ul class="nav flex-column px-2 my-4">
					<li class="nav-item"><a href="systemhomepage"
						class="nav-link ativo"><svg role="img" height="24" width="24"
								viewBox="0 0 24 24">
                <path
									d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                </path>
                
              </svg> Home</a></li>

					
					<li class="nav-item"><a href="user-search" class="nav-link"><svg
								role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
									d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                </path>
              </svg> Search</a></li>

				</ul>

				<div id="underList">
					<a href="userfavouritesong/${userId}"><button>
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
				<li class="nav-item"><a href="logout" class="btn "> <i
							class="fas fa-sign-out-alt me-3"></i> Logout
						</a></li>
              </ul>
              
              </div>
				<!-- End of side bar-->

				

				<hr class="mx-4 mb-0 mt-2">
			</nav>



			<!-- Main Content -->
			<div id="feed" class="w-100">

				<!-- menu superior do conteudo -->
				<nav id="topNav"
					class="d-flex justify-content-between align-items-center px-4 py-2">

					<!-- Start of arrows -->

					<div id="arrowMenu">
						
					</div>

					<!-- End of arrows-->

					<div id="btnTopNav" class="d-flex">
						<!-- Start of user profile -->
						<div>
							<a class="btn btn-secondary toggle" type="button" href="user/${userId}" 
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


				<!-- feed do conteudo principal -->
				<main id="main" class="p-4">

					<!-- seção inicial (header) -->
					<section id="feedHeader">


						<h4 class="mb-3">
							<b>Popular</b>
						</h4>

						<ul id="playlistsRecentes" class="mb-5">


						</ul>

					</section>
					<audio src="" class="audioTag">

					</audio>



					<!-- Your top mixes -->
					<section class="feedPlaylist">
						<h4 class="mb-3">
							<b>Latest Release</b>
						</h4>
						<a class="see-all" href="user-albums">SEE-ALL</a> <br> <br>
						<ul class="playlists">
							<c:forEach items="${LatestAlbumList}" var="list">
								<li><a href="systemalbum/${list.id}"
									style="text-decoration: none; color: white;"><img
										src="albumImages/${list.image}"> <span>${list.name}</span>

										<p>
											<br>${list.artist_name}</p></a></li>
							</c:forEach>
						</ul>
					</section>

					<!--recently played-->
					<section class="feedPlaylist">
						<h4 class="mb-3">
							Artist
						</h4>
						<a class="see-all" href="user-artists">SEE-ALL</a> <br> <br>
						
						<ul class="playlists">
							<c:forEach items="${PopularArtsits}" var="artists">
								<li><a href="systemartistpage/${artists.id}"
									style="text-decoration: none; color: white;"><img
										src="images/${artists.image}"> <span>${artists.name}</span></a>
								</li>

							</c:forEach>
						</ul>
					</section>



				</main>


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

				<!-- <div id="musicaPlay"></div> -->

				<div id="botomIcon">
					<ul class="nav flex-row px-2 my-4">
						<li class="nav-item"><a href="systemhomepage"
							class="nav-link ativo d-flex flex-column align-items-center"><svg
									role="img" height="20" width="20" fill="white"
									viewBox="0 0 24 24">
                  <path
										d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                  </path>
                </svg>Home</a></li>
						<li class="nav-item"><a href="user-search"
							class="nav-link d-flex flex-column align-items-center"><svg
									role="img" height="20" width="20" fill="white"
									viewBox="0 0 24 24">
                  <path
										d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                  </path>
                </svg>Search</a></li>
						
					</ul>
				</div>
				<div id="songInfo" style="color: #b3b3b3; left: 20px"
					class="position-absolute "></div>

				<div id="caixaCentral" class="d-flex flex-column align-items-center">

					<div class="container1">
						<div class="currentAndTotalTime">00:00 / 00:00</div>
						<div id="progressBar">
							<div id="currentProgress"></div>
						</div>
						<div class="musicPlayer">
							<i class="fas fa-step-backward controls previousButton"></i> <i
								class="fas fa-play-circle controls playButton"></i> <i
								class="fas fa-pause-circle controls pauseButton"></i> <i
								class="fas fa-step-forward controls nextButton"></i>

						</div>

						<div class="position-absolute heartButton" style="left: 20%">

						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<script>
		var userId = "${userId}";
	</script>
	<script src="<c:url value="/resources/js/popularsongs.js" />"></script>
	<%-- <script src="<c:url value="/resources/js/scripts.js" />"></script>
	<script src="<c:url value="/resources/js/dropdown.js" />"></script> --%>

	
</body>

</html>