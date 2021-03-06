<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page import ="java.text.SimpleDateFormat"%>
<%
	String id = (String)session.getAttribute("admin_id");
	String pw = (String)session.getAttribute("admin_pw");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!--아이콘-->
        <link rel="icon"
	        href="https://png.pngtree.com/png-vector/20191016/ourlarge/pngtree-dentist-stomatology-healthy-tooth-vector-icon-png-image_1804160.jpg">
		<title>FAQ 등록</title>		
	</head>
	<body>
		<%
		// post 전송 데이터 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 입력받은 값 저장
		String header = request.getParameter("public_header");
		String text = request.getParameter("public_text");
		
		java.util.Date now_temp = new java.util.Date();
		java.sql.Date now = new java.sql.Date(now_temp.getTime());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   // yyyy-MM-dd HH:mm:ss
		String format = formatter.format(now);
		
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		// SQL문 저장하고 실행하기 위한 객체 생성
		Statement stmt = conn.createStatement();
		
		String sql_insert = "insert into faq values('" + header + "', '" + text + "', '" + id + "', '" + format +"');";
		
		int count = stmt.executeUpdate(sql_insert);
		if(count == 1) {
			%>
			<script>
				alert("FAQ 등록 성공");
				location.href = "../Front-End/faqTab.jsp"
			</script>
			<%
		}
		
		stmt.close();
		conn.close();
				
		
		%>
		
	</body>
</html>