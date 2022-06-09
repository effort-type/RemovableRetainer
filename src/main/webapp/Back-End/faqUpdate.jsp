<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%     
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("admin_id");
	String header = request.getParameter("public_header");
	String public_text = request.getParameter("public_text");
	String co = request.getParameter("public_co");
	
	 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String sql = "UPDATE faq SET header=?, public=? WHERE count=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, header);
		pstmt.setString(2, public_text);
		pstmt.setString(3, co);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		}catch(ClassNotFoundException e){
			out.println(e);
		}catch(SQLException e){
			out.println(e);
		}
	response.sendRedirect("../Front-End/faqTab.jsp");
%>
</body>
</html>