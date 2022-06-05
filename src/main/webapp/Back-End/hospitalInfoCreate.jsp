<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!--아이콘-->
        <link rel="icon"
	        href="https://png.pngtree.com/png-vector/20191016/ourlarge/pngtree-dentist-stomatology-healthy-tooth-vector-icon-png-image_1804160.jpg">
		<title>병원 등록</title>		
	</head>
	<body>
		<%
		// post 전송 데이터 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 입력받은 값 저장
		String hospital_id = request.getParameter("hospital_id");
		String hospital_pw = request.getParameter("hospital_pw");
		String name = request.getParameter("hospital_name");
		String hospital_address = request.getParameter("hospital_address");
		String hospital_phone = request.getParameter("hospital_phone");
		String business_num = request.getParameter("business_num");
		String head_name = request.getParameter("head_name");
		
		// 아이디가 기존에 있는지 없는지 체크하는 변수
		boolean check = false;
		
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		// SQL문 저장하고 실행하기 위한 객체 생성
		Statement stmt = conn.createStatement();
		// 쿼리 실행, SQL문 SELECT 실행
		ResultSet rs = stmt.executeQuery("SELECT hospital_id FROM hospital");
		
		String sql_insert = "INSERT INTO hospital VALUES";
		sql_insert += "('" + hospital_id + "', '" + hospital_pw + "', '" + name + "', '" + hospital_address + "', '" + hospital_phone + "', '" + business_num + "', '" + head_name + "')";
		
		// DB에 저장된 값 중에 입력받은 id와 동일한 id 값이 존재하는지 확인하는 while문
		while(rs.next()) {
			if(rs.getString("hospital_id").equals(hospital_id)) {
				// DB에 동일한 id 값이 존재한다면 true로 변경
				check = true;
				break;
			}
		}
		
		// 기존에 아이디가 DB에 없는 아이디일 경우 실행
		if(check == false) {
			int count = stmt.executeUpdate(sql_insert);
			if(count == 1) {
				%>
				<script>
					alert("병원 등록 성공");
					location.href = "../Front-End/hospitalInfoTab.jsp"
				</script>
				<%
			}
		} else {
			%>
			<script>
				alert("이미 동일한 아이디로 가입되어있습니다.");
				location.href = "../Front-End/hospitalInfoTab.jsp"
			</script>
			<%
		}
		
		rs.close();
		stmt.close();
		conn.close();
		%>
	</body>
</html>