<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %><%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("admin_id");
	String pw = (String)session.getAttribute("admin_pw");
  	if(id != null)
  	{
  		char who = id.charAt(0);

  		if(who=='a')
   	{%>
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
			<link
				href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
				rel="stylesheet">

			<!-- Custom styles for this template-->
			<link href="css/sb-admin-2.min.css" rel="stylesheet">

		</head>

		<body id="page-top">

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
					<li class="nav-item"><a class="nav-link" href="hospitalInfoTab.jsp">
						<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
					</a></li>

					<!-- Divider -->
					<hr class="sidebar-divider my-0">

					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item active"><a class="nav-link" href="createHospitalInfo.jsp"> <i
						class="fas fa-fw fa-cog"></i> <span>Hospital Sign Up</span>
					</a>
						<div id="collapsePages" class="collapse" aria-labelledby="headingPages"
							data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<!-- <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a> -->
								<a class="collapse-item" href="forgot-password.html">Change
									Password</a>
								<div class="collapse-divider"></div>
							</div>
						</div>
					</li>
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
		
					<li class="nav-item"><a class="nav-link" href="announcementCreate.jsp">
							<i class="fas fa-fw fa-cog"></i> <span>공지사항 등록</span>
					</a></li>
					
					<!-- Divider -->
					<hr class="sidebar-divider my-0">
		
					<!-- Nav Item - Dashboard -->
					<li class="nav-item"><a class="nav-link" href="faqCreate.jsp">
							<i class="fas fa-fw fa-cog"></i> <span>FAQ 등록</span>
					</a></li>

				</ul>
				<!-- End of Sidebar -->
				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">

					<!-- Main Content -->
					<div id="content">

						<!-- Topbar -->
						<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

							<!-- Sidebar Toggle (Topbar) -->
							<form class="form-inline">
								<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
									<i class="fa fa-bars"></i>
								</button>
							</form>

							<!-- Topbar Navbar -->
							<ul class="navbar-nav ml-auto">

								<!-- Nav Item - Search Dropdown (Visible Only XS) -->
								<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle"
										href="#" id="searchDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
									</a> <!-- Dropdown - Messages -->
									<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
										aria-labelledby="searchDropdown">
										<form class="form-inline mr-auto w-100 navbar-search">
											<div class="input-group">
												<input type="text" class="form-control bg-light border-0 small"
													placeholder="Search for..." aria-label="Search"
													aria-describedby="basic-addon2">
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
								<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
										id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <span
											class="mr-2 d-none d-lg-inline text-gray-600 small"><%=id%> 님</span> <img class="img-profile rounded-circle"
											src="img/undraw_profile.svg">
									</a> <!-- Dropdown - User Information -->
									<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
										aria-labelledby="userDropdown">
										<a class="dropdown-item" href="#"> <i
												class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
										</a> 
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#" data-toggle="modal"
											data-target="#logoutModal"> <i
												class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											Logout
										</a>
									</div>
								</li>

							</ul>

						</nav>
						<!-- End of Topbar -->

						<!-- Begin Page Content -->
						<div class="container-fluid">
							
								<form mehod="post"	action="../Back-End/hospitalInfoCreate.jsp">
									<!-- Page Heading -->
									
										<h1 class="h3 mb-2 text-gray-800">
											치과 등록
										</h1>

										<!-- DataTales Example -->
										<div class="card shadow mb-4">
											<div class="card-body">
											<table class="table table-bordered" id="hospitalTable" width="100%"
													height="500" cellspacing="0">
													<thead>
														<tr>
															<th colspan="6"
																style="background-color:#c4cde7; color:#18181a;">
																병원 정보</th>
														</tr>
													</thead>
													
													<tbody>
														<tr>
															<th style="background-color: #eeeeee;">병원명</th>
															<td>
																<input type="text" class="form-control" placeholder="병원명" name="hospital_name" maxlength="20" required>
															</td>
															<th style="background-color: #eeeeee;">아이디</th>
															<th>
																<input type="text" class="form-control"
																	placeholder="아이디" name="hospital_id" minlength="4" required>
															</th>
															<th style="background-color: #eeeeee;">비밀번호</th>
															<td><input type="password" class="form-control"
																	placeholder="비번" name="hospital_pw" minlength="4" required>
															</td>
														</tr>
														<tr>
															<th style="background-color: #eeeeee;">병원장 이름</th>
															<th><input type="text" class="form-control"
																	placeholder="병원장 이름" name="head_name"  maxlength="5" required>
															</th>
															<th style="background-color: #eeeeee;">주소</th>
															<th colspan="3"><textarea class="form-control"
																	placeholder="주소" name="hospital_address"
																	maxlangth="512" required></textarea>
															</th>
														</tr>
														<tr>
															<th style="background-color: #eeeeee;">병원 전화 번호</th>
																<th><input type="text" class="form-control"
																	placeholder="병원 전화 번호" name="hospital_phone" maxlength="13" required>
															</th>
															<th style="background-color: #eeeeee;">사업자 번호</th>
															<td colspan="3">
																<input type="text" class="form-control"
																	placeholder="사업자 번호" name="business_num" minlength="12" required>

															</td>
														</tr>
														<tr>
															<th colspan="6" style="text-align: center;">
																<a href="../Front-End/hospitalInfoTab.jsp"
																	class="btn btn-primary">취소</a>
																<input type="submit" class="btn btn-primary pull-right"
																	value="등록"
																	onclick="return confirm('병원 정보를 등록합니다.')">
																
															</th>
														</tr>
													</tbody>
												</table>
								</form>
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
			<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
			</a>

			<!-- Logout Modal-->
			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are ready
							to end your current session.</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" onclick="location.href='../Back-End/sessionLoginPro.jsp?logout=1'">Logout</a>
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
			<script src="vendor/datatables/jquery.dataTables.min.js"></script>
			<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="js/demo/datatables-demo.js"></script>

		</body>

		</html><%
    } else {
        	%>
    	    <script>
	             alert("접근권한이 없습니다.");
	             history.back()
       		</script>
                <%
      	}
  	}else {
		%>
        <script>        
        	alert("로그인이 필요한 서비스입니다.");
            location = "../Front-End/login.html"
        </script>
<%
}
%>