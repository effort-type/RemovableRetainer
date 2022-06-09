<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*"  %>

<%
	String id = (String)session.getAttribute("user_id");	
	session.setMaxInactiveInterval(3000);
	//if(id != null) {
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
		String str_Query = "SELECT * FROM user WHERE user_id = ?";
		//Statement stmt = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(str_Query);
		pstmt.setString(1, id);
		// 쿼리 실행, SQL문 SELECT 실행	
		ResultSet rs = pstmt.executeQuery();
		
		String dbPw = null;
		String dbPhone = null;
		String dbFamilyPhone = null;
		String dbAddress = null;
		
		if(rs.next()) {
			dbPw = rs.getString("user_pw");
			dbPhone = rs.getString("user_phone");
			dbFamilyPhone = rs.getString("family_phone");
			dbAddress = rs.getString("user_address");
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
						<h1 class="h3 mb-0 text-gray-800">개인 정보 수정</h1>
					</div>
					
					<div id="formContent" class="container">
						<!-- Tabs Titles -->
						<!-- Icon -->
						<div class="fadeIn first">
							<img
								src="data:image/jpeg;base64,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"
								id="icon" alt="User Icon" />
						</div>

						<!-- signup Form -->

						<form action="../Back-End/UserProfileCorrectionPro.jsp" method="post"
							class="form-inline" role="form">
							<div class="form-group">
							<div class="col-md-12">
									현재 패스워드 : <input type="password" class="form-control" name="nowpw"
										placeholder="PW" minlength="4" maxlength="8" required>
								</div>
								<div class="col-md-12">
									<!--비밀번호 최소 4자리, 최대 8자리 입력하도록 제한 -->
									수정할 패스워드 : <input type="password" class="form-control" name="corpw"
										placeholder="PW" minlength="4" maxlength="8">
								</div>
								<div class="col-md-12">
									<!--비밀번호 최소 4자리, 최대 8자리 입력하도록 제한 -->
									패스워드 확인 : <input type="password" class="form-control" name="corpwcheck"
										placeholder="PW 확인" minlength="4" maxlength="8">
								</div>
								<div class="col-md-12">
									전화 번호 : <input type="text" class="form-control" name="phonenum"
										placeholder="전화 번호" value="<%=dbPhone%>" required>
								</div>
								<div class="col-md-12">
									보호자 전화 번호 : <input type="text" class="form-control" name="protectorphonenum"
										placeholder="보호자 전화 번호" value="<%=dbFamilyPhone%>" required>
								</div>
								<div class="col-md-12">
									주소 : <textarea class="form-control" placeholder="주소" name="user_address"
                                 		maxlength="512"><%= dbAddress %></textarea>
									<%-- 주소 : <input type="text" class="form-control" name="address"
										placeholder="주소" minlength="1" maxlength="30" value="<%=dbAddress%>" required> --%>
								</div>
								<div class="col-md-4">
									<!-- <button type="submit" class="btn btn-primary">수정 완료</button> -->
									<input type="submit" class="btn btn-primary pull-right" value="수정" onclick="return confirm('환자 정보를 수정합니다.')">
								</div>
							</div>
						</form>
						
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
					<a class="btn btn-primary" onclick="location.href='../Back-End/sessionLoginPro.jsp?logout=1'">Logout</a>
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
	//} else {
		%>
			<!-- <script>
				alert('로그인이 필요한 페이지입니다.');
				location = "login.html"
			</script> -->
<%
	//}
%>
