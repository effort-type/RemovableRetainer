<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"  %>


<%
	String id = (String)session.getAttribute("user_id");	
	session.setMaxInactiveInterval(3000);
	//if(id != null) {
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile Correction Pro</title>
</head>
<body>
	<%
	// post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String nowpw = request.getParameter("nowpw");
	String corpw = request.getParameter("corpw");
	String corpwcheck = request.getParameter("corpwcheck");
	String phonenum = request.getParameter("phonenum");
	String protectorphonenum = request.getParameter("protectorphonenum");
	String address = request.getParameter("user_address");
	
	try{
		// JVM 메모리에 클래스 파일 업로드
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String str_Query = "SELECT * FROM user WHERE user_id = ?";
		//Statement stmt = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(str_Query);
		pstmt.setString(1, id);
		// 쿼리 실행, SQL문 SELECT 실행	
		ResultSet rs = pstmt.executeQuery();
		
		
		
		if(rs.next()) {
			if(!nowpw.equals(rs.getString("user_pw"))) {
				%>
		        <script>
		            alert("현재 패스워드가 일치하지 않습니다.");
		            location.href = "../Front-End/UserProfileCorrection.jsp"
		        </script>
		        <%
			}
			else if(!corpw.equals(corpwcheck)) {
				%>
		        <script>
		            alert("수정할 패스워드가 일치하지 않습니다.");
		            location.href = "../Front-End/UserProfileCorrection.jsp"
		        </script>
		        <%
			}
			else if(corpw == "") {
					String sql = "UPDATE user SET user_phone=?, family_phone=?, user_address=? WHERE user_id=?";
						
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, phonenum);
					pstmt.setString(2, protectorphonenum);
					pstmt.setString(3, address);
					pstmt.setString(4, id);
					pstmt.executeUpdate();
				%>
		        <script>
		            alert("수정되었습니다.");
		            location.href = "../Front-End/UserProfile.jsp"
		        </script>
		        <%
			}
			else {
				String sql = "UPDATE user SET user_pw=?, user_phone=?, family_phone=?, user_address=? WHERE user_id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, corpw);
				pstmt.setString(2, phonenum);
				pstmt.setString(3, protectorphonenum);
				pstmt.setString(4, address);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
				%>
		        <script>
		            alert("수정되었습니다.");
		            location.href = "../Front-End/UserProfile.jsp"
		        </script>
		        <%
			}
		} else {
			%>
	        <script>
	            alert("오류.");
	            location.href = "../Front-End/UserProfile.jsp"
	        </script>
	        <%
		}
		
	
	
	
	
	rs.close();
	pstmt.close();
	conn.close();
	}catch(ClassNotFoundException e){
		out.println(e);
	}catch(SQLException e){
		out.println(e);
	}
	%>
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