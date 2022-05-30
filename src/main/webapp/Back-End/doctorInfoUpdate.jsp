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
	String doctor_id = request.getParameter("doctor_id");
	String doctor_name = request.getParameter("doctor_name");
	String doctor_phone = request.getParameter("doctor_phone");
	    
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String sql = "update doctor set doctor_name=?,doctor_phone=? where doctor_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, doctor_name);
		pstmt.setString(2, doctor_phone);
		pstmt.setString(3, doctor_id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		}catch(ClassNotFoundException e){
			out.println(e);
		}catch(SQLException e){
			out.println(e);
		}
	response.sendRedirect("../Front-End/doctorInfoDetail.jsp?doctor_id="+ doctor_id);
%>
</body>
</html>