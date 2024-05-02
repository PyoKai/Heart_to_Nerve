<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Heart to Nerve</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900"> 

   <link href="<c:url value="/resources/fonts/icomoon/style.css" />" rel="stylesheet">

  <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
  
  <link href="<c:url value="/resources/css/magnific-popup.css" />" rel="stylesheet">
 
   <link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
    
  <link href="<c:url value="/resources/css/owl.carousel.min.css" />" rel="stylesheet">
  
  <link href="<c:url value="/resources/css/owl.theme.default.min.css" />" rel="stylesheet">

  <link rel="stylesheet" 
  	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">

  <link href="<c:url value="/resources/css/aos.css" />" rel="stylesheet">

  <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

	<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css" />

	<link rel="stylesheet"
	href="https://unpkg.com/bs-brain@2.0.2/components/logins/login-8/assets/css/login-8.css" />
	
  <style>
    .artist-image {
      width: 125px; /* Adjust the width as needed */
      height: 130px; /* Adjust the height as needed */
    }
    .song-image{
      width:349px;
      height: 349px;
    }
  </style>

</head>
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
	
    <div class="container pt-5 hero">
      <div class="row align-items-center text-center text-md-left">
        
        <div class="col-lg-4">
          <h1 class="mb-3 display-3">One's Heart is in their Playlist.</h1>
          <p>Join with us!</p>
        </div>
        <div class="col-lg-8">
          <img src="resources/images/1x/homeimage.jpg" alt="Image" class="img-fluid">    
        </div>
      </div>
    </div>
    

    

     <div class="site-section">
      <div class="container" data-aos="fade-up">
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="font-weight-bold text-black">Popular Songs</h2>
          </div>
        </div>
        <div class="row">
          

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/BOB.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4"></h2>
                <span class="d-block mb-2 text-white-opacity-05">ကစဉ့်ကလျားသီအိုရီ</span>
                <p class="mb-4">ကမ္ဘာကြီးရဲ့ အခြားတစ်ဖက်မှာ
								လိပ်ပြာလေး အတောင်တစ်ချက်ခတ်ခြင်းက
								အစပြုသတဲ့ လေပွေ မုန်တိုင်းများ
								ဒီကမ္ဘာ တစ်ဖက်ခြမ်းမှာ
								ကစဉ့်ကလျားနဲ့ ဖြစ်လာ</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/staywithme.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Stay with me</h2>
                <span class="d-block mb-2 text-white-opacity-05"></span>
                <p class="mb-4">나의 두 눈을 감으면
                                떠오르는 그 눈동자
                                자꾸 가슴이 시려서
                                잊혀지길 바랬어
                                꿈이라면 이제 깨어났으면 제발
                                정말 네가 나의 운명인 걸까
                                넌 Falling You</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/pinkvenom.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Pink Venom</h2>
                <span class="d-block mb-2 text-white-opacity-05"></span>
                <p class="mb-4">This that pink venom, this that pink venom
                  This that pink venom (get 'em, get 'em, get 'em)
                  Straight to ya dome like whoa-whoa-whoa
                  Straight to ya dome like ah-ah-ah</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/blankspace.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Blank Space</h2>
                <span class="d-block mb-2 text-white-opacity-05"></span>
                <p class="mb-4">So it's gonna be forever
                  Or it's gonna go down in flames
                  You can tell me when it's over, mm
                  If the high was worth the pain
                  Got a long list of ex-lovers
                  They'll tell you I'm insane
                  'Cause you know I love the players
                  And you love the game</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/photograph.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Photograph</h2>
                <span class="d-block mb-2 text-white-opacity-05"></span>
                <p class="mb-4">We keep this love in a photograph
                  We made these memories for ourselves
                  Where our eyes are never closing
                  Hearts are never broken
                  And time's forever frozen, still</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="resources/images/happier_pic.jpg" alt="Image" class="img-fluid song-image">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Happier</h2>
                <span class="d-block mb-2 text-white-opacity-05"></span>
                <p class="mb-4">Ain't nobody hurt you like I hurt you
								But ain't nobody love you like I do
								Promise that I will not take it personal, baby
								If you're movin' on with someone new</p>
                <!-- <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p> -->
              </div>

            </div>
          </div>


        </div>
      </div>
    </div> 

    <div class="site-section bg-light block-13">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="font-weight-bold text-black">Popular Artists</h2>
          </div>
        </div>
        <div class="nonloop-block-13 owl-carousel">

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/selena.jpg" alt="Image" class="w-50 mx-auto img-fluid rounded-circle artist-image">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Selena Gomez</h3>
              <li>
                <small>Born : July 22, 1992</small>
              </li>
              <li>
                <small>Year active : 2002-present</small>
              </li>
              <li>
                <small>Genres : POP</small>
              </li>
              
            </div>
          </div>

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/taylor.jpg" alt="Image" class="w-50 mx-auto img-fluid rounded-circle artist-image">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Taylor Swift</h3>
              <li>
                <small>Born : Dec 13, 1989</small>
              </li>
              <li>
                <small>Year active : 2004-present</small>
              </li>
              <li>
                <small>Genres : POP</small>
              </li>
            </div>
          </div>

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/Lay_Phyu.jpg" alt="Image" class="w-50 mx-auto img-fluid rounded-circle artist-image">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Lay Phyu</h3>
              <li>
                <small>Born: May 19, 1965 </small>
              </li>
              <li>
                <small>Year active : 1992–present</small>
              </li>
              <li>
                <small>Genres : Rock</small>
              </li>
            </div>
          </div>

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/Ed Sheeran.jpg" alt="Image" class="w-50 mx-auto img-fluid rounded-circle artist-image">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Ed Sheeran</h3>
              <li>
                <small>Born: February 17, 1991</small>
              </li>
              <li>
                <small>Year active : 2004–present</small>
              </li>
              <li>
                <small>Genres : POP</small>
              </li>
            </div>
          </div>

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/blackpink.jpg" alt="Image" class="w-50 mx-auto img-fluid rounded-circle artist-image">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Blackpink</h3>
              <li>
                <small>Origin : Seoul, South Korea</small>
              </li>
              <li>
                <small>Year active : 2016-present</small>
              </li>
              <li>
                <small>Genres : K-Pop</small>
              </li>
            </div>
          </div>

          <div class="text-center p-3 p-md-5 bg-white">
            <div class="mb-4">            
              <img src="resources/images/Punch.webp" alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
            </div>
            <div class="">
              <h3 class="font-weight-light h5">Punch</h3>
              <li>
                <small>Born: February 19, 1993 </small>
              </li>
              <li>
                <small>Year active : 2004–present</small>
              </li>
              <li>
                <small>Genres : K-Pop</small>
              </li>
            </div>
          </div>

        </div>
      </div>
    </div>
    
    <!-- <div class="site-blocks-cover overlay inner-page-cover" style="background-image: url(resources/images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
            <h2>Subscribe</h2>
            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit nihil saepe libero sit odio obcaecati veniam.</p>
            <form action="#" method="post" class="site-block-subscribe">
              <div class="input-group mb-3">
                <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-primary" type="button" id="button-addon2">Send</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>   -->

<!-- 
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h3>About Us</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium animi, odio beatae aspernatur natus recusandae quasi magni eum voluptatem nam!</p>
          </div>
          <div class="col-lg-3 mx-auto">
            <h3>Navigation</h3>
            <ul class="list-unstyled">
              <li><a href="#">Podcasts</a></li>
              <li><a href="#">Services</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
          <div class="col-lg-4">
            <h3>Subscribe</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, quibusdam!</p>
            <form action="#" class="form-subscribe">
              <input type="email" class="form-control mb-3" placeholder="Enter Email">
              <input type="submit" class="btn btn-primary" value="Subscribe">
            </form>
          </div>
        </div>

        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
              Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
              Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
              Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            </p>
          </div>
          
        </div>
      </div>
    </footer> -->
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

</body>
</html>