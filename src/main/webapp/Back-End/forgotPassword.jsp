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
		// 쿼리 실행, SQL문 SELECT 실행
		ResultSet rs = stmt.executeQuery("SELECT id, pw, name, ssn FROM test");
		
		while(rs.next()) {
			if(rs.getString("id").equals(id) && rs.getString("name").equals(name) && rs.getString("ssn").equals(ssn)) {
				// DB에 동일한 id 값이 존재한다면 true로 변경
				pw = rs.getString("pw");
				check = true;				
				break;
			}
		}
		
		
		if(check == true)
		{
			%>
			<script>
				alert("비밀번호 : " + <%=pw%>);
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