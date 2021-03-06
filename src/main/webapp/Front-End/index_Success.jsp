<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>
<%
  	String id = (String)session.getAttribute("user_id");
	request.setCharacterEncoding("UTF-8");

  	if(id != null)
  	{
  		char who = id.charAt(0);
  		if(who=='p')
   	{
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
  	                    <a href="https://www.youtube.com/watch?v=9w_pzxvAsWs" class="glightbox btn-watch-video"><i
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
							<h3><span>교정의민족</span></h3>
							<p>교정의 민족 서비스는 교정 유지 장치 착용에 대한 데이터 통계를 알려주는 서비스입니다.</p>
						  </div>
				  
						  <div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-5" data-aos="fade-right" data-aos-delay="100">
								<img src="assets/img/logo2.png" class="img-fluid" alt="">
							</div>
							<div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up"
							  data-aos-delay="100">
							  <h3>교정 유지 장치 착용 관리</h3>
							  <p class="fst-italic">
								교정 후 유지 장치를 제대로 착용하고 있는지 아닌지 잘 모르겠다면 교정의 민족 서비스를 이용해보세요~
							  </p>
							  <ul>
								<li>
								  <i class="bx bx-store-alt"></i>
								  <div class="middle">
									<h5>가철식 교정 유지장치</h5>
									<p>대표적으로 사용하는 교정 유지 장치</p>
								  </div>
								</li>
								<li>
								  <i class="bx bx-images"></i>
								  <div class="middle">
									<h5>페이스 마스크</h5>
									<p>주걱턱 교정과 치아 교정을 동시에 했을 경우 사용하는 유지 장치</p>
								  </div>
								</li>
							  </ul>
							  <p>
								지속적으로 본인의 치아 건강을 확인하며 착용 데이터를 시각적으로 확인하고 싶다면<br>
								교정의 민족 서비스를 이용해보세요
							  </p>
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
                <input class="form-check-input" type="radio" name="age" id="age2" value="20" checked>
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
                <input class="form-check-input" type="radio" name="gender" id="gender2" value="24" checked>
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
							<h3><span>온라인 예약</span></h3>
							<p>서비스 준비중</p>
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
								<p>051-890-1724</p>
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
				          <h3><span>업데이트 공지</span></h3>
				        </div>
				
				        <div class="row justify-content-center">
				          <div class="col-xl-10">
				            <ul class="faq-list">
							<%
				   				
								try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
									Statement stmt = conn.createStatement();	
									ResultSet rs = stmt.executeQuery("SELECT header, public , admin_id FROM text");
													
									int i = 1; // 공지사항 수 체크하기 위함
									while(rs.next()){
									%>	
										<li>
							                <div data-bs-toggle="collapse" class="collapsed question" href="#notice<%=i%>"><%=rs.getString("header") %><i
							                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
							                <div id="notice<%=i%>" class="collapse" data-bs-parent=".faq-list">
							                  <p>
							                    <%=rs.getString("public") %>
							                  </p>
							                </div>
						               	</li>
									<%
										i++;
									}
									rs.close();
									stmt.close();
									conn.close();
								}catch(SQLException e){
									out.println("err:"+e.toString());
								}
							%>				
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
  	                        <h3><span>자주 하는 질문</span></h3>
  	                    </div>

  	                    <div class="row justify-content-center">
  	                        <div class="col-xl-10">
  	                            <ul class="faq-list">
  	                            <%
					   				
									try{					
										Class.forName("com.mysql.jdbc.Driver");
										Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
										Statement stmt = conn.createStatement();	
										ResultSet rs = stmt.executeQuery("SELECT header, public , admin_id FROM faq");													
										int i = 1; // FAQ 수 체크하기 위함
										while(rs.next()){
										%>	
											<li>
								                <div data-bs-toggle="collapse" class="collapsed question" href="#notice<%=i%>"><%=rs.getString("header") %><i
								                    class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
								                <div id="notice<%=i%>" class="collapse" data-bs-parent=".faq-list">
								                  <p>
								                    <%=rs.getString("public") %>
								                  </p>
								                </div>
							               	</li>
										<%
											i++;
										}
										rs.close();
										stmt.close();
										conn.close();
									}catch(SQLException e){
										out.println("err:"+e.toString());
									}
								%>
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
  	                                <strong>20183127</strong><br>
  	                                <h4> 윤재혁</h4><br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-2.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20193163</strong><br>
  	                                <h4> 김희진</h4><br>
  	                            </p>
  	                        </div>
  	                        <div class="col-lg-1 col-md-6 footer-contact">
  	                            <a href="index_Success.jsp"><img src="assets/img/team/team-1.jpg" alt="교정의민족로고" height="90" width="80"></a>
  	                            <br>
  	                            <p>
  	                                <br>
  	                                <strong>20183119</strong><br>
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
 