<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	String id = (String)session.getAttribute("user_id");

  	if(id != null)
  	{
  		char who = id.charAt(0);
  		if(who=='p')
   	{
  		
   	%>
  	   <!DOCTYPE html>
  	    <html lang="ko">

  	    <head>
  	        <meta charset="utf-8">
  	        <meta content="width=device-width, initial-scale=1.0" name="viewport">

  	        <title>교정의민족</title>
  	        <meta content="" name="description">
  	        <meta content="" name="keywords">

  	        <!-- Favicons -->
  	        <!--탭에 아이콘인데 apple-touch-icon이건 뭔지 몰겠음-->
  	        <link href="assets/img/favicon.png" rel="icon">
  	        <!-- 애플 사파리에서 페이지 링크 바탕화면에 만들때 뜨는 앙이콘!-->
  	        <link href="assets/img/favicon.png" rel="apple-touch-icon">

  	        <!-- Google Fonts -->
  	        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  	        <!-- Vendor CSS Files -->
  	        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  	        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  	        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  	        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  	        <!-- Template Main CSS File -->
  	        <link href="assets/css/style.css" rel="stylesheet">

  	    </head>

  	    <body>

  	        <!-- ======= Top Bar ======= -->
  	        <section id="topbar" class="d-flex align-items-center">
  	            <div class="container d-flex justify-content-center justify-content-md-between">

  	                <div class="contact-info d-flex align-items-center">
  	                    <i class="bi bi-envelope d-flex align-items-center"><a
  	            href="mailto:contact@example.com">dentalservice@sng.com</a></i>
  	                    <i class="bi bi-phone d-flex align-items-center ms-4"><span>051-890-1724</span></i>
  	                </div>
  	                <div class="social-links d-none d-md-flex align-items-center">
  	                <%
  	                switch(who){
  	              	case 'd':%>
	              		<a href="#" class="instagram">덴탈케어</a><%
  	              		break;
  	              	case 'p': %>
  	              		<a href="dental.jsp" class="instagram">덴탈케어</a><%
  	              		break;
  	                }
  	                %>
		  	  	          	            
  	            		<a class="instagram"><%=id %>님 </a>  
		  	        	<form action="../Back-End/sessionLoginPro.jsp" method="post" class="form-inline" role="form">
		  	        		<button name="logout" class="btn" style="color:#ced4da;" onclick="location.href='../Back-End/sessionLoginPro.jsp?logout=1'">로그아웃</button>
		  	             </form>
  	                </div>
  	            </div>
  	        </section>

  	        <!-- ======= Header ======= -->
  	        <header id="header" class="d-flex align-items-center">
  	            <div class="container d-flex align-items-center justify-content-between">
  	                <a href="index_Success.jsp" class="logo"><img src='https://ifh.cc/g/lbBVnh.png' border='0'></a>
  	                <nav id="navbar" class="navbar">
  	                    <ul>
  	                        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
  	                        <li><a class="nav-link scrollto" href="#about">시스템 소개</a></li>
  	                        <li><a class="nav-link scrollto" href="#services">통계</a></li>
  	                        <li><a class="nav-link scrollto " href="#reservation">진료예약</a></li>
  	                        <li class="dropdown"><a href="#comu"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
  	                            <ul>
  	                                <li><a href="#comu">공지사항</a></li>
  	                                <li><a href="#faq">F.A.Q</a></li>
  	                            </ul>
  	                        </li>
  	                        <%
  	                switch(who){
  	              	case 'd':%>
	              		<li><a class="nav-link scrollto" href="#">덴탈케어</a></li><%
  	              		break;
  	              	case 'p': %>
  	              		<li><a class="nav-link scrollto" href="dental.jsp">덴탈케어</a></li><%
  	              		break;
  	                }
  	                %>
  	                        
  	                    </ul>
  	                    <i class="bi bi-list mobile-nav-toggle"></i>
  	                </nav>
  	                <!-- .navbar -->

  	            </div>
  	        </header>
  	        <!-- End Header -->

  	        <!-- ======= Hero Section ======= -->
  	        <section id="hero" class="d-flex align-items-center">
  	            <div class="container" data-aos="zoom-out" data-aos-delay="100">
  	                <h1>Welcom to <span>교정의 민족</span></h1>
  	                <h2>교정의 민족 설명</h2>
  	                <div class="d-flex">
  	                    <!--about화면으로 넘어가는 버튼!-->
  	                    <a href="#about" class="btn-get-started scrollto">시스템 소개</a>
  	                    <!--버튼?누르면 바로 링크로 들어가서 영상보여주는듯 ㅇ-->
  	                    <a href="https://www.youtube.com/watch?v=k02azAGf5ew" class="glightbox btn-watch-video"><i
  	            class="bi bi-play-circle"></i><span>Watch Video</span></a>
  	                </div>
  	            </div>
  	        </section>
  	        <!-- End Hero -->

  	        <main id="main">
  	            <section id="section1" class="py-5"></section>
  	            <!-- ======= Featured Services Section ======= -->

  	            <!-- ======= About Section ======= -->
  	            <section id="about" class="about section-bg">
  	                <div class="container" data-aos="fade-up">

  	                    <div class="section-title">
  	                        <h2>About</h2>
  	                        <h3>알고있니~ <span>교정의민족</span></h3>
  	                        <p>교정의 민족 어쩌구 우린 기기 머 그런 통계를 알려주는 사이트야~ 알간니요? 가가가가가가가간나나나나ㅏ다다다닫</p>
  	                    </div>

  	                    <div class="row">
  	                        <div class="col-lg-1"></div>
  	                        <div class="col-lg-5" data-aos="fade-right" data-aos-delay="100">
  	                            <img src="assets/img/logo2.png" class="img-fluid" alt="">
  	                        </div>
  	                        <div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="100">
  	                            <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
  	                            <p class="fst-italic">
  	                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  	                            </p>
  	                            <ul>
  	                                <li>
  	                                    <i class="bx bx-store-alt"></i>
  	                                    <div class="middle">
  	                                        <h5>가철식 교정 유지장치</h5>
  	                                        <p>ㅇㅇMagni facilis facilis repellendus cum excepturi quaerat praesentium libre trade</p>
  	                                    </div>
  	                                </li>
  	                                <li>
  	                                    <i class="bx bx-images"></i>
  	                                    <div class="middle">
  	                                        <h5>페이스 마스크</h5>
  	                                        <p>Quo totam dolorum at pariatur aut distinctio dolorum laudantium illo direna pasata redi</p>
  	                                    </div>
  	                                </li>
  	                            </ul>
  	                            <p>
  	                                Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fuㅇ아ㅏ아ㅏㅇgiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
  	                                anim id est laborum
  	                            </p>
  	                        </div>
  	                    </div>

  	                </div>
  	            </section>
  	            <!-- End About Section -->
  	            <section id="section2" class="section-bg py-4"></section>

  	            <!-- ======= Services Section ======= -->
  	            <section id="services" class="services">
  	                <div class="container" data-aos="fade-up">

  	                    <div class="section-title">
  	                        <h2>통계</h2>
  	                        <h3>Check our<span><a href="charts.html"> Statistics</a></span></h3>
  	                        <p>원하는 통계 자료를 선택해주세요</p>
  	                    </div>

  	                    <!-- Begin Page Content -->


  	                    <!-- Page Heading  <h1>여기에 라디오 박스?</h1> -->
  	                    <form action="chartCheck.jsp" method="post">
        <div class="row align-items-center" data-aos="fade-up" data-aos-delay="50">
          <div class="col-lg-1"></div>
          <div class="col-lg-3">
            <div class="info-box mb-4" style="height: 170px;">
              <input type="checkbox" class="btn-check" id="btn-check-outlined1" autocomplete="off">
              <label class="btn btn-outline-primary" for="btn-check-outlined1">나이대</label>
              <div class="form-check">
                <br>
                <input class="form-check-input" type="radio" name="age" id="age1" value="10">
                <label class="form-check-label" for="age1">
                  10대
                </label><br>
                <input class="form-check-input" type="radio" name="age" id="age2" value="20">
                <label class="form-check-label" for="age2">
                  20대
                </label><br>
                <input class="form-check-input" type="radio" name="age" id="age3" value="30">
                <label class="form-check-label" for="age3">
                  30대
                </label><br>
                <input class="form-check-input" type="radio" name="age" id="age4" value="40">
                <label class="form-check-label" for="age4">
                  40대
                </label><br>
                <input class="form-check-input" type="radio" name="age" id="age5" value="50">
                <label class="form-check-label" for="age5">
                  50대 이상
                </label>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="info-box mb-4" style="height: 170px;">
              <input type="checkbox" class="btn-check" id="btn-check-outlined2" autocomplete="off">
              <label class="btn btn-outline-primary" for="btn-check-outlined2">성별</label>
              <div></div>
              <div class="form-check"><br>
                <input class="form-check-input" type="radio" name="gender" id="gender1" value="13">
                <label class="form-check-label" for="gender1">
                  남
                </label><br>
                <input class="form-check-input" type="radio" name="gender" id="gender2" value="24">
                <label class="form-check-label" for="gender2">
                  여
                </label>
              </div>
            </div>
          </div>
          <div class="col-lg-2">
            <div class="info-box mb-4" style="height: 170px;">
              <input type="checkbox" class="btn-check" id="btn-check-outlined4" autocomplete="off" checked disabled>
              <label class="btn btn-outline-primary" for="btn-check-outlined4">종류</label>
              <div class="form-check"><br>
                <input class="form-check-input" type="radio" name="device" id="device1" value="D" checked>
                <label class="form-check-label" for="device1">
                  가철식교정유지장치
                </label><br>
                <input class="form-check-input" type="radio" name="device" id="device2" value="F">
                <label class="form-check-label" for="device2">
                  페이스마스크
                </label>
              </div>
            </div>
          </div>
          <div class="d-sm-flex align-items-center justify-content-center mb-4">
            <input type="submit" class="btn-check" id="btn-check-2-outlined" checked autocomplete="off">
            <label class="btn btn-outline-secondary" for="btn-check-2-outlined">조회</label><br>
          </div>
          </form>

  	                    <!-- Content Row -->
  	                    <div class="row">

  	                        <div class="col-xl-8 col-lg-7">

  	                            <!-- Bar Chart -->
  	                            <div class="card shadow mb-4">
  	                                <div class="card-header py-3">
  	                                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
  	                                </div>
  	                                <div class="card-body">
  	                                    <div class="chart-bar">
  	                                        <canvas id="myBarChart"></canvas>
  	                                    </div>
  	                                </div>
  	                            </div>

  	                        </div>

  	                        <!-- Donut Chart -->
  	                        <div class="col-xl-4 col-lg-5">
  	                            <div class="card shadow mb-4">
  	                                <!-- Card Header - Dropdown -->
  	                                <div class="card-header py-3">
  	                                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
  	                                </div>
  	                                <!-- Card Body -->
  	                                <div class="card-body">
  	                                    <div class="chart-pie pt-4">
  	                                        <canvas id="myPieChart"></canvas>
  	                                    </div>
  	                                </div>
  	                            </div>
  	                        </div>
  	                    </div>
  	                </div>
  	            </section>

  	            <!-- End Services Section -->

  	            <section id="section3" class="section-bg py-5"></section>

  	            <!--예약-->
  	            <!-- ======= Reservation Section ======= -->
  	            <section id="reservation" class="reservation">
  	                <div class="container" data-aos="fade-up">

  	                    <div class="section-title">
  	                        <h2>Reservation</h2>
  	                        <h3><span>Contact Us</span></h3>
  	                        <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.
  	                        </p>
  	                    </div>

  	                    <div class="row" data-aos="fade-up" data-aos-delay="100">
  	                        <div class="col-lg-6">
  	                            <div class="info-box mb-4">
  	                                <i class="bx bx-map"></i>
  	                                <h3>Our Address</h3>
  	                                <p>부산광역시 부산진구 엄광로 176, 정보공학관 9층</p>
  	                            </div>
  	                        </div>

  	                        <div class="col-lg-3 col-md-6">
  	                            <div class="info-box  mb-4">
  	                                <i class="bx bx-envelope"></i>
  	                                <h3>Email Us</h3>
  	                                <p>SnG@email.com</p>
  	                            </div>
  	                        </div>

  	                        <div class="col-lg-3 col-md-6">
  	                            <div class="info-box  mb-4">
  	                                <i class="bx bx-phone-call"></i>
  	                                <h3>Call Us</h3>
  	                                <p>+1 5589 55488 55</p>
  	                            </div>
  	                        </div>

  	                    </div>

  	                    <div class="row" data-aos="fade-up" data-aos-delay="100">

  	                        <div class="col-lg-6 ">
  	                            <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5486.8060264972!2d129.03030759133804!3d35.14478815089559!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568ebb1648cdd27%3A0x25e803eecc5c3eff!2z64-Z7J2Y64yA7ZWZ6rWQIOqwgOyVvOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1652377196936!5m2!1sko!2skr"
  	                                frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
  	                        </div>

  	                        <div class="col-lg-6">
  	                            <form action="" method="post" role="form" class="php-email-form">
  	                                <!-- 예약시 넘어가는 그거-->
  	                                <div class="row">
  	                                    <div class="col form-group">
  	                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
  	                                    </div>
  	                                    <div class="col form-group">
  	                                        <input type='date' class="form-control" name='date' id="date" placeholder="yyyy-mm-dd" required>
  	                                        <!--  <input type="email"  name="email"  >-->
  	                                    </div>
  	                                </div>
  	                                <div class="row">
  	                                    <div class="col form-group">
  	                                        <input type="text" class="form-control" name="id" id="subject" placeholder="예약시간" required>
  	                                    </div>
  	                                    <div class="col form-group">
  	                                        <input type="text" class="form-control" name="subject" id="subject" placeholder="010-1234-1245" required>
  	                                    </div>
  	                                </div>
  	                                <div class="form-group">
  	                                    <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
  	                                </div>
  	                                <div class="my-3">
  	                                    <div class="loading">Loading</div>
  	                                    <div class="error-message"></div>
  	                                    <div class="sent-message">Your message has been sent. Thank you!</div>
  	                                </div>
  	                                <div class="text-center"><button type="submit">예약하기</button></div>
  	                            </form>
  	                        </div>

  	                    </div>

  	                </div>
  	            </section>
  	            <!-- End Contact Section -->
  	            <section id="section4" class="py-5"></section>

  	            <!-- ======= 공지사항 ======= -->
  	            <section id="comu" class="faq section-bg">
  	                <div class="container" data-aos="fade-up">

  	                    <div class="section-title">
  	                        <h2>공지사항</h2>
  	                        <h3>Frequently Asked <span>Questions</span></h3>
  	                        <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.
  	                        </p>
  	                    </div>

  	                    <div class="row justify-content-center">
  	                        <div class="col-xl-10">
  	                            <ul class="faq-list">

  	                                <li>
  	                                    <div data-bs-toggle="collapse" class="collapsed question" href="#notice1">교정치료 후 유지장치는 꼭 착용해야 하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="notice1" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
  	                                        </p>
  	                                    </div>

  	                                    <li>
  	                                        <div data-bs-toggle="collapse" href="#notice2" class="collapsed question">치아교정 유지 장치는 언제까지 해야하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                        <div id="notice2" class="collapse" data-bs-parent=".faq-list">
  	                                            <p>
  	                                                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
  	                                                cursus turpis massa tincidunt dui.
  	                                            </p>
  	                                        </div>
  	                                    </li>

  	                                    <li>
  	                                        <div data-bs-toggle="collapse" href="#notice3" class="collapsed question">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                        <div id="notice3" class="collapse" data-bs-parent=".faq-list">
  	                                            <p>
  	                                                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna
  	                                                molestie at elementum eu facilisis sed odio morbi quis
  	                                            </p>
  	                                        </div>
  	                                    </li>

  	                                    <li>
  	                                        <div data-bs-toggle="collapse" href="#notice4" class="collapsed question">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                        <div id="notice4" class="collapse" data-bs-parent=".faq-list">
  	                                            <p>
  	                                                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
  	                                                cursus turpis massa tincidunt dui.
  	                                            </p>
  	                                        </div>
  	                                    </li>

  	                                    <li>
  	                                        <div data-bs-toggle="collapse" href="#notice5" class="collapsed question">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                        <div id="notice5" class="collapse" data-bs-parent=".faq-list">
  	                                            <p>
  	                                                Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
  	                                            </p>
  	                                        </div>
  	                                    </li>

  	                                    <li>
  	                                        <div data-bs-toggle="collapse" href="#notice6" class="collapsed question">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                        <div id="notice6" class="collapse" data-bs-parent=".faq-list">
  	                                            <p>
  	                                                Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque
  	                                                diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
  	                                            </p>
  	                                        </div>
  	                                    </li>

  	                            </ul>
  	                        </div>
  	                    </div>

  	                </div>
  	            </section>

  	            <section id="section5" class="section-bg py-4"></section>
  	            <section id="section6" class="py-4"></section>
  	            <!-- ======= Frequently Asked Questions Section ======= -->
  	            <section id="faq" class="faq section-bg">
  	                <div class="container" data-aos="fade-up">

  	                    <div class="section-title">
  	                        <h2>F.A.Q</h2>
  	                        <h3>Frequently Asked <span>Questions</span></h3>
  	                        <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.
  	                        </p>
  	                    </div>

  	                    <div class="row justify-content-center">
  	                        <div class="col-xl-10">
  	                            <ul class="faq-list">

  	                                <li>
  	                                    <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">교정치료 후 유지장치는 꼭 착용해야 하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq1" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                                <li>
  	                                    <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">치아교정 유지 장치는 언제까지 해야하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq2" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
  	                                            cursus turpis massa tincidunt dui.
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                                <li>
  	                                    <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq3" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna
  	                                            molestie at elementum eu facilisis sed odio morbi quis
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                                <li>
  	                                    <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq4" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
  	                                            cursus turpis massa tincidunt dui.
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                                <li>
  	                                    <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq5" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                                <li>
  	                                    <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
  	                                    <div id="faq6" class="collapse" data-bs-parent=".faq-list">
  	                                        <p>
  	                                            Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque
  	                                            diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
  	                                        </p>
  	                                    </div>
  	                                </li>

  	                            </ul>
  	                        </div>
  	                    </div>

  	                </div>

  	            </section>
  	            <!-- End Frequently Asked Questions Section -->
  	            <section id="section7" class="section-bg py-4"></section>
  	            <!-- End Pricing Section -->




  	        </main>
  	        <!-- End #main -->

  	        <!-- ======= Footer ======= -->
  	        <footer id="footer">
  	            <!--기업설명+메뉴바-->
  	            <div class="footer-top">
  	                <div class="container">
  	                    <div class="row">
  	                        <div class="col-lg-2 col-md-6"> </div>
  	                        <div class="col-lg-3 col-md-6 footer-contact">
  	                           
  	                            <a href="index_Success.jsp"><img src="assets/img/favicon.png" alt="교정의민족로고"></a>
  	                            <p>
  	                                <br> 엄광로 176 <br> KOREA, Busan<br>
  	                                <!--United States <br>--><br>
  	                                <strong>과목:</strong> 클라우드시스템<br>
  	                                <strong>담당교수:</strong> 박유현 교수님<br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-4.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20183152</strong><br>
  	                                <h4>정민수</h4><br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-3.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20183152</strong><br>
  	                                <h4> 윤재혁</h4><br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-2.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20183152</strong><br>
  	                                <h4> 김희진</h4><br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-1.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20183152</strong><br>
  	                                <h4> 송준호</h4><br>
  	                            </p>
  	                        </div>
  	                    </div>
  	                </div>
  	            </div>

  	            <div class="container py-4">
  	                <div class="copyright">
  	                    &copy; Copyright <strong><span>SnG</span></strong>. All Rights Reserved
  	                </div>

  	                <div class="credits">
  	                    Designed by <a href="#">SnG</a>
  	                </div>
  	            </div>
  	        </footer>
  	        <!-- End Footer -->

  	        <div id="preloader"></div>
  	        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
  	      class="bi bi-arrow-up-short"></i></a>

  	        <!-- Vendor JS Files -->
  	        <script src="assets/vendor/purecounter/purecounter.js"></script>
  	        <script src="assets/vendor/aos/aos.js"></script>
  	        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  	        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  	        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  	        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  	        <script src="assets/vendor/php-email-form/validate.js"></script>

  	        <!-- Page level plugins -->
  	        <script src="vendor/chart.js/Chart.min.js"></script>

  	        <!-- Page level custom scripts -->
  	        <script src="js/demo/chart-area-demo.js"></script>
  	        <script src="js/demo/chart-pie-demo.js"></script>
  	        <script src="js/demo/chart-bar-demo.js"></script>

  	        <!-- Template Main JS File -->
  	        <script src="assets/js/main.js"></script>
  	    </body>

  	    </html> <%
    } else {
        		%>
	                       <script>                            
	                           location = "../Front-End/index.jsp"
	                       </script>
                <%
      	}
  	}else {
		%>
        <script>                            
            location = "../Front-End/index.jsp"
        </script>
<%
}
%>
 