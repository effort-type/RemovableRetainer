<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*"  %>

<%
	String id = (String)session.getAttribute("user_id");	
	session.setMaxInactiveInterval(3000);
	if(id != null) {
	%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>교정의 민족</title>

<!--title icon-->
<link rel="icon" href="https://ifh.cc/g/PzdK3r.png">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">





</head>

<body id="page-top">
	<%
	// post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	
	try{
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		//세션의 id이용하여 쿼리문 작성
		String str_Query = "SELECT * FROM test WHERE id = ?";
		//Statement stmt = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(str_Query);
		pstmt.setString(1, id);
		//pstmt.executeUpdate();
		// 쿼리 실행, SQL문 SELECT 실행	
		ResultSet rs = pstmt.executeQuery();
		
		String dbId = null;
		String dbName = null;
		String dbSSN = null;
		String dbTargetTime = null;
		String dbPhoneNum = null;
		String dbProtectorPhoneNum = null;
		String dbAddress = null;
		
		if(rs.next()) {
			dbId = rs.getString("id");
			dbName = rs.getString("name");
			dbSSN = rs.getString("ssn");
			dbTargetTime = rs.getString("targettime");
			dbPhoneNum = rs.getString("phonenum");
			dbProtectorPhoneNum = rs.getString("protectorphonenum");
			dbAddress = rs.getString("address");
			//후에 DB속성 추가후 더 넣어야함
		}
	
	%>
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="dental.jsp"> <!--교정의 민족 로고 이미지-->
				<div class="sidebar-brand-icon">
					<img src="https://ifh.cc/g/HRCfNv.png" width="140" height="40" />
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="dental.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">


			<!-- Nav Item - Charts -->
			<li class="nav-item "><a class="nav-link" href="charts.jsp">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.jsp">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link"
				href="CreatePatientAccount.jsp"> <i class="fas fa-fw fa-cog"></i>
					<span>Create Patient Account</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<!-- <h6 class="collapse-header">Login Screens:</h6>
		                        <a class="collapse-item" href="login.html">Login</a>
		                        <a class="collapse-item" href="register.html">Register</a> -->
						<a class="collapse-item" href="forgot-password.html">Change
							Password</a>
						<div class="collapse-divider"></div>
					</div>
				</div></li>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>



						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"><%=id %>님</span>
								<img class="img-profile rounded-circle"
								src="img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="UserProfile.jsp"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">개인 정보</h1>
					</div>
					<div>
						ID : <%= dbId %>
						이름 : <%= dbName %>
						주민번호 : 
						병원 : 
						담당의사 :
						유지장치 종류 : 
						유지장치 착용 시작일 :
						유지장치 착용 종료일 :
						
						 
						<div class="card shadow mb-4">
						<div class="card-body">
								
								
								<table class="table table-bordered" id="patientTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th colspan="6" style="background-color:#c4cde7; color:#18181a;">
											<%=dbName %> </th>
										</tr>
									</thead>
									<!--여기부터 DB에서 값 읽어와서 보여줘야함-->

									<tbody>
									<tr>
										<th>ID</th>
											<td><%=dbId %></td>
										<th>주민 번호</th>
											<td><%=dbSSN %></td>
										<th>하루 착용 목표 시간</th>
											<td><%=dbTargetTime %></td>
									</tr>
									<tr>
										<th>전화번호</th>
											<td><%=dbPhoneNum %></td>
										<th>보호자 전화번호</th>
											<td><%=dbProtectorPhoneNum %></td>
									</tr>
									<tr>
										<th>주소</th>
											<td><%=dbAddress %></td>
									</tr>
										
									</tbody>
								</table>
							</div>
					</div>
						
					</div>
					<div class="col-md-2">
						<!-- 개인정보 수정하는 페이지로 이동하는 버튼  -->
						<a href="UserProfileCorrection.jsp" class="btn btn-primary">수정</a>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<%
		rs.close();
		pstmt.close();
		conn.close();
	
	}catch(ClassNotFoundException e){
		out.println(e);
	}catch(SQLException e){
		out.println(e);
	}
	%>
	
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script src="js/demo/chart-bar-demo.js"></script>
	
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
