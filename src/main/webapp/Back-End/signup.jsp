<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ page import="java.util.Date"%>
		<!--아이콘-->
        <link rel="icon"
	        href="https://png.pngtree.com/png-vector/20191016/ourlarge/pngtree-dentist-stomatology-healthy-tooth-vector-icon-png-image_1804160.jpg">
		<title>회원가입</title>		
	</head>
	<body>
		<%
		// post 전송 데이터 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 입력받은 값 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw_check = request.getParameter("pw_ch");
		String name = request.getParameter("name");
		
		// 아이디가 기존에 있는지 없는지 체크하는 변수
		boolean check = false;
		
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		// SQL문 저장하고 실행하기 위한 객체 생성
		Statement stmt = conn.createStatement();
		// 쿼리 실행, SQL문 SELECT 실행
		ResultSet rs = stmt.executeQuery("SELECT id, pw, name FROM user");
		
		// PW와 확인PW가 동일한지 체크
		if(pw.equals(pw_check)) {
			String sql_insert = "INSERT INTO user(id, pw, name) VALUES";
			sql_insert += "('" + id + "', '" + pw + "', '" + name + "')";
			
			// DB에 저장된 값 중에 입력받은 id와 동일한 id 값이 존재하는지 확인하는 while문
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
					// DB에 동일한 id 값이 존재한다면 true로 변경
					check = true;
					break;
				}
			}
			
			// 기존에 아이디가 DB에 없는 아이디일 경우 실행
			if(check == false) {
				int count = stmt.executeUpdate(sql_insert);
				if(count == 1) {
					out.print("회원가입 성공");
					%>
					<script>
						location.href = "login.html"
					</script>
					<%
				}
			} else {
				out.print("이미 동일한 아이디로 가입되어있습니다.");
			}
		} else {
			out.print("비밀번호가 다릅니다.");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		%>
	</body>
</html>