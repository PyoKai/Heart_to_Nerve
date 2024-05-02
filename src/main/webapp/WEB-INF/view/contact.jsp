<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Heart to Nerve</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900">

<link href="<c:url value='/resources/fonts/icomoon/style.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/magnific-popup.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/owl.carousel.min.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/owl.theme.default.min.css' />" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">

<link href="<c:url value='/resources/css/aos.css' />" rel="stylesheet">

<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">

<link href="<c:url value='/resources/contact/css/style.css' />" rel="stylesheet">

<link href="<c:url value='/resources/about/css/style.css'/>" rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="https://unpkg.com/bs-brain@2.0.2/components/logins/login-8/assets/css/login-8.css" />
	
<style>
.artist-image {
	width: 125px; /* Adjust the width as needed */
	height: 130px; /* Adjust the height as needed */
}

.song-image {
	width: 349px;
	height: 349px;
}
</style>

<style>
/*  body{
            text-align: center;  
            
        }  */
.con {
	text-align: center;
	padding: 50px;
}

pre {
	/* display: flex;
	align-items: center;
	justify-content: space-between; */
	padding-top: 50px;
	font-size: 20px;
	text-align: center;
}

/* .con pre span {
        display: inline-block;
        width: 1em;
        margin-right: 1px; */


</style>



</head>
<body>

	<!-- <div class="site-wrap"> -->

	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<jsp:include page="layouts/homeheader.jsp"></jsp:include>

	<div class="backgro_mh">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heding">
						<h2>Contact us</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


<div class="con">
    <pre> PHONE      :  +959 901109256</pre>
    <pre> EMAIL      :   fantastic@gmail.com</pre>
    <pre> ADDRESS    :   N0.169 , Insein str, Myanmar </pre>
</div>

	
	<div class="row pt-8 mt-8 text-center">
		<div class="col-md-12">
			<p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				HEART TO NERVE
				<script data-cfasync="false"
					src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
				<script>document.write(new Date().getFullYear());</script>
				Music changes people's feeling / This template is made with <i
					class="icon-heart-o" aria-hidden="true"></i> by <a
					href="https://aceinspiration.com" target="_blank">Fantastic-4</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>

	</div>

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

	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>

</body>
</html>