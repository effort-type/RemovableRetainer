<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>

<%
    request.setCharacterEncoding("UTF-8");	
		
		// 평균 값 계산하기 위함
		int bar_size = 0;
		int pie_size = 0;
	
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM time");
			
			while(rs.next()) {
				
				bar_size = rs.getRow();
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
		// pie 차트용
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM achieve");
			
			while(rs.next()) {
				
				// 환자 전체 통계 평균을 내기 위해서는 ArrayList 배열이 필요하기 때문에 사이즈 체크
				pie_size = rs.getRow();

			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
		// 환자 전체의 값을 다 저장하여 평균을 내기 위함
		ArrayList<Integer>[] total_times = new ArrayList[bar_size];
		for(int i = 0; i < total_times.length; i++) {
			total_times[i] = new ArrayList<>();
		}
		
		// ArrayList 배열에 값 저장하기 위함
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM time");
			
			int i = 0; // ArrayList배열 인덱스
			while(rs.next()) {
				
				total_times[i].add(rs.getInt("mon"));
				total_times[i].add(rs.getInt("tue"));
				total_times[i].add(rs.getInt("wed"));
				total_times[i].add(rs.getInt("thu"));
				total_times[i].add(rs.getInt("fri"));
				total_times[i].add(rs.getInt("sat"));
				total_times[i].add(rs.getInt("sun"));
					
				i++;
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
		// 환자 전체의 값을 다 저장하여 평균을 내기 위함
		ArrayList<Boolean>[] pie = new ArrayList[pie_size];
		for(int i = 0; i < pie.length; i++) {
			pie[i] = new ArrayList<>();
		}
		
		int total_pie_true = 0; // true 개수 체크
		int total_pie_false = 0; // false 개수 체크			
		
		// pie 차트용
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM achieve");
			
			int i = 0; //ArrayList 배열 인덱스
			while(rs.next()) {
				
				pie[i].add(rs.getBoolean("mon"));
				pie[i].add(rs.getBoolean("tue"));
				pie[i].add(rs.getBoolean("wed"));
				pie[i].add(rs.getBoolean("thu"));
				pie[i].add(rs.getBoolean("fri"));
				pie[i].add(rs.getBoolean("sat"));
				pie[i].add(rs.getBoolean("sun"));
				
				i++;
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
		for(int i = 0; i < pie_size; i++) {
			for(int j = 0; j < pie[i].size(); j++) {
				if(pie[i].get(j) == true)
					total_pie_true++;
				else
					total_pie_false++;
			}
		}
		
		double pie_result_true = ((double)total_pie_true / 7) / pie_size; // 반올림하기 위함
		total_pie_true = (int)Math.round(pie_result_true * 100);
		double pie_result_false = ((double)total_pie_false / 7) / pie_size; // 반올림하기 위함
		total_pie_false = (int)Math.round(pie_result_false * 100);
		
		ArrayList<Integer> result = new ArrayList<>();
		for(int i = 0; i < bar_size; i++) {
			for(int j = 0; j < total_times[i].size(); j++) {
				if(result.size() < 7)
					result.add(total_times[i].get(j));
				else{
					result.set(j, result.get(j) + total_times[i].get(j));
				}
			}
		}
		
		// 평균 처리
		for(int i = 0; i < result.size(); i++) {
			result.set(i, result.get(i) / bar_size);
		}
		
		%>
		
		<script>
			let barchartData = [];
			var true_pie = <%= total_pie_true%>;
			var false_pie = <%= total_pie_false%>;
			
			<%
			for(int i : result) {%>				
				barchartData.push(<%= i %>);					
			<%}%>
		</script>    
    

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
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">


	<script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="js/demo/chart-bar-demo.js"></script>
	<script type="text/javascript" src="js/demo/chart-pie-demo.js"></script>
</head>

<body onload="displayChart(barchartData); displayPieChart(true_pie, false_pie);">

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">

      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a
            href="mailto:contact@example.com">dentalservice@sng.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>051-890-1724</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <!--
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a> 
        -->
        <a onclick="return confirm('로그인이 필요합니다.')"href="login.html" class="instagram">덴탈케어</a>
        <a href="login.html" class="linkedin">로그인</i></a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">


      <a href="index.jsp" class="logo"><img src='https://ifh.cc/g/lbBVnh.png' border='0'></a>
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
          
          <!--로그인했으면 바로 dental.html 로그인 안했으면 login.html로-->
          <li><a class="nav-link scrollto" onclick="return confirm('로그인이 필요합니다.')" href="login.html">덴탈케어</a></li>
          <li><a class="nav-link scrollto" href="login.html">로그인</a></li>
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
        <!--버튼?누르면 바로 링크로 들어가서 영상보여주는듯 ㅇ https://youtu.be/xiodq-7seYA-->
        <a href="https://youtu.be/3H0WjJNijLY" class="glightbox btn-watch-video"><i
            class="bi bi-play-circle"></i><span>Watch Video</span></a>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">
    <section id="section1" class="py-5"></section>
         
    </section>
-->
    <!-- End Featured Services Section -->

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
          <div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up"
            data-aos-delay="100">
            <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
            <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore
              magna aliqua.
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
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
              voluptate
              velit esse cillum dolore eu fuㅇ아ㅏ아ㅏㅇgiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in
              culpa qui officia deserunt mollit anim id est laborum
            </p>
          </div>
        </div>

      </div>
    </section>
    <!-- End About Section -->
    <section id="section2" class="section-bg py-4"></section>
    <!-- ======= Skills Section ======= -->
        <!-- End Clients Section -->

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
                <div class="card-body pd-3">
                  <div class="chart-bar pbm-1">
                    <canvas id="myBarChart"></canvas>
                  </div>
                  <hr>
                  <!-- <hr> Styling for the bar chart can be found in the
                      <code>/js/demo/chart-bar-demo.js</code> file.-->
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
                  <hr>
                  <!--  <hr> Styling for the donut chart can be found in the
                      <code>/js/demo/chart-pie-demo.js</code> file.-->
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
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae
            autem.</p>
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
            <iframe class="mb-4 mb-lg-0"
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5486.8060264972!2d129.03030759133804!3d35.14478815089559!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568ebb1648cdd27%3A0x25e803eecc5c3eff!2z64-Z7J2Y64yA7ZWZ6rWQIOqwgOyVvOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1652377196936!5m2!1sko!2skr"
              frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
          </div>
          <!--
      <div class="col-lg-3">
      달력
      </div>
    -->
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
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="010-1234-1245"
                    required>
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
    </section><!-- End Contact Section -->
    <section id="section4" class="py-5"></section>

    <!-- ======= 공지사항 ======= -->
    <section id="comu" class="faq section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>공지사항</h2>
          <h3>Frequently Asked <span>Questions</span></h3>
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae
            autem.</p>
        </div>

        <div class="row justify-content-center">
          <div class="col-xl-10">
            <ul class="faq-list">

              <li>
                <div data-bs-toggle="collapse" class="collapsed question" href="#notice1">교정치료 후 유지장치는 꼭 착용해야 하나요? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice1" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur
                    gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                  </p>
                </div>

              <li>
                <div data-bs-toggle="collapse" href="#notice2" class="collapsed question">치아교정 유지 장치는 언제까지 해야하나요? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice2" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id
                    donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque
                    elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#notice3" class="collapsed question">Dolor sit amet consectetur
                  adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice3" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar
                    elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque
                    eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis
                    sed odio morbi quis
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#notice4" class="collapsed question">Ac odio tempor orci dapibus.
                  Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice4" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id
                    donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque
                    elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#notice5" class="collapsed question">Tempus quam pellentesque nec
                  nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice5" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in.
                    Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est.
                    Purus gravida quis blandit turpis cursus in
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#notice6" class="collapsed question">Tortor vitae purus faucibus
                  ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="notice6" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada
                    nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut
                    venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas
                    egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
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
          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae
            autem.</p>
        </div>

        <div class="row justify-content-center">
          <div class="col-xl-10">
            <ul class="faq-list">

              <li>
                <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">교정치료 후 유지장치는 꼭 착용해야 하나요? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq1" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur
                    gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">치아교정 유지 장치는 언제까지 해야하나요? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq2" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id
                    donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque
                    elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Dolor sit amet consectetur
                  adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq3" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar
                    elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque
                    eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis
                    sed odio morbi quis
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Ac odio tempor orci dapibus.
                  Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq4" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id
                    donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque
                    elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">Tempus quam pellentesque nec nam
                  aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i
                    class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq5" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in.
                    Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est.
                    Purus gravida quis blandit turpis cursus in
                  </p>
                </div>
              </li>

              <li>
                <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">Tortor vitae purus faucibus
                  ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i
                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                <div id="faq6" class="collapse" data-bs-parent=".faq-list">
                  <p>
                    Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada
                    nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut
                    venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas
                    egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
                  </p>
                </div>
              </li>

            </ul>
          </div>
        </div>

      </div>

    </section><!-- End Frequently Asked Questions Section -->
    <section id="section7" class="section-bg py-4"></section>
    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    
    <!--기업설명+메뉴바-->
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-2 col-md-6"> </div>
          <div class="col-lg-3 col-md-6 footer-contact">
            
            <a href="index.jsp"><img src="assets/img/favicon.png" alt="교정의민족로고"></a>
            <p>
              <br>
              엄광로 176 <br>
              KOREA, Busan<br>
              <!--United States <br>--> <br>
              <strong>과목:</strong> 클라우드시스템<br>
              <strong>담당교수:</strong> 박유현 교수님<br>
            </p>
          </div>
          <div class="col-lg-1 col-md-6 footer-contact">
            <a href="index.jsp"><img src="assets/img/team/team-4.jpg" alt="교정의민족로고" height="90" width="80"></a>
            <br>
            <p>
              <br>
              <strong>20183152</strong><br>
            <h4>정민수</h4><br>
            </p>
          </div>
          <div class="col-lg-1 col-md-6 footer-contact">
            <a href="index.jsp"><img src="assets/img/team/team-3.jpg" alt="교정의민족로고" height="90" width="80"></a>
            <br>
            <p>
              <br>
              <strong>20183152</strong><br>
            <h4> 윤재혁</h4><br>
            </p>
          </div>
          <div class="col-lg-1 col-md-6 footer-contact">
            <a href="index.jsp"><img src="assets/img/team/team-2.jpg" alt="교정의민족로고" height="90" width="80"></a>
            <br>
            <p>
              <br>
              <strong>20183152</strong><br>
            <h4> 김희진</h4><br>
            </p>
          </div>
          <div class="col-lg-1 col-md-6 footer-contact">
            <a href="index.jsp"><img src="assets/img/team/team-1.jpg" alt="교정의민족로고" height="90" width="80"></a>
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
  </footer><!-- End Footer -->


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

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

</body>

</html>