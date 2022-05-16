<!-- sessionLoginPro.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LoginPro</title>
		<%@ page import="java.util.Date"%>
	</head>
	<body>
	<%
	// post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "0909");
	Statement stmt = conn.createStatement();	
	ResultSet rs = stmt.executeQuery("SELECT id, pw, name FROM user");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String str = "";
	
	// 아이디가 존재하는 아이디인지 아닌지 체크하는 변수
	boolean check = false;
	
	while(rs.next()) {		
		
		if(rs.getString("id").equals(id))
		{
			if(rs.getString("pw").equals(pw))
			{
				%>
				<script>
					alert("인증되었습니다.");
				</script>
				<%
				str += rs.getString("id") + ", " + rs.getString("name") + ", " + rs.getString("pw") + "<br>";
				check = true;
				out.print(str);
				break;
			} else {
				%>
				<script>
					alert("비밀번호가 다릅니다.");
					location.href = "login.html"
				</script>
				<%
			}			
		}		
	} 
	
	// DB에 입력 받은 id가 없다면 실행
	if(check == false)
	{		
		%>
		<script>
			alert("존재하지 않는 아이디입니다.");
			location.href = "login.html"
		</script>
		<%
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
	%>
	</body>
</html>
