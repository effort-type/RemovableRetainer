<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!--아이콘-->
        <link rel="icon"
	        href="https://png.pngtree.com/png-vector/20191016/ourlarge/pngtree-dentist-stomatology-healthy-tooth-vector-icon-png-image_1804160.jpg">
		<title>비밀번호 찾기</title>	
	</head>
	<body>
		<%
		// post 전송 데이터 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 입력받은 값 저장
		String id = request.getParameter("id");
		String ssn = request.getParameter("ssn");		
		String name = request.getParameter("name");
		String user = request.getParameter("user");
		
		// 비밀번호를 저장하기 위한 변수
		String pw = "";
		
		// 아이디가 기존에 있는지 없는지 체크하는 변수
		boolean check = false;
		
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		// SQL문 저장하고 실행하기 위한 객체 생성
		Statement stmt = conn.createStatement();
		ResultSet rs = null;
		
		
		if(user.equals("user")) {
			// 쿼리 실행, SQL문 SELECT 실행
			rs = stmt.executeQuery("SELECT user_id, user_pw, user_name, user_ssn FROM user;");
			
			while(rs.next()) {
				if(rs.getString("user_id").equals(id) && rs.getString("user_name").equals(name) && rs.getString("user_ssn").equals(ssn)) {
					// DB에 동일한 id 값이 존재한다면 true로 변경
					pw = rs.getString("user_pw");
					check = true;				
					break;
				}
			}
		}else if(user.equals("doctor")) {
			// 쿼리 실행, SQL문 SELECT 실행
			rs = stmt.executeQuery("SELECT doctor_id, doctor_pw, doctor_name, doctor_ssn FROM doctor;");
			
			while(rs.next()) {
				if(rs.getString("doctor_id").equals(id) && rs.getString("doctor_name").equals(name) && rs.getString("doctor_ssn").equals(ssn)) {
					// DB에 동일한 id 값이 존재한다면 true로 변경
					pw = rs.getString("doctor_pw");
					check = true;				
					break;
				}
			}
		}else {
			// 쿼리 실행, SQL문 SELECT 실행
			rs = stmt.executeQuery("SELECT hospital_id, hospital_pw, hospital_name FROM hospital;");
			
			while(rs.next()) {
				if(rs.getString("hospital_id").equals(id) && rs.getString("hospital_name").equals(name) && rs.getString("head_name").equals(ssn)) {
					// DB에 동일한 id 값이 존재한다면 true로 변경
					pw = rs.getString("hospital_pw");
					check = true;				
					break;
				}
			}
		}
		
		
		
		
		if(check == true)
		{
			%>
			<script>
				alert("비밀번호 : " + <%=pw%>);
				location.href = "../Front-End/login.html"
			</script>			
			<%
		} else {
			%>
			<script>
				alert("입력된 정보에 해당하는 정보는 존재하지 않습니다.");
				location.href = "../Front-End/forgotPassword.html"
			</script>
			<%
		}
		
		rs.close();
		stmt.close();
		conn.close();
		%>
	</body>
</html>