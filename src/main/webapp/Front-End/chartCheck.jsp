<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>

<%
    request.setCharacterEncoding("UTF-8");	
		String age = request.getParameter("age"); // 나이대별로 값 들어옴 10대면 10, 20대면 20
		String gender = request.getParameter("gender"); // 남자는 13, 여자는 24
		String time = request.getParameter("time"); // 0004, 0509, 1014, 1519, 2024로 들어옴
		String device = request.getParameter("device"); // D, F로 들어옴
		
		// user 테이블에서 ssn의 8번째 인덱스가 1또는 3이면 남자, 2또는 4면 여자
		
		
		// 평균 값 계산하기 위함
		int bar_size = 0;
		int pie_size = 0;
	
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("select * from user, time where user.user_id = time.user_id and (user.user_ssn like '%-" + gender.substring(0,1) +"%' or user.user_ssn like '%-"+ gender.substring(1,2) + "%');");
			
			while(rs.next()) {
				
				bar_size = rs.getRow();
			}
			System.out.println(bar_size);
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
			ResultSet rs = stmt.executeQuery("select * from achieve, user where achieve.user_id = user.user_id and (user.user_ssn like '%-" + gender.substring(0,1) +"%' or user.user_ssn like '%-"+ gender.substring(1,2) + "%');");
			
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
			ResultSet rs = stmt.executeQuery("select * from user, time where user.user_id = time.user_id and (user.user_ssn like '%-" + gender.substring(0,1) +"%' or user.user_ssn like '%-"+ gender.substring(1,2) + "%');");
			
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
			ResultSet rs = stmt.executeQuery("select * from achieve, user where achieve.user_id = user.user_id and (user.user_ssn like '%-" + gender.substring(0,1) +"%' or user.user_ssn like '%-"+ gender.substring(1,2) + "%');");
			
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
          <li><a class="nav-link scrollto" href="index.jsp#home">Home</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#about">시스템 소개</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#services">통계</a></li>
          <li><a class="nav-link scrollto " href="#reservation">진료예약</a></li>
          <li class="dropdown"><a href="index.jsp#comu"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="index.jsp#comu">공지사항</a></li>
              <li><a href="index.jsp#faq">F.A.Q</a></li>
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

 
  <main id="main">
       <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>통계</h2>
          <h3>Check our<span><a href="charts.html"> Statistics</a></span></h3>
          <p>원하는 통계 자료를 선택해주세요</p>
        </div>

        <!-- Begin Page Content -->


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
          <div class="col-lg-3">
            <div class="info-box mb-4" style="height: 170px;">
              <input type="checkbox" class="btn-check" id="btn-check-outlined3" autocomplete="off">
              <label class="btn btn-outline-primary" for="btn-check-outlined3">시간대</label>
              <div class="form-check"><br>
                <input class="form-check-input" type="radio" name="time" id="time1" value="0004">
                <label class="form-check-label" for="time1">
                  0 ~ 4시간
                </label><br>
                <input class="form-check-input" type="radio" name="time" id="time2" value="0509">
                <label class="form-check-label" for="time2">
                  5 ~ 9시간
                </label><br>
                <input class="form-check-input" type="radio" name="time" id="time3" value="1014">
                <label class="form-check-label" for="time3">
                  10 ~ 14시간
                </label><br>
                <input class="form-check-input" type="radio" name="time" id="time4" value="1519">
                <label class="form-check-label" for="time4">
                  15 ~ 19시간
                </label><br>
                <input class="form-check-input" type="radio" name="time" id="time5" value="2024">
                <label class="form-check-label" for="time5">
                  20 ~ 24시간
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