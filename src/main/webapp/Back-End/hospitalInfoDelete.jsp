<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String hospital_id = request.getParameter("hospital_id");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String sql = "DELETE FROM hospital WHERE hospital_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hospital_id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		}catch(ClassNotFoundException e){
			out.println(e);
		}catch(SQLException e){
			out.println(e);
		}
	response.sendRedirect("../Front-End/hospitalInfoTab.jsp");
%>
</body>
</html>