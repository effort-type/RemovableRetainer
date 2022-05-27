<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");	
	session.setMaxInactiveInterval(3000);
	if(id != null) {
	%>
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
		
		</head>
		
		<body id="page-top">
		
		    <!-- Page Wrapper -->
		    <div id="wrapper">
		
		        <!-- Sidebar -->
		        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		
		            <!-- Sidebar - Brand -->
		            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dental.jsp">
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
		            <li class="nav-item">
		                <a class="nav-link" href="charts.jsp">
		                    <i class="fas fa-fw fa-chart-area"></i>
		                    <span>Charts</span></a>
		            </li>
		
		            <!-- Nav Item - Tables -->
		            <li class="nav-item active">
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
		                    <form class="form-inline">
		                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		                            <i class="fa fa-bars"></i>
		                        </button>
		                    </form>
		
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
		                                <a class="dropdown-item" href="#">
		                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
		                                </a>
		                                <a class="dropdown-item" href="#">
		                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
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
		                    <h1 class="h3 mb-2 text-gray-800">착용 시간 데이터 베이스</h1>
		                    <p class="mb-4">착용 시간 관련 데이터 보여주는 곳</p>
		
		                    <!-- DataTales Example -->
		                    <div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary">내 착용 시간 데이터</h6>
		                        </div>
		                        <div class="card-body">
		                            <div class="table-responsive">
		                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                                    <thead>
		                                        <tr>
		                                            <th>이름</th>
		                                            <th>유지 장치 종류</th>
		                                            <th>나이</th>
		                                            <th>착용 시작 시간</th>
		                                            <th>착용 종료 시간</th>
		                                            <th>총 착용 시간</th>
		                                        </tr>
		                                    </thead>
		                                    <tfoot>
		                                        <tr>
		                                            <th>이름</th>
		                                            <th>유지 장치 종류</th>
		                                            <th>나이</th>
		                                            <th>착용 시작 시간</th>
		                                            <th>착용 종료 시간</th>
		                                            <th>총 착용 시간</th>
		                                        </tr>
		                                    </tfoot>
		
		                                    <!--여기부터 DB에서 값 읽어와서 보여줘야함-->
		                                    <tbody>
		                                        <tr>
		                                            <td>Tiger Nixon</td>
		                                            <td>System Architect</td>
		                                            <td>Edinburgh</td>
		                                            <td>61</td>
		                                            <td>2011/04/25</td>
		                                            <td>$320,800</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Garrett Winters</td>
		                                            <td>Accountant</td>
		                                            <td>Tokyo</td>
		                                            <td>63</td>
		                                            <td>2011/07/25</td>
		                                            <td>$170,750</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Ashton Cox</td>
		                                            <td>Junior Technical Author</td>
		                                            <td>San Francisco</td>
		                                            <td>66</td>
		                                            <td>2009/01/12</td>
		                                            <td>$86,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Cedric Kelly</td>
		                                            <td>Senior Javascript Developer</td>
		                                            <td>Edinburgh</td>
		                                            <td>22</td>
		                                            <td>2012/03/29</td>
		                                            <td>$433,060</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Airi Satou</td>
		                                            <td>Accountant</td>
		                                            <td>Tokyo</td>
		                                            <td>33</td>
		                                            <td>2008/11/28</td>
		                                            <td>$162,700</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Brielle Williamson</td>
		                                            <td>Integration Specialist</td>
		                                            <td>New York</td>
		                                            <td>61</td>
		                                            <td>2012/12/02</td>
		                                            <td>$372,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Herrod Chandler</td>
		                                            <td>Sales Assistant</td>
		                                            <td>San Francisco</td>
		                                            <td>59</td>
		                                            <td>2012/08/06</td>
		                                            <td>$137,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Rhona Davidson</td>
		                                            <td>Integration Specialist</td>
		                                            <td>Tokyo</td>
		                                            <td>55</td>
		                                            <td>2010/10/14</td>
		                                            <td>$327,900</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Colleen Hurst</td>
		                                            <td>Javascript Developer</td>
		                                            <td>San Francisco</td>
		                                            <td>39</td>
		                                            <td>2009/09/15</td>
		                                            <td>$205,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Sonya Frost</td>
		                                            <td>Software Engineer</td>
		                                            <td>Edinburgh</td>
		                                            <td>23</td>
		                                            <td>2008/12/13</td>
		                                            <td>$103,600</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jena Gaines</td>
		                                            <td>Office Manager</td>
		                                            <td>London</td>
		                                            <td>30</td>
		                                            <td>2008/12/19</td>
		                                            <td>$90,560</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Quinn Flynn</td>
		                                            <td>Support Lead</td>
		                                            <td>Edinburgh</td>
		                                            <td>22</td>
		                                            <td>2013/03/03</td>
		                                            <td>$342,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Charde Marshall</td>
		                                            <td>Regional Director</td>
		                                            <td>San Francisco</td>
		                                            <td>36</td>
		                                            <td>2008/10/16</td>
		                                            <td>$470,600</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Haley Kennedy</td>
		                                            <td>Senior Marketing Designer</td>
		                                            <td>London</td>
		                                            <td>43</td>
		                                            <td>2012/12/18</td>
		                                            <td>$313,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Tatyana Fitzpatrick</td>
		                                            <td>Regional Director</td>
		                                            <td>London</td>
		                                            <td>19</td>
		                                            <td>2010/03/17</td>
		                                            <td>$385,750</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Michael Silva</td>
		                                            <td>Marketing Designer</td>
		                                            <td>London</td>
		                                            <td>66</td>
		                                            <td>2012/11/27</td>
		                                            <td>$198,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Paul Byrd</td>
		                                            <td>Chief Financial Officer (CFO)</td>
		                                            <td>New York</td>
		                                            <td>64</td>
		                                            <td>2010/06/09</td>
		                                            <td>$725,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Gloria Little</td>
		                                            <td>Systems Administrator</td>
		                                            <td>New York</td>
		                                            <td>59</td>
		                                            <td>2009/04/10</td>
		                                            <td>$237,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Bradley Greer</td>
		                                            <td>Software Engineer</td>
		                                            <td>London</td>
		                                            <td>41</td>
		                                            <td>2012/10/13</td>
		                                            <td>$132,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Dai Rios</td>
		                                            <td>Personnel Lead</td>
		                                            <td>Edinburgh</td>
		                                            <td>35</td>
		                                            <td>2012/09/26</td>
		                                            <td>$217,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jenette Caldwell</td>
		                                            <td>Development Lead</td>
		                                            <td>New York</td>
		                                            <td>30</td>
		                                            <td>2011/09/03</td>
		                                            <td>$345,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Yuri Berry</td>
		                                            <td>Chief Marketing Officer (CMO)</td>
		                                            <td>New York</td>
		                                            <td>40</td>
		                                            <td>2009/06/25</td>
		                                            <td>$675,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Caesar Vance</td>
		                                            <td>Pre-Sales Support</td>
		                                            <td>New York</td>
		                                            <td>21</td>
		                                            <td>2011/12/12</td>
		                                            <td>$106,450</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Doris Wilder</td>
		                                            <td>Sales Assistant</td>
		                                            <td>Sidney</td>
		                                            <td>23</td>
		                                            <td>2010/09/20</td>
		                                            <td>$85,600</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Angelica Ramos</td>
		                                            <td>Chief Executive Officer (CEO)</td>
		                                            <td>London</td>
		                                            <td>47</td>
		                                            <td>2009/10/09</td>
		                                            <td>$1,200,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Gavin Joyce</td>
		                                            <td>Developer</td>
		                                            <td>Edinburgh</td>
		                                            <td>42</td>
		                                            <td>2010/12/22</td>
		                                            <td>$92,575</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jennifer Chang</td>
		                                            <td>Regional Director</td>
		                                            <td>Singapore</td>
		                                            <td>28</td>
		                                            <td>2010/11/14</td>
		                                            <td>$357,650</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Brenden Wagner</td>
		                                            <td>Software Engineer</td>
		                                            <td>San Francisco</td>
		                                            <td>28</td>
		                                            <td>2011/06/07</td>
		                                            <td>$206,850</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Fiona Green</td>
		                                            <td>Chief Operating Officer (COO)</td>
		                                            <td>San Francisco</td>
		                                            <td>48</td>
		                                            <td>2010/03/11</td>
		                                            <td>$850,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Shou Itou</td>
		                                            <td>Regional Marketing</td>
		                                            <td>Tokyo</td>
		                                            <td>20</td>
		                                            <td>2011/08/14</td>
		                                            <td>$163,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Michelle House</td>
		                                            <td>Integration Specialist</td>
		                                            <td>Sidney</td>
		                                            <td>37</td>
		                                            <td>2011/06/02</td>
		                                            <td>$95,400</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Suki Burks</td>
		                                            <td>Developer</td>
		                                            <td>London</td>
		                                            <td>53</td>
		                                            <td>2009/10/22</td>
		                                            <td>$114,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Prescott Bartlett</td>
		                                            <td>Technical Author</td>
		                                            <td>London</td>
		                                            <td>27</td>
		                                            <td>2011/05/07</td>
		                                            <td>$145,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Gavin Cortez</td>
		                                            <td>Team Leader</td>
		                                            <td>San Francisco</td>
		                                            <td>22</td>
		                                            <td>2008/10/26</td>
		                                            <td>$235,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Martena Mccray</td>
		                                            <td>Post-Sales support</td>
		                                            <td>Edinburgh</td>
		                                            <td>46</td>
		                                            <td>2011/03/09</td>
		                                            <td>$324,050</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Unity Butler</td>
		                                            <td>Marketing Designer</td>
		                                            <td>San Francisco</td>
		                                            <td>47</td>
		                                            <td>2009/12/09</td>
		                                            <td>$85,675</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Howard Hatfield</td>
		                                            <td>Office Manager</td>
		                                            <td>San Francisco</td>
		                                            <td>51</td>
		                                            <td>2008/12/16</td>
		                                            <td>$164,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Hope Fuentes</td>
		                                            <td>Secretary</td>
		                                            <td>San Francisco</td>
		                                            <td>41</td>
		                                            <td>2010/02/12</td>
		                                            <td>$109,850</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Vivian Harrell</td>
		                                            <td>Financial Controller</td>
		                                            <td>San Francisco</td>
		                                            <td>62</td>
		                                            <td>2009/02/14</td>
		                                            <td>$452,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Timothy Mooney</td>
		                                            <td>Office Manager</td>
		                                            <td>London</td>
		                                            <td>37</td>
		                                            <td>2008/12/11</td>
		                                            <td>$136,200</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jackson Bradshaw</td>
		                                            <td>Director</td>
		                                            <td>New York</td>
		                                            <td>65</td>
		                                            <td>2008/09/26</td>
		                                            <td>$645,750</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Olivia Liang</td>
		                                            <td>Support Engineer</td>
		                                            <td>Singapore</td>
		                                            <td>64</td>
		                                            <td>2011/02/03</td>
		                                            <td>$234,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Bruno Nash</td>
		                                            <td>Software Engineer</td>
		                                            <td>London</td>
		                                            <td>38</td>
		                                            <td>2011/05/03</td>
		                                            <td>$163,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Sakura Yamamoto</td>
		                                            <td>Support Engineer</td>
		                                            <td>Tokyo</td>
		                                            <td>37</td>
		                                            <td>2009/08/19</td>
		                                            <td>$139,575</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Thor Walton</td>
		                                            <td>Developer</td>
		                                            <td>New York</td>
		                                            <td>61</td>
		                                            <td>2013/08/11</td>
		                                            <td>$98,540</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Finn Camacho</td>
		                                            <td>Support Engineer</td>
		                                            <td>San Francisco</td>
		                                            <td>47</td>
		                                            <td>2009/07/07</td>
		                                            <td>$87,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Serge Baldwin</td>
		                                            <td>Data Coordinator</td>
		                                            <td>Singapore</td>
		                                            <td>64</td>
		                                            <td>2012/04/09</td>
		                                            <td>$138,575</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Zenaida Frank</td>
		                                            <td>Software Engineer</td>
		                                            <td>New York</td>
		                                            <td>63</td>
		                                            <td>2010/01/04</td>
		                                            <td>$125,250</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Zorita Serrano</td>
		                                            <td>Software Engineer</td>
		                                            <td>San Francisco</td>
		                                            <td>56</td>
		                                            <td>2012/06/01</td>
		                                            <td>$115,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jennifer Acosta</td>
		                                            <td>Junior Javascript Developer</td>
		                                            <td>Edinburgh</td>
		                                            <td>43</td>
		                                            <td>2013/02/01</td>
		                                            <td>$75,650</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Cara Stevens</td>
		                                            <td>Sales Assistant</td>
		                                            <td>New York</td>
		                                            <td>46</td>
		                                            <td>2011/12/06</td>
		                                            <td>$145,600</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Hermione Butler</td>
		                                            <td>Regional Director</td>
		                                            <td>London</td>
		                                            <td>47</td>
		                                            <td>2011/03/21</td>
		                                            <td>$356,250</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Lael Greer</td>
		                                            <td>Systems Administrator</td>
		                                            <td>London</td>
		                                            <td>21</td>
		                                            <td>2009/02/27</td>
		                                            <td>$103,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Jonas Alexander</td>
		                                            <td>Developer</td>
		                                            <td>San Francisco</td>
		                                            <td>30</td>
		                                            <td>2010/07/14</td>
		                                            <td>$86,500</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Shad Decker</td>
		                                            <td>Regional Director</td>
		                                            <td>Edinburgh</td>
		                                            <td>51</td>
		                                            <td>2008/11/13</td>
		                                            <td>$183,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Michael Bruce</td>
		                                            <td>Javascript Developer</td>
		                                            <td>Singapore</td>
		                                            <td>29</td>
		                                            <td>2011/06/27</td>
		                                            <td>$183,000</td>
		                                        </tr>
		                                        <tr>
		                                            <td>Donna Snider</td>
		                                            <td>Customer Support</td>
		                                            <td>New York</td>
		                                            <td>27</td>
		                                            <td>2011/01/25</td>
		                                            <td>$112,000</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
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
		    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
		    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
		
		    <!-- Page level custom scripts -->
		    <script src="js/demo/datatables-demo.js"></script>
		
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
		