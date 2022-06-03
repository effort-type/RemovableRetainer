<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.text.*" %>
    <%
    request.setCharacterEncoding("UTF-8");
    
    session.setMaxInactiveInterval(3000);
	String id = (String)session.getAttribute("user_id");
	String pw = (String)session.getAttribute("user_pw");
	
	java.util.Date now_temp = new java.util.Date();
	java.sql.Date start = new java.sql.Date(now_temp.getTime());
	java.sql.Date end = new java.sql.Date(now_temp.getTime());
	
	
	java.sql.Date now = new java.sql.Date(now_temp.getTime());
	
	
// 	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");   // yyyy-MM-dd HH:mm:ss
// 	String format = formatter.format(now);
	
	long result_time = 0; // 총 착용해야하는 일수
	long now_time = 0; // 현재 착용한 일수
	long remain = 0; // 남은 일수
	
	if(id != null) {
		
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
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM user");
			
			while(rs.next()) {
				
				if(id.equals(rs.getString("user_id"))) {
					start = rs.getDate("device_start");
					end = rs.getDate("device_end");
					result_time = ChronoUnit.DAYS.between(start.toLocalDate(), end.toLocalDate()) + 1;	
				}			
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
		now_time = ChronoUnit.DAYS.between(start.toLocalDate(), now.toLocalDate()) + 1;
		
		remain = result_time - now_time;
		System.out.println(remain);
		
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
		
		int personal_times = 0; // 유지 장치 총 착용 시간 (본인)
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
				
				// 로그인한 id랑 같을 때 본인의 총 착용 시간을 출력하기 위함
				if(id.equals(rs.getString("user_id"))) {
					for(int j = 0; j < total_times[i].size(); j++) {
						personal_times += total_times[i].get(j);
					}
				}
					
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
		
		int personal_pie_true = 0; // 달성 개수 체크 (본인)				
		
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
				
				
				if(id.equals(rs.getString("user_id"))) {
					for(int j = 0; j < pie[i].size(); j++) {
						if(pie[i].get(j) == true) {
							personal_pie_true++;
						}
					}
				}
				
				i++;
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		double personal_pie_temp = personal_pie_true; // 반올림하기 위한 임시 변수
		personal_pie_true = (int)Math.round((personal_pie_temp * 100) / 7);
		
		for(int i = 0; i < pie_size; i++) {
			for(int j = 0; j < pie[i].size(); j++) {
				if(pie[i].get(j) == true)
					total_pie_true++;
				else
					total_pie_false++;
			}
		}
		
		double pie_result_true = ((double)total_pie_true / 7) / pie_size;
		total_pie_true = (int)Math.round(pie_result_true * 100);
		total_pie_false = (int)Math.round(((total_pie_false * 100) / 7) / pie_size);
		
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
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>교정의 민족</title>

            <!--title icon-->
            <link rel="icon" href="https://ifh.cc/g/PzdK3r.png">

            <!-- Custom fonts for this template-->
            <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
            <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

            <!-- Custom styles for this template-->
            <link href="css/sb-admin-2.min.css" rel="stylesheet">
            
            <script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
			<script type="text/javascript" src="js/demo/chart-bar-demo.js"></script>
			<script type="text/javascript" src="js/demo/chart-pie-demo.js"></script>
        </head>		
        <body id="page-top" onload="displayChart(barchartData); displayPieChart(true_pie, false_pie);">
        	
            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion " id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index_Success.jsp">
                        <!--교정의 민족 로고 이미지-->
                        <div class="sidebar-brand">
                            <img src="https://ifh.cc/g/HRCfNv.png" width="140" height="40" />
                        </div>
                    </a>

                    <!-- Divider -->
                    <hr class="sidebar-divider my-0">

                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item active">
                        <a class="nav-link" href="dental.jsp">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">


                    <!-- Nav Item - Charts -->
                    <li class="nav-item">
                        <a class="nav-link" href="charts.jsp">
                            <i class="fas fa-fw fa-chart-area"></i>
                            <span>Charts</span></a>
                    </li>

                    <!-- Nav Item - Tables -->
                    <li class="nav-item">
                        <a class="nav-link" href="tables.jsp">
                            <i class="fas fa-fw fa-table"></i>
                            <span>Tables</span></a>
                    </li>

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link" href="CreatePatientAccount.jsp">
                            <i class="fas fa-fw fa-cog"></i>
                            <span>Create Patient Account</span>
                        </a>
                        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">

                                <a class="collapse-item" href="forgot-password.html">Change Password</a>
                                <div class="collapse-divider"></div>
                            </div>
                        </div>
                    </li>

                </ul>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                            <!-- Sidebar Toggle (Topbar) -->
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		                        <i class="fa fa-bars"></i>
		                    </button>

                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                <li class="nav-item dropdown no-arrow d-sm-none">
                                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-search fa-fw"></i>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                        <form class="form-inline mr-auto w-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button">
		                                                <i class="fas fa-search fa-sm"></i>
		                                            </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </li>



                                <div class="topbar-divider d-none d-sm-block"></div>

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=id %>님</span>
                                        <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="UserProfile.jsp">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
                                        </a>
                                        <a class="dropdown-item" href="#">
                                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
                                        </a>
                                        <a class="dropdown-item" href="#">
                                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
                                        </a>
                                    </div>
                                </li>

                            </ul>

                        </nav>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">덴탈 서비스</h1>
                            </div>

                            <!-- Content Row -->
                            <div class="row">

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                        총 착용 시간</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%= personal_times %></div>
                                                </div>

                                                <div class="col-auto">
                                                    <i class="fas fa-tachometer-alt fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-success shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                        총 착용 일</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%= now_time %></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-info shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">하루 목표 달성치
                                                    </div>
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=personal_pie_true%>%</div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="progress progress-sm mr-2">
                                                                <div class="progress-bar bg-info" role="progressbar" style="width: <%=personal_pie_true%>%" aria-valuenow="<%=personal_pie_true %>" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Pending Requests Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        남은 착용 일</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">D-<%= remain %></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-chart-area fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->
                            <div class="row">

                                <div class="col-xl-8 col-lg-7">



                                    <!-- Bar Chart -->
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">일별 착용 정보</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-bar">
                                                <canvas id="myBarChart"></canvas>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>

                                </div>

                                <!-- Donut Chart -->
                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">착용 목표 시간 달성 여부</h6>
                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-pie pt-4">
                                                <canvas id="myPieChart"></canvas>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>SnG &copy; 교정의 민족 Website 2022</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">×</span>
		                    </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript-->

            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/chart.js/Chart.min.js"></script>

        </body>

        </html>
        <%
	} else{
		%>
            <script>
                alert('로그인이 필요한 페이지입니다.');
                location = "login.html"
            </script>

            <%
	}
		
		%>