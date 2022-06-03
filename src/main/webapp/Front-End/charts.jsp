<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>

<%
	String id = (String)session.getAttribute("user_id");	
	session.setMaxInactiveInterval(3000);
	if(id != null) {
		
		// 착용 시간 값 저장 (본인)
		ArrayList<Integer> times = new ArrayList<>();
		
		// ArrayList 배열에 값 저장하기 위함
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM time");
			
			while(rs.next()) {		
				
				// 로그인한 id랑 같을 때 본인의 총 착용 시간을 출력하기 위함
				if(id.equals(rs.getString("user_id"))) {
					times.add(rs.getInt("mon"));
					times.add(rs.getInt("tue"));
					times.add(rs.getInt("wed"));
					times.add(rs.getInt("thu"));
					times.add(rs.getInt("fri"));
					times.add(rs.getInt("sat"));
					times.add(rs.getInt("sun"));
				}
					
			}			
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}		
		
		// 목표 달성 여부 값 저장 (본인)
		ArrayList<Boolean> pie = new ArrayList<>();

		int personal_pie_true = 0; // 달성 개수 체크 (본인)				
		int personal_pie_false = 0;
		
		// pie 차트용
		try{			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
			Statement stmt = conn.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM achieve");
			
			while(rs.next()) {
				
				if(id.equals(rs.getString("user_id"))) {
					pie.add(rs.getBoolean("mon"));
					pie.add(rs.getBoolean("tue"));
					pie.add(rs.getBoolean("wed"));
					pie.add(rs.getBoolean("thu"));
					pie.add(rs.getBoolean("fri"));
					pie.add(rs.getBoolean("sat"));
					pie.add(rs.getBoolean("sun"));	
					
					for(int i = 0; i < pie.size(); i++) {
						if(pie.get(i) == true)
							personal_pie_true++;
					}
				}
			
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		double personal_pie_temp = personal_pie_true; // 반올림하기 위한 임시 변수
		personal_pie_true = (int)Math.round((personal_pie_temp * 100) / 7);
		personal_pie_false = 100 - personal_pie_true;
		
		%>
		
		<script>
			let barchartData = [];
			var true_pie = <%= personal_pie_true%>;
			var false_pie = <%= personal_pie_false%>;
			
			<%
			for(int i : times) {%>				
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
		    
 			<script type="text/javascript" src="js/demo/chart-bar-demo.js"></script>
			<script type="text/javascript" src="js/demo/chart-pie-demo.js"></script>
		
		</head>
		
		<body id="page-top" onload="displayChart(barchartData); displayPieChart(true_pie, false_pie);">
		
		    <!-- Page Wrapper -->
		    <div id="wrapper">
		
		        <!-- Sidebar -->
		        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		
		            <!-- Sidebar - Brand -->
		            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index_Success.jsp">
		                <!--교정의 민족 로고 이미지-->
		                <div class="sidebar-brand-icon">
		                    <img src="https://ifh.cc/g/HRCfNv.png" width="140" height="40" />
		                </div>
		            </a>
		
		            <!-- Divider -->
		            <hr class="sidebar-divider my-0">
		
		            <!-- Nav Item - Dashboard -->
		            <li class="nav-item">
		                <a class="nav-link" href="dental.jsp">
		                    <i class="fas fa-fw fa-tachometer-alt"></i>
		                    <span>Dashboard</span></a>
		            </li>
		
		            <!-- Divider -->
		            <hr class="sidebar-divider">
		
		
		            <!-- Nav Item - Charts -->
		            <li class="nav-item active">
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
		                        <!-- <h6 class="collapse-header">Login Screens:</h6>
		                        <a class="collapse-item" href="login.html">Login</a>
		                        <a class="collapse-item" href="register.html">Register</a> -->
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
		                                    <!-- 뭐 넣을지 생각하기-->
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
		    <script src="vendor/jquery/jquery.min.js"></script>
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
	} else {
		%>
			<script>
				alert('로그인이 필요한 페이지입니다.');
				location = "login.html"
			</script>
		<%
	}
		%>
		